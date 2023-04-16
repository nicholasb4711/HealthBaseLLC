DROP SCHEMA IF EXISTS healthdb;
CREATE DATABASE healthdb;
USE healthdb;

-- Create Goals table
CREATE TABLE Goals (
  GoalID INT PRIMARY KEY,
  GoalName VARCHAR(50),
  GoalDesc TEXT
);

-- Create User table
CREATE TABLE User (
  UserID INT PRIMARY KEY AUTO_INCREMENT,
  TrainedBy INT,
  LastName VARCHAR(50) NOT NULL,
  FirstName VARCHAR(50) NOT NULL,
  Age INT,
  Height_in INT,
  Weight_lbs INT,
  Goal INT,
  FOREIGN KEY (TrainedBy) REFERENCES User(UserID)
                  ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (Goal) REFERENCES Goals(GoalID)

);

-- Create MuscleGroup table
CREATE TABLE MuscleGroup (
  MuscleGroupID INT PRIMARY KEY,
  MuscleGroupName VARCHAR(50) NOT NULL
);

-- Create FoodCategory table
CREATE TABLE FoodCategory (
  CategoryID INT PRIMARY KEY,
  CategoryName TEXT NOT NULL,
  CategoryDesc TEXT NOT NULL
);

-- Create Foods table
CREATE TABLE Foods (
  FoodID INT PRIMARY KEY,
  ServingSizeGrams INT NOT NULL,
  Calories INT NOT NULL,
  Protein INT NOT NULL,
  Fat INT NOT NULL,
  Carbs INT NOT NULL,
  FoodName TEXT NOT NULL,
  CategoryID INT,
  FOREIGN KEY (CategoryID) REFERENCES FoodCategory(CategoryID)
                   ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Create Meals table
CREATE TABLE Meals (
  MealID INT PRIMARY KEY,
  TotalCalories INT NOT NULL,
  TotalFat INT NOT NULL,
  TotalCarb INT NOT NULL,
  TotalProtein INT NOT NULL,
  MealName TEXT NOT NULL,
  DateCreated DATETIME NOT NULL,
  CreatorID INT NOT NULL,
  FOREIGN KEY (CreatorID) REFERENCES User(UserID)
                   ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE MealFoods (
    MealID INT PRIMARY KEY,
    FoodID INT NOT NULL,
    FOREIGN KEY (MealID) REFERENCES Meals(MealID)
                       ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (FoodID) REFERENCES Foods(FoodID)
                       ON UPDATE CASCADE ON DELETE CASCADE

);

-- Create MealPlan table
CREATE TABLE MealPlan (
  MealPlanID INT PRIMARY KEY,
  NumWeeks INT NOT NULL,
  MealPlanName TEXT NOT NULL,
  CreatorID INT,
  GoalID INT,
  FOREIGN KEY (CreatorID) REFERENCES User(UserID)
                      ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (GoalID) REFERENCES Goals(GoalID)
                      ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE PlanMeals (
    MealPlanID INT,
    MealID INT,
    PRIMARY KEY (MealPlanID, MealID),
    FOREIGN KEY (MealPlanID) REFERENCES MealPlan(MealPlanID)
                      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (MealID) REFERENCES Meals (MealID)
                      ON UPDATE CASCADE ON DELETE CASCADE

);

-- Create Exercise table
CREATE TABLE Exercise (
  ExerciseID INT PRIMARY KEY,
  ExerciseName TEXT NOT NULL,
  Equipment TEXT,
  MuscleGroupID INT NOT NULL,
  FOREIGN KEY (MuscleGroupID) REFERENCES MuscleGroup(MuscleGroupID)
                      ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Create ExercisePlan table
CREATE TABLE ExercisePlan (
  PlanID INT PRIMARY KEY,
  CreatorID INT,
  NumSets INT NOT NULL,
  NumReps INT NOT NULL,
  WeightLbs INT NOT NULL,
  ExerciseID INT,
  FOREIGN KEY (CreatorID) REFERENCES User(UserID)
                          ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (ExerciseID) REFERENCES Exercise(ExerciseID)
                          ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create Workouts table
CREATE TABLE Workout (
  WorkoutID INT PRIMARY KEY,
  WorkoutName VARCHAR(50) NOT NULL,
  WorkoutDesc TEXT NOT NULL ,
  DateCreated DATETIME NOT NULL,
  WorkoutPlanID INT NOT NULL,
  CreatorID INT NOT NULL,
  FOREIGN KEY (CreatorID) REFERENCES User(UserID)
                      ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE WorkoutExercises (
    WorkoutID INT,
    ExerciseID INT,
    PRIMARY KEY (WorkoutID, ExerciseID),
    FOREIGN KEY (WorkoutID) REFERENCES Workout(WorkoutID)
                      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (ExerciseID) REFERENCES Exercise (ExerciseID)
                      ON UPDATE CASCADE ON DELETE CASCADE

);

-- Create WorkoutPlan table
CREATE TABLE WorkoutPlan (
  WorkoutPlanID INT PRIMARY KEY,
  CreatorID INT,
  PlanName VARCHAR(50) NOT NULL,
  PlanDescription TEXT,
  NumWeeks INT,
  GoalID INT,
  FOREIGN KEY (CreatorID) REFERENCES User(UserID)
                         ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (GoalID) REFERENCES Goals(GoalID)
                         ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE PlanWorkouts (
    WorkoutPlanID INT,
    WorkoutID INT,
    PRIMARY KEY (WorkoutPlanID, WorkoutID),
    FOREIGN KEY (WorkoutPlanID) REFERENCES WorkoutPlan(WorkoutPlanID)
                      ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (WorkoutID) REFERENCES Workout (WorkoutID)
                      ON UPDATE CASCADE ON DELETE CASCADE

);

-- Create MealHistory table
CREATE TABLE MealHistory (
  EntryID INT PRIMARY KEY,
  UserID INT,
  DateOfEntry DATETIME,
  MealID INT,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
                         ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (MealID) REFERENCES Meals(MealID)
                      ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Create WorkoutHistory table
CREATE TABLE WorkoutHistory (
  EntryID INT PRIMARY KEY,
  UserID INT,
  DateOfEntry DATETIME,
  WorkoutID INT,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
                         ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (WorkoutID) REFERENCES Workout(WorkoutID)
                      ON UPDATE CASCADE ON DELETE RESTRICT
);





