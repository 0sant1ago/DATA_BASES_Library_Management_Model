-- Insert data into the AUTHOR table
INSERT INTO AUTHOR (AUTHOR_NAME, AUTHOR_SURNAME) VALUES 
('Agatha', 'Christie'),
('J.K.', 'Rowling'),
('Stephen', 'King'),
('George R.R.', 'Martin'),
('Margaret', 'Atwood'),
('Haruki', 'Murakami'),
('Ernest', 'Hemingway'),
('Jane', 'Austen'),
('William', 'Shakespeare'),
('Franz', 'Kafka');

-- Insert data into the CATEGORY table
INSERT INTO CATEGORY (CATEGORY_NAME) VALUES 
('Mystery'),
('Fantasy'),
('Horror'),
('Science Fiction'),
('Dystopian'),
('Literary Fiction'),
('Romance'),
('Historical Fiction'),
('Classics'),
('Philosophy');

-- Insert data into the BOOK table
INSERT INTO BOOK (BOOK_TITLE, CATEGORY_ID) VALUES 
('Murder on the Orient Express', 1),
('Harry Potter and the Philosopher''s Stone', 2),
('The Shining', 3),
('A Game of Thrones', 4),
('The Handmaid''s Tale', 5),
('Norwegian Wood', 6),
('The Old Man and the Sea', 7),
('Pride and Prejudice', 8),
('Hamlet', 9),
('The Trial', 10);

-- Insert data into the EDITORIAL table
INSERT INTO EDITORIAL (EDITORIAL_NAME) VALUES 
('HarperCollins'),
('Penguin'),
('Random House'),
('Simon & Schuster'),
('Hachette'),
('Macmillan'),
('Bloomsbury'),
('Vintage'),
('Penguin Random House'),
('Faber and Faber');

-- Insert data into the BOOK_COPY table
INSERT INTO BOOK_COPY (BOOK_ID, EDITORIAL_ID, BOOK_COPY_YEAR_PUBLISHED, BOOK_COPY_LANGUAGE) VALUES 
(1, 1, '1934-01-01', 'English'),
(2, 2, '1997-06-26', 'English'),
(3, 3, '1977-01-28', 'English'),
(4, 4, '1996-08-06', 'English'),
(5, 5, '1985-01-01', 'English'),
(6, 6, '1987-01-01', 'Japanese'),
(7, 7, '1952-01-01', 'English'),
(8, 8, '1813-01-01', 'English'),
(9, 9, '1603-01-01', 'English'),
(10, 10, '1925-01-01', 'German');

-- Insert data into the BOOK_AUTHOR table
INSERT INTO BOOK_AUTHOR (BOOK_ID, AUTHOR_ID) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Insert data into the PATRON_ACCOUNT table
INSERT INTO PATRON_ACCOUNT (FIRST_NAME, SURNAME, EMAIL, PATRON_ACCOUNT_STATUS) VALUES 
('John', 'Doe', 'johndoe@example.com', 'Active'),
('Jane', 'Doe', 'janedoe@example.com', 'Active'),
('Bob', 'Smith', 'bobsmith@example.com', 'Inactive'),
('Alice', 'Jones', 'alicejones@example.com', 'Active'),
('Mark', 'Johnson', 'markjohnson@example.com', 'Inactive');
