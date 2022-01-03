select t4.submission_date, hacker_count, top_hacker, name
from (
    select submission_date, count(distinct hacker_id) as hacker_count
    from (
        select s1.submission_date, s1.hacker_id
        from submissions s1
        join submissions s2 on (s2.submission_date <= s1.submission_date and s1.hacker_id = s2.hacker_id)
        group by s1.submission_date, s1.hacker_id
        having count(distinct s2.submission_date) = 1 + datediff(s1.submission_date, '2016-03-01')
    ) tmp
    group by submission_date
) t4
join (
    select t3.submission_date, min(t2.hacker_id) as top_hacker, max_count
    from(
        select submission_date, max(sub_count) as max_count
        from (
            select submission_date,
                    count(distinct submission_id) as sub_count
            from hackers
            right join submissions s on hackers.hacker_id = s.hacker_id
            group by submission_date, hackers.hacker_id
        ) t 
        group by submission_date
    ) t3
    join (
        select submission_date, 
                hackers.hacker_id, 
                count(distinct submission_id) as sub_count
        from hackers
        right join submissions s on hackers.hacker_id = s.hacker_id
        group by submission_date, hackers.hacker_id
        having count(distinct submission_id) > 0
    ) t2 on (t3.submission_date = t2.submission_date and t3.max_count = t2.sub_count)
    group by t3.submission_date, max_count
) t5 on t4.submission_date = t5.submission_date
join hackers on t5.top_hacker = hackers.hacker_id
order by t4.submission_date;