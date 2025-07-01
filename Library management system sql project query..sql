create database Library_m_system;
use Library_m_system;
--1) List all books with their titles, authors, and publication years.
    select book_title ,author,rental_price from books;
    select * from books;

------2)Find all members who have borrowed at least one book.
       select * from issued_status;
     select * from members;
     select  distinct m.member_name,m.member_id,i.issued_member_id
     from members m
     inner join issued_status i 
     on m.member_id=i.issued_member_id;
    
--3)List all branches along with the number of employees in each.
    select * from branch;
    select * from employees;
    select b.branch_id, e.emp_name
    from branch b 
    join employees e 
    on b.branch_id=e.branch_id;
   
--4) Display all currently issued books with issue date,issued_book_name, and member name.
     select * from issued_status;
     select issued_id, issued_date,issued_book_name from issued_status;
     
	--5)Which employees are working in the ‘Main’ branch?
        select * from employees;
         select * from branch;
         select b.branch_id, e.branch_id, b.branch_address
         from employees e
         join branch b
         on b.branch_id=e.branch_id
         where b.branch_address='main';
         
--6) List all members who joined in the last 6 months.
      select * from members;
      select * from members
      where reg_date>=curdate();
      
--7) Find the total number of books issued per branch.
    select * from branch;
    select branch_id,count(*) as total_books_issued
    from branch
    group by branch_id;
    
8)Which book has been issued the most times?
   select * from issued_status;
   select * from books; 
   select b.isbn,b.book_title,count(i.issued_book_isbn) as issue_count
   from issued_status i 
   join books b
   on b.isbn=i.issued_book_isbn
   group by b.isbn,b.book_title;
   
--9) Find members who have not returned any of their issued books yet.
         select * from return_status;
         select * from members;
         select * from issued_status;
         select distinct m.member_id, m.member_name,count(r.issued_id)
         from members m
         join issued_status i 
         on m.member_id=i.issued_member_id
         left join return_status r 
         on r.issued_id=i.issued_id
         group by m.member_id, m.member_name
         having count(r.issued_id)=0;
         
