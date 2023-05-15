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
