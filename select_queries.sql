-- 1. Group books by category and show the categories with more than 2 books:
SELECT CATEGORY_ID, COUNT(*) AS BookCount
FROM BOOK
GROUP BY CATEGORY_ID
HAVING COUNT(*) > 2;


-- 2. Retrieve books sorted by publication year in descending order:
SELECT BOOK_TITLE, BOOK_COPY_YEAR_PUBLISHED
FROM BOOK
INNER JOIN BOOK_COPY ON BOOK.BOOK_ID = BOOK_COPY.BOOK_ID
ORDER BY BOOK_COPY_YEAR_PUBLISHED DESC;


-- 3. Calculate the total number of book copies for each editorial using the SUM() function:
SELECT EDITORIAL_ID, EDITORIAL_NAME, SUM(1) OVER (PARTITION BY EDITORIAL_ID) AS TotalCopies
FROM EDITORIAL;


-- 4. Rank books based on their publication year within each category:
SELECT BOOK_TITLE, BOOK_COPY_YEAR_PUBLISHED, RANK() OVER (PARTITION BY CATEGORY_ID ORDER BY BOOK_COPY_YEAR_PUBLISHED) AS Rank
FROM BOOK
INNER JOIN BOOK_COPY ON BOOK.BOOK_ID = BOOK_COPY.BOOK_ID;


-- 5. Retrieve the top 3 oldest books in each category:
SELECT BOOK_TITLE, BOOK_COPY_YEAR_PUBLISHED
FROM (
  SELECT BOOK_TITLE, BOOK_COPY_YEAR_PUBLISHED, RANK() OVER (PARTITION BY CATEGORY_ID ORDER BY BOOK_COPY_YEAR_PUBLISHED) AS Rank
  FROM BOOK
  INNER JOIN BOOK_COPY ON BOOK.BOOK_ID = BOOK_COPY.BOOK_ID
) AS RankedBooks
WHERE Rank <= 3;


-- 6. Calculate the cumulative number of book copies published over time using the SUM() function and window ordering:
SELECT BOOK_COPY_YEAR_PUBLISHED, SUM(1) OVER (ORDER BY BOOK_COPY_YEAR_PUBLISHED) AS CumulativeCopies
FROM BOOK_COPY
ORDER BY BOOK_COPY_YEAR_PUBLISHED;
