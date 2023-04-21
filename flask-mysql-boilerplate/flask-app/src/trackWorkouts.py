from flask import Blueprint, current_app, request, jsonify, make_response
import json
from src import db

trackWorkouts = Blueprint('track workouts', __name__)

# get method for viewing a specific user's goal
@trackWorkouts.route('/viewUserGoals/<UserID>', methods = ['GET'])
def view_allGoals(UserID):
    query = '''
        SELECT GoalName, GoalDesc
        FROM Goals g JOIN User u ON g.GoalID = u.Goal
        WHERE u.UserID = {}
    '''.format(UserID)
    return get_data(query)

# get method for viewing users based on last and first name
@trackWorkouts.route('/viewUsers/<FirstName>/<LastName>', methods = ['GET'])
def view_Users(FirstName, LastName):
    query = '''
        SELECT UserID, FirstName, LastName
        FROM User
        WHERE FirstName LIKE {} AND LastName LIKE {}
    '''.format(FirstName, LastName)
    return get_data(query)

# post method for creating a new user
@trackWorkouts.route('/newUser', methods = ['POST'])
def new_user():
    req_data = request.get_json()
    LastName = req_data['LastName']
    FirstName = req_data['FirstName']
    Age = req_data['Age']
    Height = req_data['Height']
    Weight = req_data['Weight']
    GoalID = req_data['GoalID']

    insert_stmt = 'INSERT INTO User (LastName, FirstName, Age, Height_in, Weight_lbs, Goal) VALUES ("'
    insert_stmt += LastName + '", "' + FirstName + '", ' + str(Age) + ', ' + str(Height) + ', ' + str(Weight) + ', ' + str(GoalID) + ')'

    return run_sql_stmt(insert_stmt)

# get method for viewing all the muscle groups in the db
@trackWorkouts.route('/viewMuscleGroups', methods = ['GET'])
def get_MuscleGroups():
    query = '''
        SELECT MuscleGroupID, MuscleGroupName
        FROM MuscleGroup
    '''
    return get_data(query)

# get method for viewing all exercises related to a specific musclegroup
@trackWorkouts.route('/viewExercises/<MuscleGroupID>', methods=['GET'])
def get_ExercisesByMuscleGroup(MuscleGroupID):
    query = '''
        SELECT ExerciseID, ExerciseName
        FROM Exercise
        WHERE MuscleGroupID = {}
    '''.format(MuscleGroupID)
    return get_data(query)

# get all workout history from the db
@trackWorkouts.route('/all-workout-history', methods=['GET'])
def get_allWorkoutHistory():
    query = '''
        SELECT EntryID, UserID, DateOfEntry, WorkoutID
        FROM WorkoutHistory
    '''
    return get_data(query)

# get all workout history from the db
@trackWorkouts.route('/most-recent-workout', methods=['GET'])
def get_MostRecent():
    query = '''
        SELECT *
        FROM Workout
        ORDER BY WorkoutID DESC
        LIMIT 1
    '''
    return get_data(query)

# get method for retrieving a user's workout history
@trackWorkouts.route('/users-workout-history/<userID>', methods=['GET'])
def get_customer(userID):
    query = '''
        SELECT DateOfEntry as "Date",
               WorkoutName as "Workout",
               WorkoutDesc as "Description"

        FROM WorkoutHistory wh JOIN Workout w ON wh.WorkoutID = w.WorkoutID
                               JOIN WorkoutExercises we ON wh.WorkoutID = we.WorkoutID
        WHERE UserID = {}
    '''.format(userID)
    return get_data(query)

@trackWorkouts.route('/getWorkoutExercises/<WorkoutID>', methods = ['GET'])
def get_WorkoutExercises(WorkoutID):
    query = '''
        SELECT ex.ExerciseName, e.NumSets, e.NumReps, e.WeightLbs
        FROM Workout w JOIN WorkoutExercises we ON w.WorkoutID = we.WorkoutID
                       JOIN ExercisePlan e ON we.ExercisePlanID = e.PlanID
                       JOIN Exercise ex ON e.ExerciseID = ex.ExerciseID
        WHERE we.WorkoutID = {}
    '''.format(WorkoutID)
    return get_data(query)
    
# post method for creating an exercise plan
@trackWorkouts.route('/addExercisePlan', methods = ['POST'])
def add_ExercisePlan():
    req_data = request.get_json()
    CreatorID = req_data['CreatorID']
    NumSets = req_data['NumSets']
    NumReps = req_data['NumReps']
    Weight = req_data['Weight']
    ExerciseID = req_data['ExerciseID']

    insert_stmt = 'INSERT INTO ExercisePlan (CreatorID, NumSets, NumReps, WeightLbs, ExerciseID) VALUES ('
    insert_stmt += str(CreatorID) + ', ' + str(NumSets) + ', ' + str(NumReps) + ', ' + str(Weight) + ', ' + str(ExerciseID) + ')'

    return run_sql_stmt(insert_stmt)

