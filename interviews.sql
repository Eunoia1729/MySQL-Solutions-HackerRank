SELECT CONTESTS.CONTEST_ID, 
        HACKER_ID, 
        NAME, 
        IFNULL(SUM(tot_subs), 0),
        IFNULL(SUM(tot_acc_subs), 0),
        IFNULL(SUM(tot_views), 0),
        IFNULL(SUM(tot_u_views), 0)
FROM CONTESTS
JOIN (
    SELECT CONTEST_ID , CHALLENGE_ID 
    FROM CHALLENGES
    RIGHT JOIN COLLEGES ON CHALLENGES.COLLEGE_ID = COLLEGES.COLLEGE_ID
    GROUP BY CONTEST_ID, CHALLENGE_ID
) CHAL ON CONTESTS.CONTEST_ID = CHAL.CONTEST_ID
LEFT JOIN (
    SELECT challenge_id, 
            sum(total_views) as tot_views, 
            sum(total_unique_views) as tot_u_views
    FROM view_stats
    group by challenge_id
) VS ON CHAL.CHALLENGE_ID = VS.CHALLENGE_ID
LEFT JOIN (
    SELECT challenge_id, 
            sum(total_submissions) as tot_subs, 
            sum(total_accepted_submissions) as tot_acc_subs
    FROM submission_stats
    group by challenge_id
) SS ON CHAL.CHALLENGE_ID = SS.CHALLENGE_ID
GROUP BY CONTESTS.CONTEST_ID, HACKER_ID, NAME
HAVING (IFNULL(SUM(tot_subs), 0) + 
        IFNULL(SUM(tot_acc_subs), 0) + 
        IFNULL(SUM(tot_views), 0) + 
        IFNULL(SUM(tot_u_views), 0) > 0)