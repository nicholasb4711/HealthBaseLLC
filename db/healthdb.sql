CREATE DATABASE healthdb;
USE healthdb;

-- Create User table
CREATE TABLE User (
  UserID INT PRIMARY KEY,
  LastName VARCHAR(50) NOT NULL,
  FirstName VARCHAR(50) NOT NULL,
  Age INT NOT NULL,
  Height DECIMAL(5,2) NOT NULL,
  Weight DECIMAL(5,2) NOT NULL
);

-- Create WorkoutPlan table
CREATE TABLE WorkoutPlan (
  WorkoutPlanID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  NumWeeks INT NOT NULL,
  Description TEXT NOT NULL,
  UserID INT,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create Workouts table
CREATE TABLE Workouts (
  WorkoutID INT PRIMARY KEY,
  WorkoutDesc TEXT NOT NULL,
  WorkoutName VARCHAR(50) NOT NULL,
  DateCreated DATE NOT NULL,
  WorkoutPlanID INT,
  FOREIGN KEY (WorkoutPlanID) REFERENCES WorkoutPlan(WorkoutPlanID)
);

-- Create Exercise table
CREATE TABLE Exercise (
  ExerciseID INT PRIMARY KEY,
  ExerciseName VARCHAR(50) NOT NULL,
  Equipment VARCHAR(50) NOT NULL
);

-- Create MuscleGroup table
CREATE TABLE MuscleGroup (
  MuscleGroupID INT PRIMARY KEY,
  MuscleGroupName VARCHAR(50) NOT NULL
);

-- Create ExercisePlan table
CREATE TABLE ExercisePlan (
  PlanID INT PRIMARY KEY,
  NumSets INT NOT NULL,
  NumReps INT NOT NULL,
  Weight DECIMAL(5,2) NOT NULL,
  ExerciseID INT,
  MuscleGroupID INT,
  WorkoutID INT,
  FOREIGN KEY (ExerciseID) REFERENCES Exercise(ExerciseID),
  FOREIGN KEY (MuscleGroupID) REFERENCES MuscleGroup(MuscleGroupID),
  FOREIGN KEY (WorkoutID) REFERENCES Workouts(WorkoutID)
);

-- Create UserHistory table
CREATE TABLE UserHistory (
  EntryID INT PRIMARY KEY,
  UserID INT NOT NULL,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create MealPlan table
CREATE TABLE MealPlan (
  MealPlanID INT PRIMARY KEY,
  NumWeeks INT NOT NULL,
  MealPlanName VARCHAR(50) NOT NULL,
  UserID INT,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create Meals table
CREATE TABLE Meals (
  MealID INT PRIMARY KEY,
  TotalCalories INT NOT NULL,
  TotalFat INT NOT NULL,
  TotalCarb INT NOT NULL,
  TotalProtein INT NOT NULL,
  MealName VARCHAR(50) NOT NULL,
  DateCreated DATE NOT NULL,
  UserID INT NOT NULL,
  MealPlanID INT,
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  FOREIGN KEY (MealPlanID) REFERENCES MealPlan(MealPlanID)
);

-- Create FoodCategory table
CREATE TABLE FoodCategory (
  CategoryID INT PRIMARY KEY,
  CategoryName VARCHAR(50) NOT NULL,
  CategoryDesc TEXT NOT NULL
);

-- Create Foods table
CREATE TABLE Foods (
  FoodID INT PRIMARY KEY,
  GramsServing INT NOT NULL,
  Calories INT NOT NULL,
  Protein INT NOT NULL,
  Fat INT NOT NULL,
  Carbs INT NOT NULL,
  FoodName VARCHAR(50) NOT NULL,
  CategoryID INT,
  FOREIGN KEY (CategoryID) REFERENCES FoodCategory(CategoryID)
);

-- Create Goals table
CREATE TABLE Goals (
  GoalID INT PRIMARY KEY,
  GoalName VARCHAR(50) NOT NULL,
  GoalDesc TEXT NOT NULL,
  UserID INT,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
);