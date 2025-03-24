-- Project TASK


-- ### 2. CRUD Operations


-- Task 1. Create a New Book Record
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher)
VALUES
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')


-- Task 2: Update an Existing Member's Address

update members 
SET member_address = '125 Main St'
WHERE member_id = 'C101';




-- Task 3: Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS104' from the issued_status table.
SELECT * FROM issued_status
WHERE issued_id = 'IS121';

DELETE FROM issued_status
WHERE issued_id = 'IS121'

-- Task 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

SELECT * FROM issued_status
WHERE issued_emp_id = 'E101';


-- Task 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.
select  a.member_name, b.issued_member_id from issued_status b,members a where 
b.issued_member_id=a.member_id group by 1,2 having count(*) >1;


-- ### 3. CTAS (Create Table As Select)

-- Task 6: Create Summary Tables**: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt

CREATE TABLE book_cnts
AS    
SELECT 
    b.isbn,
    b.book_title,
    COUNT(ist.issued_id) as no_issued
FROM books as b
JOIN
issued_status as ist
ON ist.issued_book_isbn = b.isbn
GROUP BY 1, 2;

select * from book_cnts

-- ### 4. Data Analysis & Findings

-- Task 7. **Retrieve All Books as per the  Category:

select category, COUNT(*) AS number_of_books from books group by category


-- Task 8: Find Total Rental Income by Category:
select a.category , sum(a.rental_price),count(*) from books a, issued_status b where a.isbn=b.issued_book_isbn
group by a.category


-- Task 9. **List Members Who Registered in the Last 180 Days**:
SELECT * FROM members
WHERE reg_date >= now() - INTERVAL '180 days' 


-- Task 10: List Employees with Their Branch Manager's Name and their branch details**:

select a.* , b.manager_id ,c.emp_name as Manager from
employees a join branch b on a.branch_id=b.branch_id 
join employees c on b.manager_id = c.emp_id



-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold
DROP TABLE IF EXISTS Costly_books;
create table Costly_books as
select * from books where rental_price >=5

select * from Costly_books

-- Task 12: Retrieve the List of Books Not Yet Returned

SELECT 
    DISTINCT ist.issued_book_name
FROM issued_status as ist
LEFT JOIN
return_status as rs
ON ist.issued_id = rs.issued_id
WHERE rs.return_id IS NULL
    
/*Trigger to Ensure Employee Salary is Positive
Prevents inserting or updating an employee with a negative salary.*/
CREATE OR REPLACE FUNCTION prevent_negative_salary()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.salary < 0 THEN
        RAISE EXCEPTION 'Salary cannot be negative!';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_salary
BEFORE INSERT OR UPDATE ON employees
FOR EACH ROW
EXECUTE FUNCTION prevent_negative_salary();

select * from employees
--example
update employees set salary = -500 where salary = 43000.00


/*A VIEW is a virtual table that displays data based on a specific SQL query. 
It does not store data itself but dynamically retrieves data when queried.*/

/*1. Create a View for Issued Books Details
This view will show details of issued books, including the book title, issued date, 
member name, and employee who issued it.*/


CREATE VIEW issued_books_details AS
SELECT 
    i.issued_id, 
    i.issued_date, 
    i.issued_book_isbn, 
    b.book_title, 
    m.member_name, 
    e.emp_name AS issued_by
FROM issued_status i
JOIN books b ON i.issued_book_isbn = b.isbn
JOIN members m ON i.issued_member_id = m.member_id
JOIN employees e ON i.issued_emp_id = e.emp_id;

--Query the View
--Now, we can retrieve data from the view just like a regular table:

SELECT * FROM issued_books_details;

--Dropping the View (If Needed)
DROP VIEW issued_books_details;





