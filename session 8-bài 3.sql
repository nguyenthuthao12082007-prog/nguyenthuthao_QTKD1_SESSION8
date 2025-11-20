create database thuvien;
use thuvien;
create table book(
book_id int primary key,
title varchar(100),
author varchar(150),
publication_year int,
pages int
);

create table BorrowingRecords(
record_id int primary key,
book_id int,
foreign key (book_id) references book(book_id),
borrow_date date
);

SELECT COUNT(*) AS total_books
FROM Book;

SELECT SUM(pages) AS total_pages_in_library
FROM Books;

SELECT AVG(pages) AS average_pages_per_book
FROM Books;

SELECT MIN(publication_year) AS oldest_book_year
FROM Books;

SELECT MAX(publication_year) AS newest_book_year
FROM Books;

SELECT MIN(borrow_date) AS first_borrow_date
FROM BorrowingRecords;

SELECT COUNT(*) AS books_after_2000
FROM Books
WHERE publication_year > 2000;