create database library;
use library;

---- Members table ---

CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT,
    join_date DATE
);

---- Books table ---

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    author VARCHAR(100),
    genre VARCHAR(50),
    publication_year INT,
    copies_available INT
);

---- Borrow table ----

CREATE TABLE Borrow (
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    status ENUM('Borrowed', 'Returned') DEFAULT 'Borrowed',
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

--- data set ---

INSERT INTO Members (name, email, phone, address, join_date) VALUES
('Amit Roy', 'amit@gmail.com', '9876543210', 'Delhi, India', '2023-05-10'),
('Sara Khan', 'sara@gmail.com', '9898989898', 'Mumbai, India', '2023-06-12');

INSERT INTO Books (title, author, genre, publication_year, copies_available) VALUES
('The Alchemist', 'Paulo Coelho', 'Fiction', 1988, 5),
('Atomic Habits', 'James Clear', 'Self-Help', 2018, 3),
('The Power of Now', 'Eckhart Tolle', 'Spirituality', 1997, 2);

INSERT INTO Borrow (member_id, book_id, borrow_date, return_date, status) VALUES
(1, 1, '2024-02-20', '2024-03-05', 'Returned'),
(2, 2, '2024-02-25', NULL, 'Borrowed');

---- Queries ----

--- 1. Get all borrowed books that have not been returned ---

SELECT m.name, b.title, bo.borrow_date 
FROM Borrow bo
JOIN Members m ON bo.member_id = m.member_id
JOIN Books b ON bo.book_id = b.book_id
WHERE bo.status = 'Borrowed';

--- 2.Most borrowed books ---

SELECT b.title, COUNT(bo.borrow_id) AS times_borrowed
FROM Borrow bo
JOIN Books b ON bo.book_id = b.book_id
GROUP BY b.title
ORDER BY times_borrowed DESC;

---- 3.Active members who borrowed the most books ----

SELECT m.name, COUNT(bo.borrow_id) AS total_borrows
FROM Borrow bo
JOIN Members m ON bo.member_id = m.member_id
GROUP BY m.name
ORDER BY total_borrows DESC
LIMIT 5;

---- 4.Available books in the library ----

SELECT title, copies_available FROM Books WHERE copies_available > 0;










