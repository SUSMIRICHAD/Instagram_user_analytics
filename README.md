# Instagram User Analytics

## Project Description

This project involves analyzing user interactions and engagement with the Instagram app to provide valuable insights that can help the business grow. As a data analyst, your role is to track user engagement with Instagram, which includes identifying loyal users, inactive users, contest winners, popular hashtags, and the best times to launch ad campaigns. Additionally, you will calculate user engagement metrics and identify potential bots or fake accounts. The insights derived from this analysis will aid various teams within Instagram to make informed decisions, enhancing the overall user experience and business strategy.

## Approach

To execute this project, I followed a systematic approach:

- **Data Collection**: Utilized dummy data provided by my institution, simulating Instagram user information.
- **Analysis**: Conducted detailed analysis to answer specific questions posed by the management team.
- **SQL Queries**: Wrote and executed SQL queries in MySQL Workbench to extract relevant data and perform calculations.
- **Insights Derivation**: Interpreted the results to provide actionable insights.
- **Reporting**: Compiled the findings and insights into a structured report for easy understanding and decision-making.

## Tech-Stack Used

- **MySQL Ver 8.0.37**: A robust and reliable database system ideal for handling complex queries and large datasets.
- **MySQL Workbench**: Chosen for its comprehensive toolset tailored specifically for MySQL, providing an integrated environment for database design, SQL development, and server administration. The open-source nature of MySQL Workbench makes it a cost-effective solution.

## Database Description

The database used for this project contains the following tables, each serving a specific purpose related to user interactions and engagement on Instagram:

### 1. **users**
- **Description**: This table contains information about the users registered on the platform.
- **Columns**:
  - `id` (INT): Unique identifier for each user.
  - `username` (VARCHAR): The username of the user.
  - `created_at` (DATETIME): The date and time when the user registered.

### 2. **comments**
- **Description**: This table stores comments made by users on photos.
- **Columns**:
  - `id` (INT): Unique identifier for each comment.
  - `user_id` (INT): Identifier of the user who made the comment.
  - `photo_id` (INT): Identifier of the photo on which the comment was made.
  - `comment_text` (TEXT): The content of the comment.
  - `created_at` (DATETIME): The date and time when the comment was made.

### 3. **likes**
- **Description**: This table tracks the likes that photos receive from users.
- **Columns**:
  - `id` (INT): Unique identifier for each like.
  - `user_id` (INT): Identifier of the user who liked the photo.
  - `photo_id` (INT): Identifier of the liked photo.
  - `created_at` (DATETIME): The date and time when the like was made.

### 4. **follows**
- **Description**: This table records the following relationships between users.
- **Columns**:
  - `follower_id` (INT): Identifier of the user who follows another user.
  - `followee_id` (INT): Identifier of the user being followed.
  - `created_at` (DATETIME): The date and time when the follow action was made.

### 5. **photos**
- **Description**: This table contains information about the photos posted by users.
- **Columns**:
  - `id` (INT): Unique identifier for each photo.
  - `user_id` (INT): Identifier of the user who posted the photo.
  - `image_url` (VARCHAR): URL of the photo.
  - `created_at` (DATETIME): The date and time when the photo was posted.

### 6. **photo_tags**
- **Description**: This table links photos to hashtags.
- **Columns**:
  - `photo_id` (INT): Identifier of the photo.
  - `tag_id` (INT): Identifier of the tag.

### 7. **tags**
- **Description**: This table contains information about hashtags used in the photos.
- **Columns**:
  - `id` (INT): Unique identifier for each tag.
  - `tag_name` (VARCHAR): The name of the tag.

## Insights

Through the analysis, several significant insights were derived:

- Identified the top five oldest users on Instagram, helping in rewarding the most loyal users.
- Detected users who have never posted a single photo, enabling targeted engagement strategies.
- Determined the user with the most likes on a single photo, facilitating the contest winner declaration.
- Suggested the top five most popular hashtags, aiding in effective marketing campaigns.
- Analyzed user registration data to recommend the best day of the week to launch ad campaigns.

## Result

This project successfully provided valuable insights into user behavior and engagement on Instagram. The analysis highlighted key metrics and patterns, such as average posts per user and the identification of potential bot accounts. These findings will assist the marketing, product, and development teams in making informed decisions to enhance user experience and drive business growth.
