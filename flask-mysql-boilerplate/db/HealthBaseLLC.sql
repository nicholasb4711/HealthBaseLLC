DROP SCHEMA IF EXISTS healthdb;
CREATE DATABASE healthdb;
USE healthdb;

-- Create Goals table
CREATE TABLE Goals
(
    GoalID   INT AUTO_INCREMENT PRIMARY KEY,
    GoalName VARCHAR(30) NOT NULL,
    GoalDesc TEXT
);

-- Create Goals Data
INSERT INTO Goals(GoalID, GoalName, GoalDesc)
VALUES (1, 'Weight Loss', 'I want to lose weight, and I dont care about muscle retention'),
       (2, 'Weight Gain', 'I want to become a giant walking truck, and I dont care how I get there'),
       (3, 'Muscle Building', 'I want to focus on increasing my muscle mass and overall strength'),
       (4, 'Cardiovascular Fitness', 'I want to improve my cardiovascular health and endurance'),
       (5, 'Flexibility', 'I aim to increase my flexibility, allowing for better mobility and reduced injury risk'),
       (6, 'Mindfulness',
        'I want to incorporate mindfulness practices such as meditation into my daily routine to reduce stress and improve mental well-being'),
       (7, 'Nutrition', 'I want to learn more about healthy eating habits and adopt a balanced diet'),
       (8, 'Running a Marathon', 'My goal is to train and prepare for running a full marathon'),
       (9, 'Improved Sleep', 'I want to improve my sleep quality and establish a consistent sleep schedule'),
       (10, 'Body Recomposition', 'I aim to lose fat and gain muscle simultaneously for a more balanced physique'),
       (11, 'Swimming Performance', 'I want to improve my swimming skills and increase my endurance in the water'),
       (12, 'Yoga Practice', 'I aim to deepen my yoga practice, focusing on strength, flexibility, and balance'),
       (13, 'Injury Recovery', 'I want to recover from my injury and regain my previous fitness levels'),
       (14, 'Cycling Endurance',
        'I want to build my cycling endurance and participate in long-distance cycling events'),
       (15, 'Posture Improvement',
        'I aim to improve my posture to reduce back pain and enhance overall body alignment'),
       (16, 'Bodyweight Fitness', NULL),
       (17, 'Climbing Skills', 'I aim to develop my rock climbing skills and increase my climbing endurance'),
       (18, 'Dance Performance', NULL),
       (19, 'Triathlon Training',
        'I want to train and compete in a triathlon, focusing on swimming, cycling, and running'),
       (20, 'Hiking Preparation', NULL),
       (21, 'Increased Stamina',
        'I want to build my stamina, allowing me to participate in high-intensity activities for longer periods'),
       (22, 'Group Fitness', NULL),
       (23, 'Sports Performance',
        'I want to improve my performance in a specific sport, increasing my skill level and physical abilities'),
       (24, 'Functional Fitness', NULL);


-- ------------------------------------------------------------

