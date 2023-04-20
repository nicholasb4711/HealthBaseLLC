from flask import Blueprint, request, jsonify, make_response
import json
from src import db


workout_history = Blueprint('workout history', __name__)

# Get all workout history from the db
@workout_history.route('/all-workout-history', methods=['GET'])
def get_allWorkoutHistory():
    query = '''
        SELECT EntryID, UserID, DateOfEntry, WorkoutID
        FROM WorkoutHistory
    '''
    return get_Data(query)

# Get customer detail for customer with particular userID
@workout_history.route('/users-workout-history/<userID>', methods=['GET'])
def get_customer(userID):
    query = '''
        SELECT DateOfEntry as "Date",
               WorkoutName as "Workout",
               WorkoutDesc as "Description"
        FROM WorkoutHistory JOIN Workout ON WorkoutID
        WHERE UserID = {}
    '''.format(userID)
    #.format(userID)
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
