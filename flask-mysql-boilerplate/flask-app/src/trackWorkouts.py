from flask import Blueprint, current_app, request, jsonify, make_response
import json
from src import db

trackWorkouts = Blueprint('track workouts', __name__)

# get method for viewing all the muscle groups in the db
@trackWorkouts.route('/viewMuscleGroups', methods = ['GET'])
def get_MuscleGroups():
    query = '''
        SELECT MuscleGroupID, MuscleGroupName
        FROM MuscleGroup
    '''
    return get_Data(query)

# get method for viewing all exercises related to a specific musclegroup
@trackWorkouts.route('/viewExercises/<MuscleGroupID>', methods=['GET'])
def get_ExercisesByMuscleGroup(MuscleGroupID):
    query = '''
        SELECT ExerciseID, ExerciseName
        FROM Exercise
        WHERE MuscleGroupID = {}
    '''.format(MuscleGroupID)
    return get_Data(query)

# get all workout history from the db
@trackWorkouts.route('/all-workout-history', methods=['GET'])
def get_allWorkoutHistory():
    query = '''
        SELECT EntryID, UserID, DateOfEntry, WorkoutID
        FROM WorkoutHistory
    '''
    return get_Data(query)

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
    #.format(userID)
    return get_Data(query)

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

    return post_Data(insert_stmt)

# post method for adding an exercise plan to a workout
@trackWorkouts.route('/addExercisePlanToWorkout', methods = ['POST'])
def add_ExercisePlanToWorkout():
    req_data = request.get_json()
    WorkoutID = req_data['WorkoutID']
    ExercisePlanID = req_data['ExercisePlanID']

    insert_stmt = 'INSERT INTO WorkoutExercises (WorkoutID, ExercisePlanID) VALUES ('
    insert_stmt += str(WorkoutID) + ', ' + str(ExercisePlanID) + ')'

    return post_Data(insert_stmt)

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

    return post_Data(insert_stmt)

# post method for logging a workout in user's workout history
@trackWorkouts.route('/logWorkout', methods = ['POST'])
def log_Workout():
    req_data = request.get_json()
    UserID = req_data['UserID']
    WorkoutID = req_data['WorkoutID']
    Date = req_data['Date']

    insert_stmt = 'INSERT INTO WorkoutHistory (UserID, DateOfEntry, WorkoutID) VALUES ('
    insert_stmt += str(UserID) + ', "' + Date + '", ' + str(WorkoutID) + ')'
    return post_Data(insert_stmt)

#@trackWorkouts.route('/editExercisePlan', methods = ['PUT'])
#def edit_ExercisePlan():

# general function for retrieving data
def get_Data(query):
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
def post_Data(statement):
    current_app.logger.info(statement)
    cursor = db.get_db().cursor()
    cursor.execute(statement)
    db.get_db().commit()
    return "Success"
