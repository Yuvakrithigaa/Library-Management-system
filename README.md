# Library-Management-system

This project is a Library Management System designed to manage books, members, and borrow transactions efficiently. The database structure allows tracking book availability, member activity, and borrowed books. It includes key SQL queries for analyzing borrow trends, identifying the most popular books, and tracking active members.

Database Schema:
The system consists of the following tables:

1. Members
Stores information about library members:
member_id (Primary Key) – Unique identifier for each member.
name – Full name of the member.
email – Unique email ID.
phone – Contact number.
address – Residential address of the member.
join_date – Date when the member registered.

2. Books
Stores details of books available in the library:

book_id (Primary Key) – Unique identifier for each book.
title – Name of the book.
author – Author of the book.
genre – Genre category of the book.
publication_year – Year of publication.
copies_available – Number of copies currently available in the library.

3. Borrow

Stores borrowing transactions of books by members:

borrow_id (Primary Key) – Unique transaction identifier.
member_id (Foreign Key) – Reference to the member borrowing the book.
book_id (Foreign Key) – Reference to the borrowed book.
borrow_date – Date when the book was borrowed.
return_date – Date when the book is expected to be returned (or has been returned).
status – Indicates whether the book is currently 'Borrowed' or 'Returned'.