-- Create User table
CREATE TABLE User
(
    UserID     INT PRIMARY KEY AUTO_INCREMENT,
    TrainedBy  INT,
    LastName   VARCHAR(50) NOT NULL,
    FirstName  VARCHAR(50) NOT NULL,
    Age        INT,
    Height_in  INT,
    Weight_lbs INT,
    Goal       INT,
    FOREIGN KEY (TrainedBy) REFERENCES User (UserID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (Goal) REFERENCES Goals (GoalID)

);

-- Create User Data
INSERT INTO User (TrainedBy, LastName, FirstName, Age, Height_in, Weight_lbs, Goal)
VALUES (NULL, 'Garcia', 'Miguel', 23, 70, 160, 1),
       (1, 'Wong', 'Michelle', 35, 63, 130, 3),
       (2, 'Kim', 'Jin', 28, 68, 145, 2),
       (1, 'Jackson', 'Avery', 29, 72, 190, 4),
       (4, 'Gupta', 'Ravi', 18, 69, 155, 1),
       (NULL, 'Patel', 'Jasmine', 27, 66, 135, 2),
       (3, 'Brown', 'Jessica', 32, 70, 160, 3),
       (6, 'Lee', 'Daniel', 75, 71, 170, 4),
       (2, 'Smith', 'Emily', 26, 65, 125, 1),
       (8, 'Singh', 'Aman', 30, 69, 150, 2),
       (5, 'Thompson', 'Ashley', 33, 67, 140, 3),
       (9, 'Johnson', 'Brian', 28, 73, 195, 4),
       (10, 'Nguyen', 'Katie', 24, 64, 120, 1),
       (7, 'Gonzalez', 'Antonio', 31, 68, 150, 2),
       (NULL, 'Davis', 'Olivia', 19, 66, 135, 3),
       (1, 'Hernandez', 'Sofia', 26, 67, 140, 4),
       (NULL, 'Ramirez', 'Carlos', 27, 69, 155, 1),
       (NULL, 'Anderson', 'Rachel', 30, 68, 145, 12),
       (6, 'Taylor', 'Luke', 32, 73, 185, 3),
       (NULL, 'Kumar', 'Anjali', 26, 64, 120, 4),
       (7, 'Ng', 'Caleb', 29, 71, 165, 1),
       (NULL, 'Chang', 'Grace', 31, 67, 140, 2),
       (2, 'Martinez', 'Isabella', 28, 66, 135, 13),
       (NULL, 'Lin', 'David', 54, 70, 160, 4),
       (2, 'Gao', 'Sophia', 20, 68, 150, 1),
       (10, 'Wilson', 'Nathan', 30, 72, 190, 2),
       (NULL, 'Baker', 'Victoria', 28, 63, 130, 3),
       (5, 'Kim', 'Soo', 29, 67, 140, 4),
       (4, 'Brown', 'James', 61, 68, 145, 1),
       (NULL, 'Hernandez', 'Andres', 32, 69, 155, 2),
       (6, 'Chen', 'Eva', 27, 66, 135, 3),
       (NULL, 'Jones', 'Liam', 28, 71, 165, 20),
       (NULL, 'Ng', 'Caleb', 29, 71, 165, 1),
       (NULL, 'Ching', 'Gracie', 31, 67, 140, 2),
       (NULL, 'Martin', 'Isabel', 28, 66, 135, 13),
       (NULL, 'Linham', 'Dave', 54, 70, 160, 4),
       (NULL, 'Gao', 'Soohoo', 20, 68, 150, 1),
       (10, 'Williamson', 'Nathaniel', 30, 72, 290, 2),
       (NULL, 'Bah', 'Victor', 28, 63, 130, 3),
       (5, 'Kim', 'Sunny', 29, 67, 140, 4),
       (4, 'Broward', 'Jameson', 61, 68, 145, 1),
       (NULL, 'Hergonzola', 'Andre', 32, 69, 185, 2),
       (6, 'Chin', 'Ava', 27, 66, 335, 3),
       (NULL, 'Jones', 'Lee', 28, 71, 195, 20);


-- ------------------------------------------------------------


-- Create MuscleGroup table
CREATE TABLE MuscleGroup
(
    MuscleGroupID   INT PRIMARY KEY AUTO_INCREMENT,
    MuscleGroupName VARCHAR(50) NOT NULL
);

-- Fill MuscleGroup with data
INSERT INTO MuscleGroup(MuscleGroupName)
VALUES ('Quadriceps'), 
       ('Glutes'), 
       ('Hamstrings'), 
       ('Chest Muscles'), 
       ('Back Muscles'), 
       ('Abdominals'), 
       ('Biceps'),
       ('Triceps'),
       ('Calves'),
       ('Traps'),
       ('Forearms'),
       ('Rear Deltoid'),
       ('Front Deltoid');


-- Create FoodCategory table
CREATE TABLE FoodCategory
(
    CategoryID   INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName TEXT NOT NULL,
    CategoryDesc TEXT NOT NULL
);

-- Fill FoodCategory with data
INSERT INTO FoodCategory(CategoryName, CategoryDesc) VALUES ('Fruits', 'Fresh and natural fruits');
INSERT INTO FoodCategory(CategoryName, CategoryDesc) VALUES ('Vegetables', 'Fresh and natural vegetables');
INSERT INTO FoodCategory(CategoryName, CategoryDesc) VALUES ('Meat', 'Different types of meat');
INSERT INTO FoodCategory(CategoryName, CategoryDesc) VALUES ('Poultry', 'Different types of poultry');
INSERT INTO FoodCategory(CategoryName, CategoryDesc) VALUES ('Seafood', 'Fresh and natural seafood');
INSERT INTO FoodCategory(CategoryName, CategoryDesc) VALUES ('Dairy', 'Different types of dairy products');
INSERT INTO FoodCategory(CategoryName, CategoryDesc) VALUES ('Bread', 'Different types of breads');
INSERT INTO FoodCategory(CategoryName, CategoryDesc) VALUES ('Pastries', 'Different types of pastries and desserts');
INSERT INTO FoodCategory(CategoryName, CategoryDesc) VALUES ('Snacks', 'Different types of snacks');
INSERT INTO FoodCategory(CategoryName, CategoryDesc) VALUES ('Beverages', 'Different types of beverages');
INSERT INTO FoodCategory(CategoryName, CategoryDesc) VALUES ('Canned Foods', 'Different types of canned foods');
INSERT INTO FoodCategory(CategoryName, CategoryDesc) VALUES ('Frozen Foods', 'Different types of frozen foods');
INSERT INTO FoodCategory(CategoryName, CategoryDesc) VALUES ('Organic Foods', 'Different types of organic foods');
INSERT INTO FoodCategory(CategoryName, CategoryDesc) VALUES ('Gluten-free Foods', 'Different types of gluten-free foods');
INSERT INTO FoodCategory(CategoryName, CategoryDesc) VALUES ('Vegan Foods', 'Different types of vegan foods');
INSERT INTO FoodCategory(CategoryName, CategoryDesc) VALUES ('Vegetarian Foods', 'Different types of vegetarian foods');
INSERT INTO FoodCategory(CategoryName, CategoryDesc) VALUES ('Soups', 'Different types of soups');
INSERT INTO FoodCategory(CategoryName, CategoryDesc) VALUES ('Salads', 'Different types of salads');
INSERT INTO FoodCategory(CategoryName, CategoryDesc) VALUES ('Spices', 'Different types of spices');
INSERT INTO FoodCategory(CategoryName, CategoryDesc) VALUES ('Sauces', 'Different types of sauces');

-- Create Foods table
CREATE TABLE Foods
(
    FoodID           INT PRIMARY KEY AUTO_INCREMENT,
    ServingSizeGrams INT  NOT NULL,
    Calories         INT  NOT NULL,
    Protein          INT  NOT NULL,
    Fat              INT  NOT NULL,
    Carbs            INT  NOT NULL,
    FoodName         TEXT NOT NULL,
    CategoryID       INT,
    FOREIGN KEY (CategoryID) REFERENCES FoodCategory (CategoryID)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Fill Foods with data
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (50, 200, 8, 15, 10, 'Guacamole', 2);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (200, 400, 30, 20, 35, 'Salmon Fillet', 5);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (50, 100, 3, 6, 10, 'Hummus', 2);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 120, 10, 4, 15, 'Cottage Cheese', 6);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (30, 60, 1, 4, 7, 'Chocolate Chip Cookies', 8);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 120, 10, 4, 15, 'Greek Yogurt', 6);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (50, 80, 5, 3, 10, 'Almonds', 9);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (150, 200, 6, 12, 20, 'Pork Chops', 3);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (200, 300, 12, 8, 25, 'Grilled Shrimp', 5);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 50, 2, 1, 5, 'Broccoli', 7);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (50, 70, 4, 5, 2, 'Cheddar Cheese', 12);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (30, 20, 1, 0, 5, 'Lettuce', 7);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 120, 8, 5, 10, 'Grilled Chicken', 11);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (50, 60, 3, 4, 2, 'Avocado', 8);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (30, 20, 1, 0, 5, 'Spinach', 7);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 150, 8, 5, 20, 'Ground Beef', 11);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (30, 20, 1, 0, 5, 'Kale', 7);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (30, 20, 1, 0, 5, 'Arugula', 7);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (50, 60, 3, 4, 2, 'Walnuts', 15);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 150, 12, 5, 20, 'Tofu', 11);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (50, 80, 3, 5, 2, 'Blueberries', 9);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 90, 5, 4, 10, 'Salmon', 11);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (50, 120, 10, 8, 1, 'Eggplant', 7);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (30, 30, 2, 0, 5, 'Radish', 7);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 140, 10, 5, 20, 'Tuna', 11);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (50, 70, 2, 7, 1, 'Olive Oil', 12);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (30, 20, 1, 0, 5, 'Armenian Cucumber', 7);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 110, 5, 4, 15, 'Quinoa', 10);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (30, 25, 1, 0, 5, 'Scallions', 7);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (50, 70, 3, 6, 1, 'Coconut Oil', 12);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 80, 8, 2, 10, 'Tempeh', 11);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (30, 20, 1, 0, 5, 'Fennel', 7);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (50, 60, 3, 4, 2, 'Cashews', 15);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 120, 5, 5, 15, 'Lentils', 10);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (50, 80, 4, 6, 2, 'Pistachios', 15);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 130, 10, 3, 15, 'Chickpeas', 10);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (30, 10, 1, 0, 2, 'Watercress', 7);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 150, 9, 5, 20, 'Kidney Beans', 10);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (50, 70, 3, 6, 1, 'Avocado Oil', 12);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (30, 15, 1, 0, 3, 'Red Onion', 7);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 160, 12, 6, 10, 'Tofu', 11);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 130, 3, 3, 25, 'Sweet Potato', 8);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 300, 20, 10, 25, 'Salmon', 3);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 60, 2, 1, 10, 'Cauliflower', 8);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 85, 2, 0, 18, 'Broccoli', 8);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (50, 40, 2, 2, 1, 'Feta Cheese', 4);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 110, 4, 2, 19, 'Brown Rice', 10);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (30, 40, 2, 1, 5, 'Baby Carrots', 7);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 70, 3, 1, 13, 'Green Beans', 8);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (50, 60, 4, 1, 4, 'Egg', 6);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 150, 5, 10, 15, 'Peanut Butter', 2);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 70, 2, 1, 13, 'Cucumber', 7);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 120, 5, 2, 18, 'Oatmeal', 9);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 70, 3, 0, 14, 'Zucchini', 7);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (50, 60, 2, 2, 7, 'Pork Sausage', 3);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 110, 4, 3, 16, 'Barley', 10);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 140, 12, 8, 6, 'Beef Jerky', 3);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 60, 1, 0, 15, 'Spinach', 7);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 70, 3, 1, 12, 'Snow Peas', 8);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (28, 160, 3, 8, 20, 'Doritos Nacho Cheese', 11);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (28, 140, 2, 6, 19, 'Cheetos Crunchy', 11);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (28, 150, 2, 7, 20, 'Lay''s Classic Potato Chips', 11);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (40, 200, 3, 11, 23, 'Ruffles Original Potato Chips', 11);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (28, 160, 2, 8, 21, 'Fritos Original Corn Chips', 11);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (28, 70, 3, 1, 13, 'Whole Wheat Bread', 12);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (28, 80, 2, 1, 16, 'White Bread', 12);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (28, 90, 4, 1, 16, 'Multigrain Bread', 12);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (28, 100, 3, 2, 17, 'Sourdough Bread', 12);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (28, 120, 5, 2, 20, 'Whole Grain Bread', 12);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (28, 90, 3, 1, 16, 'Italian Bread', 12);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (28, 80, 2, 1, 17, 'French Bread', 12);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (28, 100, 4, 2, 18, 'Honey Wheat Bread', 12);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (85, 120, 22, 3, 0, 'Grilled Chicken Breast', 13);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (85, 110, 21, 2, 0, 'Turkey Breast', 13);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (85, 150, 26, 5, 0, 'Lean Beef', 13);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (85, 160, 22, 7, 0, 'Lamb Chops', 13);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (85, 130, 21, 5, 0, 'Pork Loin', 13);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (85, 120, 20, 3, 0, 'Grilled Salmon', 13);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (85, 130, 22, 4, 0, 'Tuna Steak', 13);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (85, 110, 18, 3, 0, 'Grilled Chicken Thigh', 13);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (85, 140, 21, 6, 0, 'Roasted Duck', 13);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (85, 170, 26, 7, 0, 'Grilled Sirloin Steak', 13);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (85, 140, 24, 4, 0, 'Broiled Shrimp', 13);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (85, 150, 23, 5, 0, 'Roasted Lamb Shank', 13);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (85, 120, 19, 3, 0, 'Grilled Pork Chop', 13);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (85, 130, 20, 5, 0, 'Roasted Beef Brisket', 13);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (50, 120, 5, 6, 15, 'Plain Bagel', 14);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 200, 8, 15, 15, 'Breakfast Burrito', 14);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (30, 90, 2, 6, 6, 'Butter Croissant', 14);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (50, 70, 5, 3, 5, 'Boiled Egg', 14);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 250, 8, 20, 10, 'Bacon and Egg Sandwich', 14);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 300, 7, 22, 18, 'Blueberry Pancakes', 14);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (50, 60, 3, 3, 5, 'Banana', 14);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 180, 5, 10, 15, 'French Toast', 14);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (30, 110, 3, 9, 3, 'Almond Croissant', 14);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (50, 100, 3, 5, 10, 'Hash Browns', 14);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (100, 150, 5, 6, 20, 'Fruit Salad', 14);
INSERT INTO Foods(ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID) VALUES (50, 90, 5, 4, 8, 'English Muffin', 14);


