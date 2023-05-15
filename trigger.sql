--Trigger to update the book availability in the BOOK table when a book copy is checked out
-- this trigger is executed after a new row is inserted into the CHECKOUT table
CREATE OR REPLACE FUNCTION update_book_availability()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM checkout c
        WHERE c.book_copy_id = NEW.book_copy_id
            AND c.is_returned = false
    ) THEN
        UPDATE book
        SET availability = false
        WHERE book_id = (
            SELECT book_id
            FROM book_copy
            WHERE book_copy_id = NEW.book_copy_id
        );
    ELSE
        UPDATE book
        SET availability = true
        WHERE book_id = (
            SELECT book_id
            FROM book_copy
            WHERE book_copy_id = NEW.book_copy_id
        );
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER book_copy_checkout_trigger
AFTER INSERT ON checkout
FOR EACH ROW
EXECUTE FUNCTION update_book_availability();



--Trigger to enforce a limit on the number of books a patron can check out at the same time
CREATE OR REPLACE FUNCTION enforce_checkout_limit()
RETURNS TRIGGER AS $$
DECLARE
    current_checkouts integer;
    max_checkouts integer := 3; 
BEGIN
    SELECT COUNT(*)
    INTO current_checkouts
    FROM checkout
    WHERE patron_id = NEW.patron_id
        AND is_returned = false;
    
    IF current_checkouts >= max_checkouts THEN
        RAISE EXCEPTION 'The maximum number of checkouts has been reached.';
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER checkout_limit_trigger
BEFORE INSERT ON checkout
FOR EACH ROW
EXECUTE FUNCTION enforce_checkout_limit();
