--AUTHOR table:
CREATE INDEX ix_author_author_name ON author (author_name);

--Since the author's name is frequently used in queries, indexing the 
-- AUTHOR_NAME field can speed up searches and sorting based on the author's name.


--CATEGORY table:
CREATE INDEX ix_category_category_name ON category (category_name);

--indexing the CATEGORY_NAME field can improve the performance of queries that 
-- involve filtering or sorting based on category names.


--BOOK table:
CREATE INDEX ix_book_category_id ON book (category_id);

--creating an index on this field can improve the efficiency of queries that 
-- involve retrieving books by category


--EDITORIAL table:
CREATE INDEX ix_editorial_editorial_name ON editorial (editorial_name);

--creating an index on the EDITORIAL_NAME field can enhance query performance


--BOOK_COPY table:
CREATE INDEX ix_editorial_editorial_name ON editorial (editorial_name);

--BOOK_AUTHOR table:
CREATE INDEX ix_book_author_book_id_author_id ON book_author (book_id, author_id);

--WAITING_LIST table:
CREATE INDEX ix_waiting_list_patron_id_book_id ON waiting_list (patron_id, book_id);

--CHECKOUT table:
CREATE INDEX ix_checkout_book_copy_id ON checkout (book_copy_id);
