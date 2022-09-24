-- 1. The oldest business in the world
-- Select the oldest and newest founding years from the businesses table

SELECT 
    MIN(year_founded), 
    MAX(year_founded)
FROM 
    businesses;


-- 2. How many businesses were founded before 1000?
-- Get the count of rows in businesses where the founding year was before 1000

SELECT 
    COUNT(*) 
FROM 
    businesses 
WHERE 
    year_founded < 1000;


-- 3. Which businesses were founded before 1000?
-- Select all columns from businesses where the founding year was before 1000
-- Arrange the results from oldest to newest

SELECT 
    * 
FROM 
    businesses
WHERE 
    year_founded < 1000
ORDER BY 
    year_founded;


-- 4. Exploring the categories
-- Select business name, founding year, and country code from businesses; and category from categories
-- where the founding year was before 1000, arranged from oldest to newest

SELECT 
    b.business, 
    b.year_founded, 
    b.country_code, 
    c.category
FROM 
    businesses AS b
INNER JOIN 
    categories AS c ON b.category_code = c.category_code
WHERE 
    year_founded < 1000
ORDER BY 
    year_founded;


-- 5. Counting the categories
-- Select the category and count of category (as "n")
-- arranged by descending count, limited to 10 most common categories

SELECT  
    categories.category, 
    COUNT(categories.category) AS n
FROM 
    businesses
INNER JOIN 
    categories ON businesses.category_code = categories.category_code
GROUP BY 
    categories.category
ORDER BY 
    COUNT(categories.category) DESC
LIMIT 
    10;


-- 6. Oldest business by continent
-- Select the oldest founding year (as "oldest") from businesses, 
-- and continent from countries
-- for each continent, ordered from oldest to newest 

SELECT  
    MIN(businesses.year_founded) AS "oldest", 
    countries.continent
FROM 
    businesses
INNER JOIN 
    countries ON businesses.country_code = countries.country_code
GROUP BY 
    countries.continent
ORDER BY 
    MIN(businesses.year_founded);


-- 7. Joining everything for further analysis
-- Select the business, founding year, category, country, and continent

SELECT 
    businesses.business, 
    businesses.year_founded, 
    categories.category,
    countries.country,
    countries.continent
FROM 
    businesses
INNER JOIN 
    categories ON businesses.category_code = categories.category_code
INNER JOIN 
    countries ON businesses.country_code = countries.country_code;


-- 8. Counting categories by continent
-- Count the number of businesses in each continent and category

SELECT 
    countries.continent,
    categories.category,
    COUNT(*) AS n
FROM 
    businesses
INNER JOIN 
    categories ON businesses.category_code = categories.category_code
INNER JOIN 
    countries ON businesses.country_code = countries.country_code
GROUP BY 
    countries.continent, categories.category;


-- 9. Filtering counts by continent and category
-- Repeat that previous query, filtering for results having a count greater than 5

SELECT 
    countries.continent,
    categories.category,
    COUNT(*) AS n
FROM 
    businesses
INNER JOIN 
    categories ON businesses.category_code = categories.category_code
INNER JOIN 
    countries ON businesses.country_code = countries.country_code
GROUP BY 
    countries.continent, categories.category
HAVING 
    COUNT(*) > 5
ORDER BY 
    COUNT(*) DESC;