-- Create Meals table
CREATE TABLE Meals
(
    MealID        INT PRIMARY KEY AUTO_INCREMENT,
    TotalCalories INT      NOT NULL,
    TotalFat      INT      NOT NULL,
    TotalCarb     INT      NOT NULL,
    TotalProtein  INT      NOT NULL,
    MealName      TEXT     NOT NULL,
    DateCreated   DATETIME NOT NULL,
    CreatorID     INT      NOT NULL,
    FOREIGN KEY (CreatorID) REFERENCES User (UserID)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Fill Meals with data
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (500, 20, 50, 30, 'Oatmeal with Berries', '2023-04-19 08:00:00', 1);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (700, 35, 70, 45, 'Breakfast Sandwich', '2023-04-19 08:30:00', 1);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (400, 10, 50, 20, 'Greek Yogurt with Granola', '2023-04-19 09:00:00', 2);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (600, 25, 60, 35, 'Egg and Cheese Breakfast Burrito', '2023-04-19 10:00:00', 2);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (450, 15, 40, 25, 'Blueberry Protein Smoothie', '2023-04-19 10:30:00', 3);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (550, 20, 50, 30, 'Avocado Toast', '2023-04-19 11:00:00', 3);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (500, 25, 35, 20, 'Bagel with Cream Cheese', '2023-04-19 11:30:00', 4);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (700, 30, 70, 40, 'Pancakes with Maple Syrup', '2023-04-19 12:00:00', 4);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (450, 15, 35, 25, 'Berry and Nut Butter Toast', '2023-04-19 13:00:00', 5);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (550, 20, 50, 30, 'Breakfast Bowl with Quinoa, Eggs, and Avocado', '2023-04-19 13:30:00', 5);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (400, 10, 30, 20, 'Banana and Almond Butter Smoothie', '2023-04-19 14:00:00', 6);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (500, 20, 40, 30, 'Grilled chicken and veggies', '2022-01-01 12:00:00', 1);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (600, 15, 80, 40, 'Salmon and avocado bowl', '2022-01-02 18:30:00', 2);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (400, 10, 50, 20, 'Greek salad with chicken', '2022-01-03 14:00:00', 3);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (550, 30, 45, 35, 'Pesto pasta with shrimp', '2022-01-04 20:00:00', 1);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (700, 40, 60, 50, 'Beef stir fry with veggies', '2022-01-05 13:30:00', 2);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (350, 15, 30, 20, 'Vegetable soup with chicken', '2022-01-06 12:15:00', 3);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (450, 25, 35, 30, 'Baked salmon with asparagus', '2022-01-07 19:00:00', 1);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (550, 20, 70, 35, 'Taco salad with ground beef', '2022-01-08 17:30:00', 2);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (400, 15, 40, 25, 'Quinoa and veggie stir fry', '2022-01-09 13:00:00', 3);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (500, 30, 45, 30, 'Spicy chicken and rice bowl', '2022-01-10 21:00:00', 1);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (350, 15, 25, 20, 'Mixed vegetable omelette', '2022-01-12 09:00:00', 3);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (450, 25, 35, 30, 'Grilled chicken Caesar salad', '2022-01-13 13:30:00', 1);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (550, 20, 70, 35, 'Vegetable and chicken fajitas', '2022-01-14 17:00:00', 2);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (400, 15, 40, 25, 'Tuna and avocado salad', '2022-01-15 12:00:00', 3);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (500, 30, 45, 30, 'Turkey and vegetable stir fry', '2022-01-16 19:30:00', 1);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (650, 40, 55, 45, 'Steak and sweet potato fries', '2022-01-17 18:00:00', 2);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (350, 15, 25, 20, 'Caprese salad with grilled chicken', '2022-01-18 13:00:00', 3);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (450, 25, 35, 30, 'Grilled shrimp and veggie skewers', '2022-01-19 20:00:00', 1);
INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES (550, 20, 70, 35, 'Mediterranean chicken and quinoa bowl', '2022-01-20 14:30:00', 2);

CREATE TABLE MealFoods
(
    MealID INT NOT NULL,
    FoodID INT NOT NULL,
    FOREIGN KEY (MealID) REFERENCES Meals (MealID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (FoodID) REFERENCES Foods (FoodID)
        ON UPDATE CASCADE ON DELETE CASCADE

);

INSERT INTO MealFoods (MealID, FoodID) VALUES (1, 3);
INSERT INTO MealFoods (MealID, FoodID) VALUES (1, 6);
INSERT INTO MealFoods (MealID, FoodID) VALUES (1, 9);
INSERT INTO MealFoods (MealID, FoodID) VALUES (2, 2);
INSERT INTO MealFoods (MealID, FoodID) VALUES (2, 25);
INSERT INTO MealFoods (MealID, FoodID) VALUES (2, 38);
INSERT INTO MealFoods (MealID, FoodID) VALUES (3, 1);
INSERT INTO MealFoods (MealID, FoodID) VALUES (3, 14);
INSERT INTO MealFoods (MealID, FoodID) VALUES (3, 17);
INSERT INTO MealFoods (MealID, FoodID) VALUES (4, 13);
INSERT INTO MealFoods (MealID, FoodID) VALUES (4, 26);
INSERT INTO MealFoods (MealID, FoodID) VALUES (4, 29);
INSERT INTO MealFoods (MealID, FoodID) VALUES (5, 22);
INSERT INTO MealFoods (MealID, FoodID) VALUES (5, 25);
INSERT INTO MealFoods (MealID, FoodID) VALUES (5, 18);
INSERT INTO MealFoods (MealID, FoodID) VALUES (6, 11);
INSERT INTO MealFoods (MealID, FoodID) VALUES (6, 34);
INSERT INTO MealFoods (MealID, FoodID) VALUES (6, 7);
INSERT INTO MealFoods (MealID, FoodID) VALUES (7, 3);
INSERT INTO MealFoods (MealID, FoodID) VALUES (7, 6);
INSERT INTO MealFoods (MealID, FoodID) VALUES (1, 3);
INSERT INTO MealFoods (MealID, FoodID) VALUES (1, 6);
INSERT INTO MealFoods (MealID, FoodID) VALUES (1, 9);
INSERT INTO MealFoods (MealID, FoodID) VALUES (2, 42);
INSERT INTO MealFoods (MealID, FoodID) VALUES (2, 35);
INSERT INTO MealFoods (MealID, FoodID) VALUES (2, 28);
INSERT INTO MealFoods (MealID, FoodID) VALUES (3, 11);
INSERT INTO MealFoods (MealID, FoodID) VALUES (3, 14);
INSERT INTO MealFoods (MealID, FoodID) VALUES (3, 7);
INSERT INTO MealFoods (MealID, FoodID) VALUES (4, 33);
INSERT INTO MealFoods (MealID, FoodID) VALUES (4, 16);
INSERT INTO MealFoods (MealID, FoodID) VALUES (4, 19);
INSERT INTO MealFoods (MealID, FoodID) VALUES (5, 22);
INSERT INTO MealFoods (MealID, FoodID) VALUES (5, 15);
INSERT INTO MealFoods (MealID, FoodID) VALUES (5, 8);
INSERT INTO MealFoods (MealID, FoodID) VALUES (6, 1);
INSERT INTO MealFoods (MealID, FoodID) VALUES (6, 4);
INSERT INTO MealFoods (MealID, FoodID) VALUES (6, 7);
INSERT INTO MealFoods (MealID, FoodID) VALUES (7, 3);
INSERT INTO MealFoods (MealID, FoodID) VALUES (7, 6);
INSERT INTO MealFoods (MealID, FoodID) VALUES (7, 9);
INSERT INTO MealFoods (MealID, FoodID) VALUES (8, 12);
INSERT INTO MealFoods (MealID, FoodID) VALUES (8, 5);
INSERT INTO MealFoods (MealID, FoodID) VALUES (8, 8);
INSERT INTO MealFoods (MealID, FoodID) VALUES (9, 1);
INSERT INTO MealFoods (MealID, FoodID) VALUES (9, 4);
INSERT INTO MealFoods (MealID, FoodID) VALUES (9, 7);
INSERT INTO MealFoods (MealID, FoodID) VALUES (10, 3);
INSERT INTO MealFoods (MealID, FoodID) VALUES (10, 26);
INSERT INTO MealFoods (MealID, FoodID) VALUES (10, 9);
INSERT INTO MealFoods (MealID, FoodID) VALUES (11, 22);
INSERT INTO MealFoods (MealID, FoodID) VALUES (11, 5);
INSERT INTO MealFoods (MealID, FoodID) VALUES (11, 8);
INSERT INTO MealFoods (MealID, FoodID) VALUES (12, 1);
INSERT INTO MealFoods (MealID, FoodID) VALUES (12, 24);
INSERT INTO MealFoods (MealID, FoodID) VALUES (12, 7);
INSERT INTO MealFoods (MealID, FoodID) VALUES (13, 3);
INSERT INTO MealFoods (MealID, FoodID) VALUES (13, 6);
INSERT INTO MealFoods (MealID, FoodID) VALUES (13, 9);
INSERT INTO MealFoods (MealID, FoodID) VALUES (14, 2);
INSERT INTO MealFoods (MealID, FoodID) VALUES (14, 5);
INSERT INTO MealFoods (MealID, FoodID) VALUES (14, 8);
INSERT INTO MealFoods (MealID, FoodID) VALUES (15, 1);
INSERT INTO MealFoods (MealID, FoodID) VALUES (15, 4);
INSERT INTO MealFoods (MealID, FoodID) VALUES (15, 7);
INSERT INTO MealFoods (MealID, FoodID) VALUES (16, 3);
INSERT INTO MealFoods (MealID, FoodID) VALUES (16, 6);
INSERT INTO MealFoods (MealID, FoodID) VALUES (16, 9);
INSERT INTO MealFoods (MealID, FoodID) VALUES (17, 2);
INSERT INTO MealFoods (MealID, FoodID) VALUES (17, 5);
INSERT INTO MealFoods (MealID, FoodID) VALUES (17, 8);
INSERT INTO MealFoods (MealID, FoodID) VALUES (18, 1);
INSERT INTO MealFoods (MealID, FoodID) VALUES (18, 4);
INSERT INTO MealFoods (MealID, FoodID) VALUES (18, 7);
INSERT INTO MealFoods (MealID, FoodID) VALUES (19, 3);
INSERT INTO MealFoods (MealID, FoodID) VALUES (19, 6);
INSERT INTO MealFoods (MealID, FoodID) VALUES (19, 9);
INSERT INTO MealFoods (MealID, FoodID) VALUES (20, 2);
INSERT INTO MealFoods (MealID, FoodID) VALUES (20, 5);
INSERT INTO MealFoods (MealID, FoodID) VALUES (20, 8);

-- Create MealPlan table
CREATE TABLE MealPlan
(
    MealPlanID   INT PRIMARY KEY AUTO_INCREMENT,
    NumWeeks     INT  NOT NULL,
    MealPlanName TEXT NOT NULL,
    CreatorID    INT,
    GoalID       INT,
    FOREIGN KEY (CreatorID) REFERENCES User (UserID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (GoalID) REFERENCES Goals (GoalID)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

INSERT INTO MealPlan (NumWeeks, MealPlanName, CreatorID, GoalID) VALUES (4, 'Vegan Meal Plan', 2, 1);
INSERT INTO MealPlan (NumWeeks, MealPlanName, CreatorID, GoalID) VALUES (8, 'Keto Meal Plan', 3, 2);
INSERT INTO MealPlan (NumWeeks, MealPlanName, CreatorID, GoalID) VALUES (6, 'Low-Carb Meal Plan', 4, 3);
INSERT INTO MealPlan (NumWeeks, MealPlanName, CreatorID, GoalID) VALUES (12, 'Weight Loss Meal Plan', 5, 4);
INSERT INTO MealPlan (NumWeeks, MealPlanName, CreatorID, GoalID) VALUES (12, 'Weight Gain Meal Plan', 5, 5);
INSERT INTO MealPlan (NumWeeks, MealPlanName, CreatorID, GoalID) VALUES (8, 'Muscle Gain Meal Plan', 6, 5);
INSERT INTO MealPlan (NumWeeks, MealPlanName, CreatorID, GoalID) VALUES (10, 'Gluten-Free Meal Plan', 7, 6);
INSERT INTO MealPlan (NumWeeks, MealPlanName, CreatorID, GoalID) VALUES (4, 'High-Protein Meal Plan', 8, 7);
INSERT INTO MealPlan (NumWeeks, MealPlanName, CreatorID, GoalID) VALUES (8, 'Vegetarian Meal Plan', 9, 8);
INSERT INTO MealPlan (NumWeeks, MealPlanName, CreatorID, GoalID) VALUES (12, 'Heart-Healthy Meal Plan', 10, 9);
INSERT INTO MealPlan (NumWeeks, MealPlanName, CreatorID, GoalID) VALUES (4, 'Paleo Meal Plan', 11, 10);
INSERT INTO MealPlan (NumWeeks, MealPlanName, CreatorID, GoalID) VALUES (6, 'Mediterranean Meal Plan', 12, 11);
INSERT INTO MealPlan (NumWeeks, MealPlanName, CreatorID, GoalID) VALUES (8, 'Intermittent Fasting Meal Plan', 13, 12);
INSERT INTO MealPlan (NumWeeks, MealPlanName, CreatorID, GoalID) VALUES (12, 'Clean Eating Meal Plan', 14, 13);
INSERT INTO MealPlan (NumWeeks, MealPlanName, CreatorID, GoalID) VALUES (4, 'Dairy-Free Meal Plan', 15, 14);
INSERT INTO MealPlan (NumWeeks, MealPlanName, CreatorID, GoalID) VALUES (6, 'Whole30 Meal Plan', 16, 15);
INSERT INTO MealPlan (NumWeeks, MealPlanName, CreatorID, GoalID) VALUES (8, 'Flexitarian Meal Plan', 17, 16);
INSERT INTO MealPlan (NumWeeks, MealPlanName, CreatorID, GoalID) VALUES (10, 'Diabetes-Friendly Meal Plan', 18, 17);
INSERT INTO MealPlan (NumWeeks, MealPlanName, CreatorID, GoalID) VALUES (4, 'Alkaline Diet Meal Plan', 19, 18);
INSERT INTO MealPlan (NumWeeks, MealPlanName, CreatorID, GoalID) VALUES (6, 'FODMAP-Friendly Meal Plan', 20, 19);

CREATE TABLE PlanMeals
(
    MealPlanID INT,
    MealID     INT,
    PRIMARY KEY (MealPlanID, MealID),
    FOREIGN KEY (MealPlanID) REFERENCES MealPlan (MealPlanID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (MealID) REFERENCES Meals (MealID)
        ON UPDATE CASCADE ON DELETE CASCADE

);

INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (1, 1);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (1, 2);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (1, 3);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (2, 4);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (2, 5);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (2, 6);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (3, 7);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (3, 8);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (3, 9);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (4, 10);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (4, 11);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (4, 12);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (5, 13);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (5, 14);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (5, 15);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (6, 16);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (6, 17);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (6, 18);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (7, 19);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (7, 20);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (8, 1);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (8, 4);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (8, 7);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (9, 2);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (9, 5);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (9, 8);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (10, 3);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (10, 6);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (10, 9);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (11, 10);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (11, 13);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (11, 16);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (12, 11);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (12, 14);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (12, 17);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (13, 12);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (13, 15);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (13, 18);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (14, 19);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (14, 2);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (15, 4);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (15, 6);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (15, 10);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (16, 1);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (16, 5);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (16, 11);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (17, 2);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (17, 6);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (17, 12);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (18, 3);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (18, 5);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (18, 15);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (19, 4);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (19, 6);
INSERT INTO PlanMeals (MealPlanID, MealID) VALUES (19, 16);

-- Create Exercise table
CREATE TABLE Exercise
(
    ExerciseID    INT PRIMARY KEY AUTO_INCREMENT,
    ExerciseName  TEXT NOT NULL,
    Equipment     TEXT,
    MuscleGroupID INT  NOT NULL,
    FOREIGN KEY (MuscleGroupID) REFERENCES MuscleGroup (MuscleGroupID)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Barbell Squat', 'Barbell', 1);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Leg Press', 'Leg Press Machine', 1);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Deadlift', 'Barbell', 3);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Lying Leg Curls', 'Leg Curl Machine', 3);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Bench Press', 'Barbell, Bench', 4);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Dumbbell Flyes', 'Dumbbells, Bench', 4);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Chin-Up', 'Pull-Up Bar', 5);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Lat Pulldown', 'Lat Pulldown Machine', 5);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Crunch', 'Bodyweight', 6);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Cable Crunch', 'Cable Machine', 6);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Dumbbell Curl', 'Dumbbells', 7);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Barbell Curl', 'Barbell', 7);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Tricep Extension', 'Dumbbells', 8);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Skullcrusher', 'EZ Bar', 8);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Standing Calf Raise', 'Calf Raise Machine', 9);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Seated Calf Raise', 'Calf Raise Machine', 9);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Dumbbell Shrug', 'Dumbbells', 10);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Barbell Shrug', 'Barbell', 10);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Wrist Curl', 'Dumbbells', 11);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Reverse Wrist Curl', 'Dumbbells', 11);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Incline Dumbbell Press', 'Dumbbell', 4);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Seated Cable Row', 'Cable Machine', 5);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Lateral Raise', 'Dumbbell', 13);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Hammer Curl', 'Dumbbell', 7);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Tricep Pushdown', 'Cable Machine', 8);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Hip Thrust', 'Barbell', 2);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Dumbbell Lunges', 'Dumbbell', 1);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Cable Pulldown', 'Cable Machine', 5);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Decline Bench Press', 'Barbell', 4);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Reverse Fly', 'Dumbbell', 13);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Shoulder Press', 'Barbell', 13);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Dumbbell Bench Press', 'Dumbbell', 4);
