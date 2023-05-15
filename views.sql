--Submission: Creating a View to Hide Personal Customer Data:
CREATE VIEW patron_accounts_view AS
SELECT patron_id, first_name, surname, 'xxxx-xxxx-xxxx-' || RIGHT(card_no, 4) AS masked_card_no, email, patron_account_status
FROM patron_account;

--Submission: Creating a View to Hide Technical Fields:
CREATE VIEW books_view AS
SELECT b.book_id, b.book_title, c.category_name, e.editorial_name, bc.book_copy_year_published, bc.book_copy_language
FROM book b
JOIN category c ON b.category_id = c.category_id
JOIN book_copy bc ON b.book_id = bc.book_id
JOIN editorial e ON bc.editorial_id = e.editorial_id;

--Submission: Creating a Summary Table for Customer Frequency:
CREATE TABLE customer_frequency_summary AS
SELECT patron_id, COUNT(*) AS total_checkouts
FROM checkout
WHERE is_returned = true
GROUP BY patron_id;

--Submission: Statictics on borrows of a Book:
CREATE VIEW BOOK_BORROWS_BY_CATEGORY AS
SELECT 
    CATEGORY.CATEGORY_NAME,
    COUNT(DISTINCT CHECKOUT.PATRON_ID) AS UNIQUE_CUSTOMERS,
    COUNT(CHECKOUT.CHECKOUT_ID) AS TOTAL_CHECKOUTS,
    SUM(CASE WHEN CHECKOUT.IS_RETURNED THEN 1 ELSE 0 END) AS TOTAL_RETURNS,
    COUNT(CASE WHEN CHECKOUT.IS_RETURNED = FALSE THEN 1 END) AS TOTAL_SALES
FROM BOOK
JOIN CATEGORY ON BOOK.CATEGORY_ID = CATEGORY.CATEGORY_ID
JOIN BOOK_COPY ON BOOK.BOOK_ID = BOOK_COPY.BOOK_ID
JOIN CHECKOUT ON BOOK_COPY.BOOK_COPY_ID = CHECKOUT.BOOK_COPY_ID
GROUP BY CATEGORY.CATEGORY_NAME;

--Submission: View that shows statistics on book checkouts by language
CREATE VIEW CHECKOUTS_BY_BOOK_LANGUAGE AS
SELECT 
    BOOK_COPY.BOOK_COPY_LANGUAGE,
    COUNT(DISTINCT CHECKOUT.PATRON_ID) AS UNIQUE_CUSTOMERS,
    COUNT(CHECKOUT.CHECKOUT_ID) AS TOTAL_CHECKOUTS,
    SUM(CASE WHEN CHECKOUT.IS_RETURNED THEN 1 ELSE 0 END) AS TOTAL_RETURNS,
    COUNT(CASE WHEN CHECKOUT.IS_RETURNED = FALSE THEN 1 END) AS TOTAL_CHECKOUTS_OUT
FROM BOOK_COPY
JOIN CHECKOUT ON BOOK_COPY.BOOK_COPY_ID = CHECKOUT.BOOK_COPY_ID
GROUP BY BOOK_COPY.BOOK_COPY_LANGUAGE;

--Submission: View that shows statistics on waiting lists by book title:
CREATE VIEW WAITING_LISTS_BY_BOOK_TITLE AS
SELECT 
    BOOK.BOOK_TITLE,
    COUNT(WAITING_LIST.PATRON_ID) AS TOTAL_WAITING_LISTS
FROM BOOK
JOIN WAITING_LIST ON BOOK.BOOK_ID = WAITING_LIST.BOOK_ID
GROUP BY BOOK.BOOK_TITLE;

