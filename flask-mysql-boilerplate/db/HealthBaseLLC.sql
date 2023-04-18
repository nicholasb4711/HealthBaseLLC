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





