DROP SCHEMA IF EXISTS healthdb;
CREATE DATABASE healthdb;
USE healthdb;

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

-- Create UserHistory table
CREATE TABLE UserHistory (
  EntryID INT PRIMARY KEY,
  UserID INT,
  WorkoutID INT,
  MealID INT,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
                         ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (WorkoutID) REFERENCES Workouts(WorkoutID)
                      ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (MealID) REFERENCES Meals(MealID)
                      ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Create Goals table
CREATE TABLE Goals (
  GoalID INT PRIMARY KEY,
  GoalName VARCHAR(50),
  GoalDesc TEXT,
  UserID INT,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
                   ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Create Workouts table
CREATE TABLE Workouts (
  WorkoutID INT PRIMARY KEY,
  WorkoutDesc TEXT NOT NULL ,
  WorkoutName VARCHAR(50) NOT NULL ,
  DateCreated DATETIME NOT NULL,
  WorkoutPlanID INT NOT NULL,
  UserID INT,
  ExerciseID INT,
  FOREIGN KEY (WorkoutPlanID) REFERENCES WorkoutPlan(WorkoutPlanID)
                      ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
                      ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (ExerciseID) REFERENCES ExercisePlan(PlanID)
                      ON UPDATE CASCADE ON DELETE RESTRICT

);

-- Create WorkoutPlan table
CREATE TABLE WorkoutPlan (
  WorkoutPlanID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  NumWeeks INT,
  Description TEXT,
  UserID INT,
  WorkoutID INT,
  GoalID INT,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
                         ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (WorkoutID) REFERENCES Workouts(WorkoutID)
                         ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (GoalID) REFERENCES Goals(GoalID)
                         ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Create ExercisePlan table
CREATE TABLE ExercisePlan (
  PlanID INT PRIMARY KEY,
  NumSets INT NOT NULL,
  NumReps INT NOT NULL,
  WeightLbs INT NOT NULL,
  ExerciseID INT,
  WorkoutID INT,
  FOREIGN KEY (ExerciseID) REFERENCES Exercise(ExerciseID)
                          ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (WorkoutID) REFERENCES Workouts(WorkoutID)
                          ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Create Exercise table
CREATE TABLE Exercise (
  ExerciseID INT PRIMARY KEY,
  ExerciseName TEXT NOT NULL,
  Equipment TEXT,
  ExersisePlanID INT NOT NULL,
  MuscleGroupID INT NOT NULL,
  FOREIGN KEY (MuscleGroupID) REFERENCES MuscleGroup(MuscleGroupID)
                      ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (ExersisePlanID) REFERENCES ExercisePlan(PlanID)
                      ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Create MuscleGroup table
CREATE TABLE MuscleGroup (
  MuscleGroupID INT PRIMARY KEY,
  MuscleGroupName VARCHAR(50) NOT NULL
);



-- Create MealPlan table
CREATE TABLE MealPlan (
  MealPlanID INT PRIMARY KEY,
  NumWeeks INT NOT NULL,
  MealPlanName TEXT NOT NULL,
  UserID INT,
  GoalID INT,
  MealID INT,
  FoodID INT,
  FOREIGN KEY (UserID) REFERENCES User(UserID)
                      ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (GoalID) REFERENCES Goals(GoalID)
                      ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (MealID) REFERENCES Meals(MealID)
                      ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (FoodID) REFERENCES Foods(FoodID)
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
  UserID INT NOT NULL,
  MealPlanID INT,
  FoodID INT,
  UserEntryID INT,

  FOREIGN KEY (UserID) REFERENCES User(UserID)
                   ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (MealPlanID) REFERENCES MealPlan(MealPlanID)
                   ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (FoodID) REFERENCES Foods(FoodID)
                      ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (UserEntryID) REFERENCES UserHistory(EntryID)
                      ON UPDATE CASCADE ON DELETE RESTRICT
);

-- Create FoodCategory table
CREATE TABLE FoodCategory (
  CategoryID INT PRIMARY KEY,
  CategoryName TEXT NOT NULL,
  CategoryDesc TEXT NOT NULL,
  FoodID INT,
  FOREIGN KEY (FoodID) REFERENCES Foods(FoodID)
                   ON UPDATE CASCADE ON DELETE RESTRICT
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
  PlanID INT,
  FOREIGN KEY (CategoryID) REFERENCES FoodCategory(CategoryID)
                   ON UPDATE CASCADE ON DELETE RESTRICT,
  FOREIGN KEY (PlanID) REFERENCES MealPlan(MealPlanID)
                   ON UPDATE CASCADE ON DELETE RESTRICT
);