--AUTHOR table:
CREATE INDEX ix_author_author_name ON author (author_name);

--CATEGORY table:
CREATE INDEX ix_category_category_name ON category (category_name);

--BOOK table:
CREATE INDEX ix_book_category_id ON book (category_id);

--EDITORIAL table:
CREATE INDEX ix_editorial_editorial_name ON editorial (editorial_name);

--BOOK_COPY table:
CREATE INDEX ix_editorial_editorial_name ON editorial (editorial_name);

--BOOK_AUTHOR table:
CREATE INDEX ix_book_author_book_id_author_id ON book_author (book_id, author_id);

--WAITING_LIST table:
CREATE INDEX ix_waiting_list_patron_id_book_id ON waiting_list (patron_id, book_id);

--CHECKOUT table:
CREATE INDEX ix_checkout_book_copy_id ON checkout (book_copy_id);
