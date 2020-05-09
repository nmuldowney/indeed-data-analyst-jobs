--Q1. How many rows are in the data_analyst_jobs table?
--A1: 1793 rows
/*
SELECT COUNT (*)
FROM data_analyst_jobs; 
*/


--Q2. Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
--A2: Exxonmobil
/* 
SELECT * FROM data_analyst_jobs LIMIT (10); 
*/


--Q3. How many postings are in Tennessee? How many are there in either Tennessee or Kentucky? 
--A3: 21 postings in TN; 27 in either TN or KY
/*
SELECT * FROM data_analyst_jobs
WHERE location = 'TN'; 
*/

/*
SELECT * FROM data_analyst_jobs 
WHERE location = 'TN' OR location = 'KY';  -- WHERE location in ('TN','KY'); --works as well
*/


--Q4. How many postings in Tennessee have a star rating above 4? 
--A4: 3 postings are above 4. (1 is equal to 4)
/* 
SELECT * FROM data_analyst_jobs  -- SELECT count (*) --to get exact count
WHERE location = 'TN' AND star_rating > 4;
*/


--Q5. How many postings in the dataset have a review count between 500 and 1000? 
--A5: 151 postings
/*
SELECT * FROM data_analyst_jobs   -- SELECT COUNT (*) -works more efficient
WHERE review_count BETWEEN 500 AND 1000; 
*/


--Q6. Show the average star rating for each state. 
--The output should show the state as state and the average rating for the state as avg_rating. 
--Which state shows the highest average rating? 
--A6: Nebraska has highest rating of 4.19.
/*
SELECT AVG (star_rating) 
AS avg_rating, 
location AS state 
FROM data_analyst_jobs
GROUP BY state
ORDER BY avg_rating DESC;
*/ --note: WHERE star_rating is not null --also, ROUND (AVG(star_rating),2)


--Q7. Select unique job titles from the data_analyst_jobs table. How many are there? 
--A7: 881 unique job titles
/* 
SELECT DISTINCT title
FROM data_analyst_jobs; 
*/


--Q8. How many unique job titles are there for California companies? 
--A8: 230 unique job titles
/*
SELECT DISTINCT title
FROM data_analyst_jobs
WHERE location = 'CA';  
*/
--SELECT COUNT (DISTINCT title)
--FROM data_analyst_jobs
--WHERE location = 'CA';


--Q9. Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. 
--How many companies are there with more that 5000 reviews across all locations?
--A9: 41 companies (1 is null)
/*
SELECT company, AVG (star_rating) as avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000 and company is not null
GROUP BY company
ORDER BY company;
*/


--Q10. Add the code to order the query in #9 from highest to lowest average star rating.
--Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating? 
--A10: There is a 6-way tie with average star rating of 4.199999809 for General Motors, Unilever, Microsoft, Nike, American Express, and Kaiser Permanente.
/*
SELECT company, AVG (star_rating) as avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000 and company is not null
GROUP BY company
ORDER BY avg_rating DESC;
*/


--Q11. Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 
--A11: 1669 job titles; 774 unique/distinct
/* 
SELECT DISTINCT title   --can also have COUNT(DISTINCT) for exact count.
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%'; 
*/

--another way to select titles in order:
/*SELECT distinct title, count(title)
FROM data_analyst_jobs
WHERE title ilike '%analyst%'
GROUP BY title
ORDER BY COUNT(title) DESC;  */



--Q12. How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? 
--What word do these positions have in common?
--A12: 4 different job titles, they have Tableau in their position titles in common.
/*
SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analy%';
*/