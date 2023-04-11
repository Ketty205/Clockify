/****** Script from SSMS  ******/

/* Select all rows  */
SELECT * FROM [project].[dbo].[dataset]

/* Count all rows */
SELECT count(*) FROM [project].[dbo].[dataset]

/* Select rows witn event sign_up or purchase  */
SELECT * FROM [project].[dbo].[dataset] WHERE event_name ='sign_up' OR event_name ='purchase'

/* Select conversions */
SELECT user_pseudo_id, event_name FROM [project].[dbo].[dataset] WHERE event_name ='sign_up' OR event_name ='purchase'

/* Count conversions */
SELECT count(user_pseudo_id) FROM [project].[dbo].[dataset] WHERE event_name ='sign_up' OR event_name ='purchase'

/* Count of goal conversions */
SELECT event_name,count(user_pseudo_id) as goal_conversions FROM [project].[dbo].[dataset] WHERE event_name ='sign_up' OR event_name ='purchase' GROUP BY event_name

/* Count of different conversions */
SELECT event_name,count(user_pseudo_id) as conversions FROM [project].[dbo].[dataset] WHERE event_name !='sign_up' AND event_name !='purchase' GROUP BY event_name

/* Label of conversions */
SELECT event_name,count(user_pseudo_id) as conversions, 
CASE WHEN event_name ='sign_up' OR event_name ='purchase' THEN 'experimentID.0' 
ELSE 'experimentID.1' END AS 'Label'
FROM [project].[dbo].[dataset]
GROUP BY event_name


/* Label of conversions per country*/
SELECT event_name,count(user_pseudo_id) as conversions, 
CASE WHEN event_name ='sign_up' OR event_name ='purchase' THEN 'experimentID.0' 
ELSE 'experimentID.1' END AS 'Label',country
FROM [project].[dbo].[dataset]
GROUP BY event_name,country

/* Label of conversions per category*/
SELECT event_name,count(user_pseudo_id) as conversions, 
CASE WHEN event_name ='sign_up' OR event_name ='purchase' THEN 'experimentID.0' 
ELSE 'experimentID.1' END AS 'Label',category
FROM [project].[dbo].[dataset]
GROUP BY event_name,category

/* check if an user id shows up multiple times, it's because they saw more than one variant */

SELECT user_pseudo_id,
        count(*) as number_of_variants
FROM [project].[dbo].[dataset]
GROUP BY user_pseudo_id


