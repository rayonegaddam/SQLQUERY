USE ecommerce;
-- 3
DESC users_data;
-- 4 
SELECT * FROM users_data LIMIT 100;
-- 5 
SELECT  count(DISTINCT country) no_of_distinct_countries, count(DISTINCT language) no_of_distinct_languages FROM users_data;
-- 6
SELECT gender,SUM(socialNbFollowers) Total_no_of_followers FROM users_data group by gender;
-- 7a
SELECT count(hasProfilePicture) Totalusers_havinig_profile_picture FROM users_data WHERE hasProfilePicture = 'True';
-- 7b 
SELECT count(hasAnyApp) Totalusers_having_anyapplication FROM users_data WHERE hasAnyApp = 'True';
-- 7c
SELECT count(hasAndroidApp) Totalusers_having_AndroidApp FROM users_data WHERE hasAndroidApp = 'True';
-- 7d
SELECT count(hasIosApp) Totalusers_having_IosApp FROM users_data WHERE hasIosApp = 'True';
-- 8
SELECT country , count(productsBought) buyer_count from users_data WHERE productsBought > 0  group by country order by count(productsBought) DESC;
-- 9.
SELECT country , count(productsSold) seller_count  from users_data WHERE productsSold > 0  group by country order by count(productsSold) ASC,country;
-- **10 
SELECT country ,(productsPassRate) from users_data WHERE productsPassRate>0 group by country order by productsPassRate DESC LIMIT 10 ;
SELECT country ,max(productsPassRate) from users_data group by country order by max(productsPassRate) DESC LIMIT 10 ;

-- 11
SELECT language, count(identifierHash) as user_count from users_data group by language; 
-- 12
SELECT 'socialProductsLiked' as 'Female users',count(socialProductsLiked) as total_count  FROM users_data WHERE gender = 'F' AND socialProductsLiked>0 UNION SELECT 'productsWished' ,count(productsWished) FROM users_data WHERE gender = 'F' AND productsWished >0 ;
-- 13
SELECT 
'Sellers' as Users, COUNT(productsSold) as count
FROM
    users_data
WHERE
    gender = 'M' AND productsSold > 0 
UNION SELECT 
 'Buyers', COUNT(productsBought)
FROM
    users_data
WHERE
    gender = 'M' AND productsBought > 0;
-- ***14
SELECT count(identifierHash) NoOfbuyers, country country_with_maximum_buyers from users_data WHERE productsBought > 0  group by country order by max(productsBought) DESC LIMIT 1 ;
-- **15
SELECT country, count(identifierHash),productsSold WHERE productSold = 0 group by country;
SELECT country,count(productsSold) as Sellers from users_data 
WHERE productsSold = 0 group by country having != ALL 
(SELECT country FROM users_data WHERE productsSold != 0 Group BY country);
-- 16
SELECT * FROM users_data order by daysSinceLastLogin , productsBought DESC LIMIT 110;
-- ***17 
SELECT count(gender) as female_count from users_data WHERE daysSinceLastLogin >= 100 AND gender = 'F';
-- 18
select country, count(gender) as Total_count_of_female FROM users_data WHERE gender = 'F' group by country order by Total_count_of_female DESC;
-- 19
select country, count(gender) as Total_count_of_male FROM users_data WHERE gender = 'M' group by country order by Total_count_of_male desc;
-- **20
SELECT country,avg(productsSold) average_products_sold,avg(productsBought) average_products_Bought from users_data group by gender='M', country;
SELECT country,avg(productsSold) average_products_sold,avg(productsBought) average_products_Bought from users_data group by gender='M', country;
SELECT country,avg(productsSold) average_products_sold,avg(productsBought) average_products_Bought from users_data WHERE gender ='M' group by country;