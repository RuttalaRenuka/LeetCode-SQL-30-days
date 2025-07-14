WITH GroupFilterCTE AS(
    -- rows with equal groupID are consecutive
    SELECT *, id - ROW_NUMBER() OVER(ORDER BY id) groupID
    FROM Stadium
    WHERE people >= 100
)

SELECT id, visit_date, people
FROM GroupFilterCTE
WHERE groupID IN (
    SELECT groupID
    FROM GroupFilterCTE
    GROUP BY groupID
    HAVING COUNT(*) >=3
)
ORDER BY visit_date ASC;