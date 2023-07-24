USE instagram_practice;

-- Find the oldest users (Darby_Herzog, Emilio_Bernier52, Elenor88, Nicole71 AND Jordyn.Jacobson2)

SELECT 
    user_name AS 'User', time_creation AS 'Date of creation'
FROM
    user
ORDER BY time_creation
LIMIT 5;

-- What day of the week do more users join? (Thursday AND Sunday)

SELECT 
DATE_FORMAT(time_creation, '%W') AS Days,
COUNT(time_creation) AS Count
FROM
    user
GROUP BY Days
ORDER BY Count desc;

-- FIND THE USERS WHO NEVER POSTED A PHOTO

SELECT 
    user_name, COUNT(url) AS Posts
FROM
    user
        LEFT JOIN
    photos ON user.id = user_id
GROUP BY user_name
ORDER BY Posts;

-- The most likes in a sngle photo (Zack_Kemmer93)

SELECT 
    user_name ,photo_id, COUNT(photo_id) AS Likes
FROM
    user
        INNER JOIN
    photos ON user.id = user_id
        INNER JOIN
    likes ON photos.id = photo_id
GROUP BY photo_id
ORDER BY Likes DESC;

-- What is AVG number of posts per user? (3.4)

SELECT 
    AVG(mycount) AS Average
FROM
    (SELECT 
        COUNT(user_id) AS mycount
    FROM
        photos
    GROUP BY user_id) AS Count

-- Top 5 most used hashtags (smile, beach, party, fun AND concert)

SELECT 
    tags.tag_name, COUNT(tag_id) AS Count
FROM
    tags
        INNER JOIN
    photo_tags ON tags.id = tag_id
GROUP BY TAG_NAME
ORDER BY count DESC
LIMIT 5; 

-- Find the users who have liked every single photo on the site.alter

SELECT 
    user_name, COUNT(user_id) AS likes
FROM
    user
        INNER JOIN
    likes ON user.id = user_id
GROUP BY user_name
HAVING likes = (SELECT COUNT(*) FROM photos)
