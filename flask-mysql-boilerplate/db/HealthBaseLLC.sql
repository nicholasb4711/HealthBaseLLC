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


-- -----------------------------------------------------------

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

-- Create MuscleGroup table
CREATE TABLE MuscleGroup
(
    MuscleGroupID   INT PRIMARY KEY AUTO_INCREMENT,
    MuscleGroupName VARCHAR(50) NOT NULL
);

-- Create FoodCategory table
CREATE TABLE FoodCategory
(
    CategoryID   INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName TEXT NOT NULL,
    CategoryDesc TEXT NOT NULL
);

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

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (1, 100, 200, 20, 10, 30, 'Chicken Breast', 1, 1);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (2, 50, 50, 5, 3, 2, 'Egg', 2, 2);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (3, 200, 300, 30, 15, 40, 'Salmon Fillet', 1, 3);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (4, 150, 100, 8, 5, 12, 'Brown Rice', 3, 4);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (5, 30, 40, 3, 2, 5, 'Cheddar Cheese', 4, 5);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (6, 100, 150, 15, 7, 20, 'Beef Sirloin', 1, 6);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (7, 150, 200, 25, 8, 25, 'Pork Loin', 1, 7);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (8, 20, 10, 1, 0, 2, 'Spinach', 2, 8);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (9, 100, 80, 2, 0, 20, 'Broccoli', 2, 9);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (10, 50, 120, 6, 5, 10, 'Avocado', 4, 10);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (11, 200, 250, 20, 10, 30, 'Tofu', 2, 11);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (12, 100, 120, 12, 3, 15, 'Tuna', 1, 12);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (13, 50, 60, 4, 2, 8, 'Black Beans', 3, 13);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (14, 150, 100, 6, 3, 15, 'Quinoa', 3, 14);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (15, 100, 120, 15, 2, 8, 'Shrimp', 1, 15);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (16, 50, 70, 5, 2, 10, 'Almonds', 4, 16);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (17, 100, 200, 25, 5, 15, 'Ground Turkey', 1, 17);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (18, 150, 120, 8, 5, 10, 'Sweet Potato', 3, 18);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (19, 30, 40, 2, 1, 5, 'Tomato', 2, 19);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (20, 100, 180, 12, 8, 10, 'Salami', 1, 20);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (21, 50, 60, 3, 2, 10, 'Peanut Butter', 4, 21);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (22, 100, 100, 10, 5, 10, 'Cod Fillet', 1, 22);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (23, 150, 150, 10, 8, 15, 'Pinto Beans', 3, 23);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (24, 20, 20, 1, 1, 3, 'Lettuce', 2, 24);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (25, 30, 50, 2, 2, 10, 'Onion', 2, 25);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (26, 50, 70, 8, 2, 6, 'Chicken Breast', 1, 26);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (27, 150, 200, 12, 8, 15, 'Brown Rice', 3, 27);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (28, 100, 130, 5, 6, 10, 'Smoked Salmon', 1, 28);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (29, 50, 60, 4, 3, 6, 'Pork Chop', 1, 29);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (30, 100, 120, 6, 3, 15, 'Tofu', 1, 30);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (31, 30, 40, 2, 1, 5, 'Sesame Seeds', 3, 31);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (32, 50, 60, 5, 2, 5, 'Peanut Butter', 3, 32);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (33, 100, 90, 8, 2, 10, 'Cottage Cheese', 1, 33);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (34, 150, 130, 10, 5, 10, 'Hummus', 3, 34);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (35, 50, 50, 3, 2, 5, 'Almonds', 3, 35);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (36, 100, 80, 3, 3, 15, 'Quinoa', 3, 36);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (37, 50, 70, 2, 7, 5, 'Avocado', 3, 37);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (38, 150, 190, 8, 5, 20, 'Sweet Potato', 2, 38);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (39, 25, 30, 1, 1, 6, 'Cucumber', 2, 39);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (40, 100, 150, 12, 5, 10, 'Salmon Fillet', 1, 40);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (41, 50, 60, 4, 3, 6, 'Pork Loin', 1, 41);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (42, 100, 120, 6, 3, 15, 'Tempeh', 1, 42);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (43, 150, 200, 8, 7, 20, 'Beef Steak', 1, 43);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (44, 50, 60, 2, 2, 10, 'Cashews', 3, 44);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (45, 100, 60, 2, 0, 14, 'Spinach', 2, 45);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (46, 50, 70, 3, 4, 5, 'Walnuts', 3, 46);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (47, 150, 160, 10, 5, 10, 'Chicken Breast', 1, 47);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (48, 100, 70, 3, 2, 12, 'Green Beans', 2, 48);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (49, 50, 30, 2, 0, 6, 'Radishes', 2, 49);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (50, 100, 160, 5, 7, 20, 'Tofu', 1, 50);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (51, 150, 180, 9, 4, 20, 'Pinto Beans', 1, 51);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (52, 100, 140, 7, 5, 15, 'Black Beans', 1, 52);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (53, 50, 30, 1, 0, 8, 'Celery', 2, 53);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (54, 100, 120, 3, 6, 15, 'Brown Rice', 3, 54);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (55, 100, 70, 1, 0, 18, 'Cabbage', 2, 55);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (56, 100, 170, 6, 7, 18, 'Quinoa', 3, 56);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (57, 150, 250, 15, 11, 15, 'Salmon', 1, 57);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (58, 50, 70, 3, 3, 8, 'Peas', 2, 58);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (59, 100, 130, 5, 3, 20, 'Sweet Potato', 1, 59);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (60, 100, 140, 4, 1, 30, 'Oatmeal', 3, 60);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (61, 50, 50, 1, 1, 9, 'Cherry Tomatoes', 2, 61);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (62, 100, 160, 9, 5, 10, 'Tempeh', 1, 62);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (63, 150, 190, 10, 8, 10, 'Turkey Breast', 1, 63);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (64, 50, 40, 1, 1, 7, 'Cucumber', 2, 64);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (65, 100, 90, 3, 3, 16, 'Quorn', 1, 65);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (66, 100, 150, 8, 5, 15, 'Brown Lentils', 1, 66);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (67, 150, 120, 4, 1, 23, 'Cauliflower Rice', 2, 67);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (68, 100, 360, 13, 30, 8, 'Avocado', 1, 68);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (69, 100, 80, 7, 2, 10, 'Edamame', 1, 69);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (70, 100, 70, 3, 1, 13, 'Spinach', 2, 70);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (71, 150, 150, 7, 4, 22, 'Tofu', 1, 71);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (72, 50, 30, 2, 1, 3, 'Baby Carrots', 2, 72);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (73, 100, 110, 2, 2, 23, 'Mango', 3, 73);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (74, 50, 50, 1, 1, 10, 'Radishes', 2, 74);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (75, 150, 180, 5, 7, 27, 'Black Beans', 1, 75);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (76, 100, 60, 1, 0, 15, 'Green Beans', 2, 76);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (77, 150, 200, 14, 9, 10, 'Chicken Breast', 1, 77);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (78, 50, 20, 1, 0, 4, 'Baby Cucumbers', 2, 78);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (79, 100, 150, 4, 7, 16, 'Eggplant', 2, 79);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (80, 100, 90, 2, 1, 21, 'Strawberries', 3, 80);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (81, 150, 180, 5, 1, 42, 'Sweet Potato', 2, 81);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (82, 50, 60, 1, 3, 7, 'Cherry Tomatoes', 2, 82);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (83, 100, 130, 6, 3, 20, 'Hummus', 1, 83);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (84, 150, 150, 2, 2, 34, 'Beets', 2, 84);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (85, 100, 100, 2, 5, 14, 'Peanuts', 1, 85);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (86, 150, 200, 8, 5, 28, 'Salmon', 1, 86);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (87, 50, 50, 2, 2, 6, 'Brussels Sprouts', 2, 87);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (88, 100, 190, 8, 7, 26, 'Quinoa', 1, 88);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (89, 100, 150, 6, 8, 12, 'Almonds', 1, 89);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (90, 150, 120, 4, 1, 23, 'Cauliflower', 2, 90);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (91, 100, 60, 1, 0, 15, 'Celery', 3, 91);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (92, 50, 70, 3, 3, 9, 'Edamame', 2, 92);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (93, 100, 120, 6, 1, 27, 'Green Peas', 2, 93);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (94, 150, 200, 4, 10, 16, 'Avocado', 1, 94);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (95, 50, 60, 1, 1, 12, 'Baby Carrots', 2, 95);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (96, 100, 90, 3, 1, 19, 'Yellow Onion', 3, 96);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (97, 100, 140, 6, 3, 22, 'Sliced Turkey', 1, 97);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (98, 150, 150, 1, 1, 36, 'Butternut Squash', 2, 98);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (99, 50, 60, 2, 3, 4, 'Sliced Cucumber', 3, 99);

INSERT INTO Foods (FoodID, ServingSizeGrams, Calories, Protein, Fat, Carbs, FoodName, CategoryID, PlanID) 
VALUES (100, 100, 150, 2, 7, 20, 'Cashews', 1, 100);

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

CREATE TABLE MealFoods
(
    MealID INT PRIMARY KEY AUTO_INCREMENT,
    FoodID INT NOT NULL,
    FOREIGN KEY (MealID) REFERENCES Meals (MealID)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (FoodID) REFERENCES Foods (FoodID)
        ON UPDATE CASCADE ON DELETE CASCADE

);

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

-- Create Workouts table
CREATE TABLE Workout
(
    WorkoutID     INT PRIMARY KEY AUTO_INCREMENT,
    WorkoutName   VARCHAR(50) NOT NULL,
    WorkoutDesc   TEXT        NOT NULL,
    DateCreated   DATETIME    NOT NULL,
    WorkoutPlanID INT         NOT NULL,
    CreatorID     INT         NOT NULL,
    FOREIGN KEY (CreatorID) REFERENCES User (UserID)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

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





