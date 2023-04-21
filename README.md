# HealthBase

HealthBase is a social relational database encompassing everything a user would need in order to manage their physical fitness and wellness. It allows users to store their fitness and nutritional data, such as workouts and daily food intake. More importantly, users can view meals and workouts created by other users by searching their name.
(With more time, we would've liked to implement some sort of friend/following system)



## User Personas

### Persona 1: Larry Wheels

Larry is a competitive powerlifter and YouTube personality. He spends hours in the gym a day. He runs a very strict diet and workout program in order to maximize his progression. Larry knows he needs to track his numbers in the gym so that he continues to get stronger. He is looking for an application with which he can both create and log workouts.

### User Stories for Persona 1:

- As a powerlifter, I would like to store data about my past lifts, including sets, repetitions, and weight.
- As a powerlifter, I would like to be able to formulate a plan for upcoming workouts.
- As a powerlifter, I would like access to a list of exercises that can help me achieve my goals.
- As a powerlifter, I would like to be able to set personal goals and track my progression towards them.

### Persona 2: Chris Bumstead

Chris (CBum) is a professional nutrition coach. He has competed in the most competitive bodybuilding competitions worldwide and is very successful. Chris is very renowned as a bodybuilder and a trainer and has multiple clients that he manages. Chris wants to be able to view his client’s nutritional history and create meal plans for his clients. He also wants to track his own nutrition and create plans for himself.

### User Stories for Persona 2:

- As a trainer, I would like to be able to retrieve client’s historical data in relation to their workouts and nutrition.
- As a trainer, I would like to be able to create plans for clients to follow, including planned exercises and meals
- As a user, I would like to be able to retrieve my own historical data in relation to my workouts and nutrition
- As a user, I would like to be able to add my own workouts, daily nutritional intake, and create my own plans

### Persona 3: Quincy Williams IV

Quincy has just been diagnosed with Type 2 Diabetes. She needs to keep careful watch on her sugar intake, as well as her overall caloric intake. Quincy’s doctor has recommended that she lose weight to help her body’s internal regulation. Quincy wants to lose 10 pounds over the course of the next 3 months by going to the gym and tracking her eating.

### User Stories for Persona 3:

- As a diabetic, I would like to be able to track my sugar intake.
- As a diabetic, I would like access to a list of foods, particularly ones that are low-calorie and low sugar.
- As both a diabetic and a gym newbie, I would like to be able to view recommended exercises in the weight loss category.
- As an aspiring fitness queen with little background knowledge, I would like to be able to see other user’s recipes, workouts, and goals.
- As a foodie, I’d like to be able to enter my favorite snacks into the database and store them so that I can refer to them later when designing meal plans.

## Technologies Used

- Appsmith: Appsmith is an open-source framework for building internal tools. It allows developers to build complex applications quickly and easily.
- SQL: SQL is a programming language used to manage and manipulate relational databases. It is used to store, retrieve, and manipulate data in a relational database management system.
- Visual Studio: Visual Studio is a comprehensive integrated development environment (IDE) used


## Getting Started

- In order to get started using this database app, you will need to open the terminal (if on Mac) or Windows Powershell (Windows)
- Next, navigate to the directory of where this project is stored, then navigate into the flask-mysql-boilerplate folder using the cd command. This is an EXAMPLE of what your terminal should show when you are located inside the folder:
        
        C:\Users\nicho\OneDrive\Desktop\School\Spring 2023\CS3200 Database Design\CS3200\HealthBaseLLC\flask-mysql-boilerplate

- The general path may be different depending on your location, but should end in \HealthBaseLLC\flask-mysql-boilerplate
- Next, make sure docker is open and in your terminal/powershell enter the following commands, and wait for them to complete before entering the next command:

        - docker compose build
        - docker compose up

- At this point, the docker container should be running and you should see a web, db, and appsmith container running.

- Next, in your internet browser, navigate to the following URL: localhost:8080

Now you should be able to use the app!


## App Use

- In our app there are several different pages and things a user can do

## Project Structure

- Database: Our SQL Database file is called HealthBaseLLC.sql
- Diagram: We included a diagram of our project, called healthdb-Schema-DIAGRAM.png
- SRC Folder:
    - trackMeals.py:
    - trackWorkouts.py:
    - 


# Project Comments

## Our Issues

### TimeLine Constrictions

- Due to issues with our thunder client/git merging complications, we were severely delayed in building our project because we had to spend a lot of time troubleshooting to no avail, and ultimately had to wait for Prof. Fontenot's help to resolve these issues. This ultimately shortened our timeline and there were several features we unfortunately didn't have time to implement. With more time, we would have liked to fully round it out and implement many features, some being:

    - A Friend/following system
    - a more user specific UI, based on the current user and what they need to access

Nonetheless, Once our thunderclient/git complications were resolved we worked nonstop around the clock to complete the project to our best ability.

### Group Commit Numbers

- Merge Conflicts were the foundation of a lot of our issues when building the app, so our solution was to only have one person/device working on a certain part of the app at a time, which was streamed to a TV as we all worked on it and talked through it.

- We all collectively collaborated on the project equally, however due to the issue of the merge conflicts, only some devices were able to push/pull updates for the appsmith repo/project repo, which is why it may appear that some users did significantly more or less than others. We collaborated as a team to make edits and would together push updates to the repo. We want that to be known by the reviewers.



# Video Link

- Project Video Link HERE: 

- Bloopers Video Link: