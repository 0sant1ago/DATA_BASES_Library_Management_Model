--The following function takes 'patron_id' as parameter and returns a table
-- of all the books that are currently checked out by that patron:
CREATE OR REPLACE FUNCTION get_checked_out_books(patron_id integer)
RETURNS TABLE (
    book_title text,
    author_name text,
    author_surname text,
    editorial_name text,
    start_time date,
    end_time date
)
AS $$
BEGIN
    RETURN QUERY
    SELECT
        b.book_title,
        a.author_name,
        a.author_surname,
        e.editorial_name,
        c.start_time,
        c.end_time
    FROM
        checkout c
        JOIN book_copy bc ON c.book_copy_id = bc.book_copy_id
        JOIN book b ON bc.book_id = b.book_id
        JOIN (
            SELECT
                ba.book_id,
                a.author_name,
                a.author_surname
            FROM
                book_author ba
                JOIN author a ON ba.author_id = a.author_id
        ) a ON b.book_id = a.book_id
        JOIN editorial e ON bc.editorial_id = e.editorial_id
    WHERE
        c.patron_id = patron_id
        AND c.is_returned = false;
END;
$$ LANGUAGE plpgsql;


--This procedure takes 'patron_id' and 'book_copy_id' as input and adds a
-- new checkout row for that book copy and patron:
CREATE OR REPLACE PROCEDURE add_book_to_checkout(
    patron_id integer,
    book_copy_id integer
)
AS $$
BEGIN
    INSERT INTO checkout (start_time, end_time, book_copy_id, is_returned, patron_id)
    VALUES (
        current_date,
        current_date + interval '14 days',
        book_copy_id,
        false,
        patron_id
    );
END;
$$ LANGUAGE plpgsql;
