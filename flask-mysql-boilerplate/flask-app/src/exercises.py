from flask import Blueprint, request, jsonify, make_response
import json
from src import db


exercises = Blueprint('exercises', __name__)

@exercises.route('/viewMuscleGroups', methods = ['GET'])
def get_MuscleGroups():
    query = '''
        SELECT MuscleGroupID, MuscleGroupName
        FROM MuscleGroup
    '''
    return get_Data(query)

# Get method for viewing all exercises related to a specific musclegroup
@exercises.route('/viewExercises/<MuscleGroupID>', methods=['GET'])
def get_ExercisesByMuscleGroup(MuscleGroupID):
    query = '''
        SELECT ExerciseName
        FROM Exercise
        WHERE MuscleGroupID = {}
    '''.format(MuscleGroupID)
    return get_Data(query)

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
