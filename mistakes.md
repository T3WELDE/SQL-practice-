# Mistakes I made and the rule I learned

## Syntax
- Use `=` for comparing, not `==`.
- Text goes in single quotes: `'shipped'`. Numbers have no quotes or currency symbols: `100`, not `£100`.
- Dates are written `'2022-01-01'` (YYYY-MM-DD). Unquoted `01/01/2022` is read as a division.
- Check table and column names before running. `orders` not `order` (reserved word), `amount` not `price`, `customer_id` not `customerid`.
- No trailing comma before FROM.
- A joined table needs `ON`, not a second `JOIN`.

## Aggregates and grouping
- Questions saying "per X" or "for each X" need `GROUP BY X`.
- Anything in SELECT must be in the GROUP BY or be an aggregate (COUNT, SUM, AVG).
- WHERE filters rows before grouping. HAVING filters groups after counting.
- Use a date range like `>= '2022-01-01' AND < '2023-01-01'` so timestamps on the last day are not missed.

## Joins
- INNER JOIN keeps only rows that match in both tables.
- LEFT JOIN keeps every row from the left table and fills the right side with NULL where there is no match.
- Self join: use the same table twice with two nicknames, matching `e.manager_id = m.employee_id`.
- Give tables different nicknames (`o` and `c`), not the same one twice.

## Window functions
- `PARTITION BY` takes a column, never a table name. Use it when the question says "for each Y".
- Leave out PARTITION BY for one ranking across everything.
- The ORDER BY inside `OVER (...)` decides the numbering or ranking. The ORDER BY at the end only sorts the output.
- ROW_NUMBER never repeats. RANK repeats on ties then skips.
- Choose a partition column where many rows share a value, not a unique id.

## Subqueries and CTEs
- The inner query runs first and the outer query only sees what the inner one selected.
- A subquery in FROM needs a name (`AS sub`).
- A histogram is an aggregate of an aggregate: count per user, then count users per count.
- CTE: `WITH name AS (...)`, comma between CTEs, no comma after the last one.

## Python
- A function that is only defined prints nothing. Call it and `print(...)` the result.
- `True` and `False` are capitalised.
- `def` lines need a colon, and the body needs indenting.

## Git
- `git add` stages, `git commit` saves a snapshot, `git push` uploads to GitHub.
- Check file names exactly. `style.css` is not `styles.css`.
- Commit names do not go after `git commit`. The commit is created by committing.
