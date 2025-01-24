use ig_clone;

-- A) Marketing Analysis: --

-- Loyal User Reward: The marketing team wants to reward the most loyal users, i.e., those who have been using the platform for the longest time.--
-- Task: Identify the five oldest users on Instagram from the provided database. --
    
SELECT 
    *
FROM
    users
ORDER BY created_at
LIMIT 5;
    
-- Inactive User Engagement: The team wants to encourage inactive users to start posting by sending them promotional emails.-- 
-- Task: Identify users who have never posted a single photo on Instagram.--

SELECT 
    u.id, u.username, p.image_url
FROM
    users u
        LEFT JOIN
    photos p ON u.id = p.user_id
WHERE
    p.image_url IS NULL;
    
-- Contest Winner Declaration: The team has organized a contest where the user with the most likes on a single photo wins. --
-- Task: Determine the winner of the contest and provide their details to the team. --

WITH MostLikedPhoto AS (
    SELECT photo_id, COUNT(*) AS TotalLikes
    FROM likes
    GROUP BY photo_id
    ORDER BY TotalLikes DESC
    LIMIT 1
)
SELECT 
    u.username, p.id, p.image_url, COUNT(*) AS Total
FROM
    MostLikedPhoto mlp
        INNER JOIN
    photos p ON mlp.photo_id = p.id
        INNER JOIN
    users u ON p.user_id = u.id
        INNER JOIN
    likes l ON p.id = l.photo_id
GROUP BY p.id , u.username , p.image_url;

-- Hashtag Research: A partner brand wants to know the most popular hashtags to use in their posts to reach the most people. -- 
-- Task: Identify and suggest the top five most commonly used hashtags on the platform.--

SELECT 
    t.tag_name, COUNT(pt.tag_id) AS tag_count
FROM
    tags t
        INNER JOIN
    photo_tags pt ON t.id = pt.tag_id
GROUP BY t.tag_name
ORDER BY tag_count DESC
LIMIT 5;

-- Ad Campaign Launch: The team wants to know the best day of the week to launch ads. --
-- Task: Determine the day of the week when most users register on Instagram. Provide insights on when to schedule an ad campaign. --


SELECT 
    DAYNAME(created_at) AS day_of_week,
    COUNT(*) AS registrations
FROM
    users
GROUP BY day_of_week
ORDER BY registrations DESC
LIMIT 2;

-- B) Investor Metrics: --

-- User Engagement: Investors want to know if users are still active and posting on Instagram or if they are making fewer posts. --
-- Task: Calculate the average number of posts per user on Instagram. Also, provide the total number of photos on Instagram divided by the total number of users. --
     
with post_counts as(
select user_id ,count(*) num_posts from photos
group by user_id)

SELECT 
    (SELECT 
            COUNT(*)
        FROM
            photos) / (SELECT 
            COUNT(*)
        FROM
            users) AS avg_photos_per_user, avg(num_posts) avg_no_posts from post_counts;
            
-- Bots & Fake Accounts: Investors want to know if the platform is crowded with fake and dummy accounts. --
-- Task: Identify users (potential bots) who have liked every single photo on the site, as this is not typically possible for a normal user. --
   
-- Method1 --
WITH total_photos AS (
    SELECT COUNT(*) AS count_of_photos
    FROM photos
)

SELECT 
    u.id, u.username, COUNT(l.user_id) AS bot_likes
FROM
    users u
        INNER JOIN
    likes l ON u.id = l.user_id
GROUP BY u.id
HAVING COUNT(l.photo_id) = (SELECT 
        count_of_photos
    FROM
        total_photos);

-- Method2--

SELECT 
    u.username, likes_count, total_photos
FROM
    users u
        JOIN
    (SELECT 
        l.user_id, COUNT(*) AS likes_count
    FROM
        likes l
    GROUP BY l.user_id) lc ON u.id = lc.user_id
        JOIN
    (SELECT 
        COUNT(*) AS total_photos
    FROM
        photos) tp ON lc.likes_count = tp.total_photos;

-- Method3 --
        
SELECT 
    user_id, username
FROM
    likes
        INNER JOIN
    users ON likes.user_id = users.id
GROUP BY user_id
HAVING COUNT(DISTINCT photo_id) = (SELECT 
        COUNT(*)
    FROM
        photos);
