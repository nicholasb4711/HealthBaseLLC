from flask import Blueprint, request, jsonify, make_response
import json
from src import db

trackMeals = Blueprint('trackMeals', __name__)

@trackMeals.route('/categories', methods = ['GET'])
def get_all_categories():
    query = '''
        SELECT DISTINCT category AS label, category as value
        FROM FoodCategory
        WHERE category IS NOT NULL
        ORDER BY category
    '''
    return getData(query)

# Get all the foods from the database
@trackMeals.route('/foods', methods=['GET'])
def get_foods():
    query = '''
        SELECT FoodID, ServingSizeGrams, FoodName FROM Foods
    '''
    return getData(query)

# get the top 10 lowest calorie from the database
@trackMeals.route('/top10lowestCalorie', methods=['GET'])
def get_lowestCalorieFoods():
    query = '''
        SELECT FoodName, Calories
        FROM Foods
        ORDER BY Calories ASC
        LIMIT 10
    '''
    return getData(query)

# get the top 10 lowest calorie from the database
@trackMeals.route('/top10highestCalorie', methods=['GET'])
def get_highestCalorieFoods():
    query = '''
        SELECT FoodName, Calories
        FROM Foods
        ORDER BY Calories DESC
        LIMIT 10
    '''
    return getData(query)

# get the top 10 lowest calorie from the database
@trackMeals.route('/highestProtein', methods=['GET'])
def get_highestProteinFoods():
    query = '''
        SELECT FoodName, Protein
        FROM Foods
        ORDER BY Protein DESC
        LIMIT 10
    '''
    return getData(query)

@trackMeals.route('/getUserMealPlans/<UserID>', methods = ['GET'])
def get_UserWorkoutPlans(UserID):
    query = '''
        SELECT mp.MealPlanID, mp.MealPlanName, mp.NumWeeks, GoalName
        FROM MealPlan mp JOIN User u ON u.UserID = mp.CreatorID
                         JOIN Goals g ON u.Goal = g.GoalID
        WHERE u.UserID = {}
    '''.format(UserID)
    return get_data(query)

# general method for retrieving data 
def get_data(query):
    cursor = db.get_db().cursor()
    cursor.execute(query)
    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)
