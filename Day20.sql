WITH cte AS (
    SELECT 
        s.student_id,
        s.subject,
        FIRST_VALUE(score) OVER (
            PARTITION BY student_id, subject 
            ORDER BY exam_date
        ) AS first_score,
        FIRST_VALUE(score) OVER (
            PARTITION BY student_id, subject 
            ORDER BY exam_date DESC
        ) AS latest_score
    FROM scores s
)
SELECT * 
FROM cte 
GROUP BY student_id, subject 
HAVING first_score < latest_score;