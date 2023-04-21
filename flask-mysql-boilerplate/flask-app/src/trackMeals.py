from flask import Blueprint, current_app, request, jsonify, make_response
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
    return get_data(query)

# Get all the foods from the database
@trackMeals.route('/foods', methods=['GET'])
def get_foods():
    query = '''
        SELECT FoodID, ServingSizeGrams, FoodName FROM Foods
    '''
    return get_data(query)

# get the top 10 lowest calorie from the database
@trackMeals.route('/top10lowestCalorie', methods=['GET'])
def get_lowestCalorieFoods():
    query = '''
        SELECT FoodName, Calories
        FROM Foods
        ORDER BY Calories ASC
        LIMIT 10
    '''
    return get_data(query)

# get the top 10 lowest calorie from the database
@trackMeals.route('/top10highestCalorie', methods=['GET'])
def get_highestCalorieFoods():
    query = '''
        SELECT FoodName, Calories
        FROM Foods
        ORDER BY Calories DESC
        LIMIT 10
    '''
    return get_data(query)

# get the top 10 lowest calorie from the database
@trackMeals.route('/highestProtein', methods=['GET'])
def get_highestProteinFoods():
    query = '''
        SELECT FoodName, Protein
        FROM Foods
        ORDER BY Protein DESC
        LIMIT 10
    '''
    return get_data(query)

# get route for viewing a specific user's meal plans
@trackMeals.route('/getUserMealPlans/<UserID>', methods = ['GET'])
def get_UserWorkoutPlans(UserID):
    query = '''
        SELECT mp.MealPlanID, mp.MealPlanName, mp.NumWeeks, GoalName
        FROM MealPlan mp JOIN User u ON u.UserID = mp.CreatorID
                         JOIN Goals g ON u.Goal = g.GoalID
        WHERE u.UserID = {}
    '''.format(UserID)
    return get_data(query)

# get route for viewing which meals are in a specific meal plan
@trackMeals.route('/getMealPlanMeals/<MealPlanID>', methods = ['GET'])
def get_MealPlanMeals(MealPlanID):
    query = '''
        SELECT m.MealID, m.MealName, m.TotalCalories, m.TotalFat, m.TotalProtein
        FROM PlanMeals pm JOIN MealPlan mp ON mp.MealPlanID = pm.MealPlanID
                          JOIN Meals m ON pm.mealID = m.MealID
        WHERE pm.MealPlanID = {}
    '''.format(MealPlanID)
    return get_data(query)

# post route for adding a meal to the database
@trackMeals.route('/createMeal', methods = ['POST'])
def createMeal():
    req_data = request.get_json()
    TotalCalories = req_data['TotalCalories']
    TotalFat = req_data['TotalFat']
    TotalProtein = req_data['TotalProtein']
    TotalCarb = req_data['TotalCarb']
    MealName = req_data['MealName']
    DateCreated = req_data['DateCreated']
    CreatorID = req_data['CreatorID']

    insert_stmt = 'INSERT INTO Meals (TotalCalories, TotalFat, TotalCarb, TotalProtein, MealName, DateCreated, CreatorID) VALUES ('
    insert_stmt += str(TotalCalories) + ', ' + str(TotalFat) + ', ' + str(TotalProtein) + ', ' + str(TotalCarb) + ', "' + MealName + '", "' + DateCreated + '", ' + str(CreatorID) + ')'
    return run_sql_stmt(insert_stmt)

@trackMeals.route('/deleteMealPlan', methods = ["DELETE"])
def delete_MealPlan():
    req_data = request.get_json()
    MealPlanID = req_data['MealPlanID']

    insert_stmt = 'DELETE FROM MealPlan WHERE MealPlanID = ' + str(MealPlanID)
    return run_sql_stmt(insert_stmt)

@trackMeals.route('/editMealPlan', methods = ['PUT'])
def edit_MealPlan():
    req_data = request.get_json()
    MealPlanID = req_data['MealPlanID']
    NumWeeks = req_data['NumWeeks']
    MealPlanName = req_data['MealPlanName']
    CreatorID = req_data['CreatorID']
    GoalID = req_data['GoalID']

    update_stmt = 'UPDATE MealPlan SET NumWeeks = ' + str(NumWeeks) + ', MealPlanName = "' + MealPlanName + '", CreatorID = ' + str(CreatorID) + ', GoalID = ' + str(GoalID)
    update_stmt += ' WHERE MealPlanID = ' + str(MealPlanID)
    
    return run_sql_stmt(update_stmt)


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

# general function for executing a MySQL insert statement
def run_sql_stmt(statement):
    current_app.logger.info(statement)
    cursor = db.get_db().cursor()
    cursor.execute(statement)
    db.get_db().commit()
    return "Success"
