select book_id, title, author, genre, publication_year, current_borrowers 
from library_books
join (select book_id, count(*) as current_borrowers 
from borrowing_records
where return_date is null
group by book_id) t1
using(book_id)
where total_copies - current_borrowers = 0
order by current_borrowers desc, title