INSERT INTO Exercise (ExerciseName, Equipment, MuscleGroupID) VALUES ('Pull Ups', 'Pull Up Bar', 5);

-- Create ExercisePlan table
CREATE TABLE ExercisePlan
(
    PlanID     INT PRIMARY KEY AUTO_INCREMENT,
    CreatorID  INT,
    NumSets    INT NOT NULL,
    NumReps    INT NOT NULL,
    WeightLbs  INT NOT NULL,
    ExerciseID INT,
    FOREIGN KEY (CreatorID) REFERENCES User (UserID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ExerciseID) REFERENCES Exercise (ExerciseID)
        ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (1, 3, 12, 150, 5);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (2, 4, 10, 135, 1);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (3, 5, 8, 185, 8);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (4, 3, 12, 120, 6);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (1, 4, 10, 165, 9);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (2, 5, 8, 200, 2);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (3, 3, 12, 140, 12);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (4, 4, 10, 175, 3);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (1, 5, 8, 210, 7);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (2, 3, 12, 130, 10);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (3, 4, 10, 155, 4);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (4, 5, 8, 195, 11);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (1, 3, 12, 125, 1);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (2, 4, 10, 155, 5);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (3, 5, 8, 190, 8);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (4, 3, 12, 115, 6);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (1, 4, 10, 160, 9);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (2, 5, 8, 195, 2);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (2, 3, 12, 120, 14);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (1, 4, 10, 80, 22);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (3, 5, 8, 60, 9);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (4, 3, 12, 110, 7);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (5, 4, 10, 90, 3);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (6, 5, 8, 70, 12);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (7, 3, 12, 100, 18);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (8, 4, 10, 75, 20);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (9, 5, 8, 50, 8);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (10, 3, 12, 130, 16);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (3, 4, 12, 100, 21);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (5, 3, 10, 50, 12);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (2, 5, 8, 120, 3);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (4, 4, 6, 200, 9);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (1, 3, 12, 90, 11);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (6, 5, 8, 150, 15);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (7, 4, 10, 80, 2);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (8, 3, 6, 220, 18);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (10, 5, 12, 100, 20);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (2, 4, 8, 110, 7);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (3, 3, 10, 70, 4);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (5, 5, 6, 180, 1);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (4, 4, 8, 120, 5);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (6, 3, 12, 80, 8);
INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES (7, 5, 10, 100, 19);


-- Create Workouts table
CREATE TABLE Workout
(
    WorkoutID     INT PRIMARY KEY AUTO_INCREMENT,
    WorkoutName   VARCHAR(50) NOT NULL,
    WorkoutDesc   TEXT        NOT NULL,
    DateCreated   DATETIME    NOT NULL,
    CreatorID     INT         NOT NULL,
    FOREIGN KEY (CreatorID) REFERENCES User (UserID)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

INSERT INTO Workout (WorkoutName, WorkoutDesc, DateCreated, CreatorID)
VALUES ('Leg Day', 'A workout focused on lower body exercises.', '2023-04-19 08:00:00', 1),
       ('Push Day', 'A workout focused on pushing exercises such as bench press and overhead press.', '2023-04-19 09:00:00', 9),
       ('Pull Day', 'A workout focused on pulling exercises such as rows and pull-ups.', '2023-04-19 10:00:00', 1),
       ('Full Body', 'A workout that targets all major muscle groups in one session.', '2023-04-19 11:00:00', 3),
       ('HIIT', 'High-intensity interval training that alternates between periods of intense exercise and rest.', '2023-04-19 12:00:00', 2),
       ('Core', 'A workout that focuses on strengthening the core muscles.', '2023-04-19 13:00:00', 1),
       ('Arms', 'A workout focused on biceps and triceps exercises.', '2023-04-19 14:00:00', 13),
       ('Chest', 'A workout focused on chest exercises such as bench press and flys.', '2023-04-19 15:00:00', 2),
       ('Back', 'A workout focused on back exercises such as rows and pull-ups.', '2023-04-19 16:00:00', 11),
       ('Shoulders', 'A workout focused on shoulder exercises such as overhead press and lateral raises.', '2023-04-19 17:00:00', 22),
       ('Legs and Glutes', 'A workout focused on lower body exercises such as squats and lunges.', '2023-04-19 18:00:00', 3),
       ('Upper Body', 'A workout that targets the upper body muscles including chest, back, shoulders, and arms.', '2023-04-19 19:00:00', 1),
       ('Lower Body', 'A workout that targets the lower body muscles including quads, glutes, and hamstrings.', '2023-04-19 20:00:00', 12),
       ('Cardio', 'A workout focused on cardiovascular exercises such as running and cycling.', '2023-04-19 21:00:00', 8),
       ('Stretching', 'A workout focused on stretching and improving flexibility.', '2023-04-19 22:00:00', 21),
       ('Powerlifting', 'A workout focused on the three powerlifting exercises: squat, bench press, and deadlift.', '2023-04-19 23:00:00', 2),
       ('Strongman', 'A workout that includes strongman exercises such as tire flips and farmer carries.', '2023-04-20 00:00:00', 3),
       ('Olympic Weightlifting', 'A workout focused on the two Olympic weightlifting exercises: snatch and clean and jerk.', '2023-04-20 01:00:00', 1),
       ('Plyometrics', 'A workout that includes explosive exercises such as jump squats and box jumps.', '2023-04-20 02:00:00', 14);

CREATE TABLE WorkoutExercises
(
    WorkoutID  INT,
    ExerciseID INT,
    PRIMARY KEY (WorkoutID, ExerciseID),
    FOREIGN KEY (WorkoutID) REFERENCES Workout (WorkoutID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ExerciseID) REFERENCES Exercise (ExerciseID)
        ON UPDATE CASCADE ON DELETE CASCADE

);

INSERT INTO WorkoutExercises (WorkoutID, ExerciseID)
VALUES (1, 1),
(1, 3),
(1, 5),
(1, 8),
(1, 11),
(2, 2),
(2, 4),
(2, 6),
(2, 9),
(2, 12),
(3, 3),
(3, 5),
(3, 7),
(3, 10),
(3, 11),
(4, 2),
(4, 4),
(4, 6),
(4, 8),
(4, 12),
(5, 1),
(5, 3),
(5, 5),
(5, 7),
(5, 11),
(6, 2),
(6, 4),
(6, 6),
(6, 8),
(6, 10),
(7, 1),
(7, 4),
(7, 7),
(7, 10),
(7, 12),
(8, 3),
(8, 5),
(8, 8),
(8, 11),
(8, 12),
(9, 1),
(9, 3),
(9, 6),
(9, 9),
(9, 12),
(10, 2),
(10, 4),
(10, 7),
(10, 10),
(10, 11),
(11, 1),
(11, 5),
(11, 8),
(11, 10),
(11, 12),
(12, 2),
(12, 4),
(12, 6),
(12, 9),
(12, 11),
(13, 3),
(13, 5),
(13, 7),
(13, 8),
(13, 10),
(14, 2),
(14, 4),
(14, 6),
(14, 9),
(14, 11),
(15, 1),
(15, 3),
(15, 6),
(15, 8),
(15, 12),
(16, 1),
(16, 2),
(16, 4),
(16, 5),
(16, 11),
(17, 1),
(17, 3),
(17, 6),
(17, 9),
(17, 10),
(18, 2),
(18, 5),
(18, 7),
(18, 11),
(18, 12),
(19, 1),
(19, 4),
(19, 6),
(19, 8),
(19, 13);


-- Create WorkoutPlan table
CREATE TABLE WorkoutPlan
(
    WorkoutPlanID   INT PRIMARY KEY AUTO_INCREMENT,
    CreatorID       INT,
    PlanName        VARCHAR(50) NOT NULL,
    PlanDescription TEXT,
    NumWeeks        INT,
    GoalID          INT,
    FOREIGN KEY (CreatorID) REFERENCES User (UserID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (GoalID) REFERENCES Goals (GoalID)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

INSERT INTO WorkoutPlan (CreatorID, PlanName, PlanDescription, NumWeeks, GoalID)
VALUES (1, 'Summer Slimdown', 'Get ready for beach season', 12, 1),
       (2, 'Bulk Up', 'Pack on some serious muscle mass', 16, 2),
       (3, 'Marathon Training', 'Train for your next long-distance race', 20, 3),
       (4, 'Yoga Challenge', 'Deepen your practice with a 30-day challenge', 4, 4),
       (5, 'Functional Fitness', 'Improve your daily movement patterns', 8, 5),
       (6, 'Swim to Win', 'Improve your swimming technique and speed', 12, 6),
       (7, 'HIIT It!', 'Get in the best shape of your life with high-intensity interval training', 8, 7),
       (8, 'Bodyweight Blast', 'Build strength and muscle using only your bodyweight', 6, 8),
       (9, 'Powerlifting Program', 'Take your strength to the next level', 12, 9),
       (10, 'Prenatal Pilates', 'Stay fit and healthy during pregnancy', 9, 10),
       (11, 'Rock Climbing Prep', 'Train for your next outdoor climbing trip', 12, 11),
       (12, 'Gymnastics Skills', 'Learn new gymnastics skills and improve old ones', 16, 12),
       (13, 'Kettlebell Conditioning', 'Get in shape with this full-body kettlebell workout', 8, 13),
       (14, 'Flexibility Focus', 'Improve your flexibility and mobility', 4, 14),
       (15, 'Stronger Together', 'Train with a partner and achieve your goals together', 6, 15),
       (16, 'Functional Bodybuilding', 'Build a strong, functional physique', 12, 5),
       (17, 'Cardio Kickboxing', 'Get your heart pumping with this fun and challenging workout', 8, 16),
       (18, 'Postpartum Progress', 'Ease back into fitness after giving birth', 12, 10),
       (19, 'Olympic Weightlifting', 'Master the snatch and clean and jerk', 16, 9),
       (2, 'Summer Shred', 'Get ready for the beach with this 6-week program!', 6, 2),
       (4, '5x5 Strength', 'Build overall strength with this classic program!', 12, 1),
       (3, 'Marathon Training', 'Get ready for a full marathon with this 16-week plan!', 16, 3),
       (2, 'Bikini Body', 'Tone and sculpt your body with this 8-week program!', 8, 2),
       (1, 'Powerlifting Program', 'Focus on the big 3 lifts with this 12-week program!', 12, 1),
       (5, 'Couch to 5K', 'Start running with this 8-week program for beginners!', 8, 3),
       (3, 'Full Body Blast', 'Tone and strengthen your whole body with this 10-week program!', 10, 2),
       (1, 'Hypertrophy Program', 'Maximize muscle growth with this 8-week program!', 8, 2),
       (4, 'Functional Fitness', 'Improve your overall fitness with this 10-week program!', 10, 1),
       (5, 'Yoga for Beginners', 'Start your yoga journey with this 6-week program!', 6, 3);

CREATE TABLE PlanWorkouts
(
    WorkoutPlanID INT,
    WorkoutID     INT,
    PRIMARY KEY (WorkoutPlanID, WorkoutID),
    FOREIGN KEY (WorkoutPlanID) REFERENCES WorkoutPlan (WorkoutPlanID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (WorkoutID) REFERENCES Workout (WorkoutID)
        ON UPDATE CASCADE ON DELETE CASCADE

);

INSERT INTO PlanWorkouts (WorkoutPlanID, WorkoutID)
VALUES (1, 1),
(1, 3),
(1, 5),
(2, 2),
(2, 4),
(3, 6),
(3, 8),
(4, 10),
(4, 12),
(5, 7),
(6, 11),
(6, 13),
(7, 2),
(8, 8),
(9, 1),
(9, 3),
(9, 5),
(10, 7),
(10, 9),
(11, 10),
(12, 6),
(13, 2),
(13, 11),
(14, 12),
(15, 3),
(16, 8),
(17, 1),
(17, 7),
(18, 5),
(18, 13),
(19, 4),
(19, 9),
(19, 11);

-- Create MealHistory table
CREATE TABLE MealHistory
(
    EntryID     INT PRIMARY KEY AUTO_INCREMENT,
    UserID      INT,
    DateOfEntry DATETIME,
    MealID      INT,
    FOREIGN KEY (UserID) REFERENCES User (UserID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (MealID) REFERENCES Meals (MealID)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

INSERT INTO MealHistory (UserID, DateOfEntry, MealID)
VALUES (1, '2022-01-01 08:00:00', 1),
       (1, '2022-01-01 12:00:00', 4),
       (1, '2022-01-01 18:00:00', 7),
       (2, '2022-01-01 07:30:00', 2),
       (2, '2022-01-01 12:30:00', 5),
       (2, '2022-01-01 19:00:00', 8),
       (3, '2022-01-01 08:30:00', 3),
       (3, '2022-01-01 13:00:00', 6),
       (3, '2022-01-01 20:00:00', 9),
       (4, '2022-01-02 08:00:00', 10),
       (4, '2022-01-02 12:00:00', 13),
       (4, '2022-01-02 18:00:00', 16),
       (5, '2022-01-02 07:30:00', 11),
       (5, '2022-01-02 12:30:00', 14),
       (5, '2022-01-02 19:00:00', 17),
       (6, '2022-01-02 08:30:00', 12),
       (6, '2022-01-02 13:00:00', 15),
       (6, '2022-01-02 20:00:00', 18),
       (7, '2022-01-03 08:00:00', 1),
       (7, '2022-01-03 12:00:00', 4),
       (7, '2022-01-03 18:00:00', 7),
       (8, '2022-01-03 07:30:00', 2),
       (8, '2022-01-03 12:30:00', 5),
       (8, '2022-01-03 19:00:00', 8),
       (9, '2022-01-03 08:30:00', 3),
       (9, '2022-01-03 13:00:00', 6),
       (9, '2022-01-03 20:00:00', 9),
       (10, '2022-01-04 08:00:00', 10),
       (10, '2022-01-04 12:00:00', 13),
       (10, '2022-01-04 18:00:00', 16),
       (11, '2022-01-04 07:30:00', 11),
       (11, '2022-01-04 12:30:00', 14),
       (11, '2022-01-04 19:00:00', 17),
       (12, '2022-01-04 08:30:00', 12),
       (12, '2022-01-04 13:00:00', 15),
       (1, '2022-09-02 18:45:00', 1),
       (2, '2022-08-25 07:30:00', 2),
       (3, '2022-08-30 12:15:00', 3),
       (4, '2022-09-01 08:00:00', 4),
       (5, '2022-08-26 19:00:00', 5),
       (6, '2022-09-04 13:45:00', 6),
       (7, '2022-08-28 08:30:00', 7),
       (8, '2022-08-29 19:00:00', 8),
       (9, '2022-09-02 12:00:00', 9),
       (10, '2022-09-01 07:15:00', 10),
       (1, '2022-08-28 13:00:00', 2),
       (2, '2022-08-31 18:30:00', 4),
       (3, '2022-08-26 08:15:00', 6),
       (4, '2022-09-03 11:00:00', 8),
       (5, '2022-08-30 19:30:00', 10),
       (6, '2022-09-01 12:45:00', 1),
       (7, '2022-08-29 07:00:00', 3),
       (8, '2022-09-04 19:00:00', 5),
       (9, '2022-08-31 13:30:00', 7),
       (10, '2022-09-02 08:15:00', 9),
       (1, '2022-08-26 12:30:00', 4),
       (2, '2022-08-29 18:00:00', 6),
       (3, '2022-09-03 07:45:00', 8),
       (4, '2022-08-31 11:30:00', 10),
       (5, '2022-09-01 19:15:00', 1),
       (6, '2022-08-30 12:45:00', 3),
       (7, '2022-09-02 07:00:00', 5),
       (8, '2022-09-04 19:45:00', 7),
       (9, '2022-08-29 13:15:00', 9),
       (10, '2022-08-26 08:45:00', 2),
       (1, '2022-08-31 12:00:00', 6),
       (2, '2022-08-26 17:30:00', 8),
       (3, '2022-09-01 07:15:00', 10),
       (4, '2022-08-30 10:30:00', 1);
       

-- Create WorkoutHistory table
CREATE TABLE WorkoutHistory
(
    EntryID     INT PRIMARY KEY AUTO_INCREMENT,
    UserID      INT,
    DateOfEntry DATETIME,
    WorkoutID   INT,
    FOREIGN KEY (UserID) REFERENCES User (UserID)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (WorkoutID) REFERENCES Workout (WorkoutID)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (1, '2022-01-01 08:00:00', 1);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (2, '2022-01-02 12:30:00', 3);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (3, '2022-01-03 17:15:00', 2);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (4, '2022-01-04 09:45:00', 1);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (5, '2022-01-05 14:00:00', 3);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (6, '2022-01-06 18:00:00', 2);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (7, '2022-01-07 10:30:00', 1);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (8, '2022-01-08 13:45:00', 3);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (9, '2022-01-09 16:15:00', 2);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (10, '2022-01-10 11:00:00', 1);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (1, '2022-01-11 07:30:00', 2);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (1, '2022-01-12 12:00:00', 3);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (1, '2022-01-13 18:00:00', 1);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (2, '2022-01-14 08:30:00', 1);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (2, '2022-01-15 13:00:00', 12);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (2, '2022-01-16 16:30:00', 3);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (3, '2022-01-17 10:00:00', 5);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (3, '2022-01-18 14:00:00', 2);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (3, '2022-01-19 19:00:00', 1);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (4, '2022-01-20 11:30:00', 1);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (4, '2022-01-21 15:00:00', 8);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (4, '2022-01-22 17:45:00', 2);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (5, '2022-01-23 09:00:00', 12);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (5, '2022-01-24 12:30:00', 11);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (5, '2022-01-25 16:00:00', 9);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (6, '2022-01-26 08:30:00', 7);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (7, '2022-01-27 12:00:00', 4);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (8, '2022-01-28 17:30:00', 3);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (9, '2022-01-29 09:00:00', 1);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (10, '2022-01-30 14:30:00', 2);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (11, '2022-01-31 19:00:00', 3);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (12, '2022-02-01 10:30:00', 13);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (13, '2022-02-02 15:00:00', 1);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (14, '2022-02-03 17:45:00', 2);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (15, '2022-02-04 08:00:00', 3);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (16, '2022-02-10 13:45:23', 1);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (17, '2022-02-15 09:20:37', 12);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (18, '2022-02-20 16:55:42', 13);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (19, '2022-02-22 08:10:15', 1);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (20, '2022-03-01 14:30:58', 6);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (21, '2022-03-07 19:45:21', 3);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (22, '2022-03-10 10:05:33', 7);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (23, '2022-03-16 15:20:12', 1);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (24, '2022-03-20 18:30:05', 5);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (25, '2022-03-25 07:40:50', 3);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (26, '2022-04-01 12:15:25', 1);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (27, '2022-04-07 16:35:59', 4);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (28, '2022-04-10 19:50:02', 3);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (29, '2022-04-16 11:25:39', 7);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (30, '2022-04-22 15:45:01', 1);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (31, '2022-04-25 18:55:57', 9);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (32, '2022-04-30 08:30:33', 3);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (33, '2022-05-05 13:10:48', 10);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (34, '2022-05-10 17:30:23', 2);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (35, '2022-05-13 20:45:19', 3);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (16, '2022-02-10 13:45:23', 1);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (17, '2022-02-15 09:20:37', 2);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (18, '2022-02-20 16:55:42', 3);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (19, '2022-02-22 08:10:15', 1);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (20, '2022-03-01 14:30:58', 2);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (21, '2022-03-07 19:45:21', 3);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (22, '2022-03-10 10:05:33', 3);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (23, '2022-03-16 15:20:12', 1);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (24, '2022-03-20 18:30:05', 6);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (25, '2022-03-25 07:40:50', 7);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (26, '2022-04-01 12:15:25', 9);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (27, '2022-04-07 16:35:59', 3);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (28, '2022-04-10 19:50:02', 5);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (29, '2022-04-16 11:25:39', 1);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (30, '2022-04-22 15:45:01', 5);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (31, '2022-04-25 18:55:57', 2);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (32, '2022-04-30 08:30:33', 2);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (33, '2022-05-05 13:10:48', 7);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (34, '2022-05-10 17:30:23', 12);
INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES (35, '2022-05-13 20:45:19', 3);