# post method for adding an exercise plan to a workout
@trackWorkouts.route('/addExercisePlanToWorkout', methods = ['POST'])
def add_ExercisePlanToWorkout():
    req_data = request.get_json()
    WorkoutID = req_data['WorkoutID']
    ExercisePlanID = req_data['ExercisePlanID']

    insert_stmt = 'INSERT INTO WorkoutExercises (WorkoutID, ExercisePlanID) VALUES ('
    insert_stmt += str(WorkoutID) + ', ' + str(ExercisePlanID) + ')'

    return run_sql_stmt(insert_stmt)

# post method for creating a new workout
@trackWorkouts.route('/newWorkout', methods = ['POST'])
def new_Workout():
    req_data = request.get_json()
    WorkoutName = req_data['WorkoutName']
    WorkoutDesc = req_data['WorkoutDesc']
    DateCreated = req_data['DateCreated']
    CreatorID = req_data['CreatorID']

    insert_stmt = 'INSERT INTO Workout (WorkoutName, WorkoutDesc, DateCreated, CreatorID) VALUES ("'
    insert_stmt += WorkoutName+ '", "' + WorkoutDesc + '", "' + DateCreated + '", ' + str(CreatorID) + ')'

    return run_sql_stmt(insert_stmt)

# post method for logging a workout in user's workout history
@trackWorkouts.route('/logWorkout', methods = ['POST'])
def log_Workout():
    req_data = request.get_json()
    UserID = req_data['UserID']
    WorkoutID = req_data['WorkoutID']
    Date = req_data['Date']

    insert_stmt = 'INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES ('
    insert_stmt += str(UserID) + ', "' + Date + '", ' + str(WorkoutID) + ')'
    return run_sql_stmt(insert_stmt)

# put method for editing an exercise plan
@trackWorkouts.route('/editExercisePlan', methods = ['PUT'])
def edit_ExercisePlan():
    req_data = request.get_json()
    PlanID = req_data['PlanID']
    NumSets = req_data['NumSets']
    NumReps = req_data['NumReps']
    Weight = req_data['Weight']
    ExerciseID = req_data['ExerciseID']

    update_stmt = 'UPDATE ExercisePlan SET NumSets = ' + str(NumSets) + ', NumReps = ' + str(NumReps) + ', WeightLbs = ' + str(Weight) + ', ExerciseID = ' + str(ExerciseID)
    update_stmt += ' WHERE PlanID = ' + str(PlanID)
    
    return run_sql_stmt(update_stmt)

# put method for updating a goal description
@trackWorkouts.route('/editGoal', methods = ['PUT'])
def edit_GoalDesc():
    req_data = request.get_json()
    GoalID = req_data['GoalID']
    GoalName = req_data['GoalName']
    GoalDesc = req_data['GoalDesc']

    update_stmt = 'UPDATE Goals SET GoalName = "' + GoalName + '", GoalDesc = "' + GoalDesc + '"'
    update_stmt += ' WHERE GoalID = ' + str(GoalID)
    
    return run_sql_stmt(update_stmt)

# delete method for deleting a workout plan
@trackWorkouts.route('/deleteWorkoutPlan', methods = ["DELETE"])
def delete_WorkoutPlan():
    req_data = request.get_json()
    WorkoutPlanID = req_data['WorkoutPlanID']

    insert_stmt = 'DELETE FROM WorkoutPlan WHERE WorkoutPlanID = ' + str(WorkoutPlanID)
    return run_sql_stmt(insert_stmt)

# get method for retrieving a specific user's workout plans
@trackWorkouts.route('/getUserWorkoutPlans/<UserID>', methods = ['GET'])
def get_UserWorkoutPlans(UserID):
    query = '''
        SELECT wp.WorkoutPlanID, wp.PlanName, wp.PlanDescription, wp.NumWeeks
        FROM WorkoutPlan wp JOIN User u ON u.UserID = wp.CreatorID
        WHERE u.UserID = {}
    '''.format(UserID)
    return get_data(query)

# general function for retrieving data
def get_data(query):
    cursor = db.get_db().cursor()
    cursor.execute(query)
    json_data = []
    # fetch all the column headers and then all the data from the cursor
    column_headers = [x[0] for x in cursor.description]
    theData = cursor.fetchall()
    # zip headers and data together into dictionary and 
    # then append to json data dict
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# general function for executing a MySQL insert statement
def run_sql_stmt(statement):
    current_app.logger.info(statement)
    cursor = db.get_db().cursor()
    cursor.execute(statement)
    db.get_db().commit()
    return "Success"
