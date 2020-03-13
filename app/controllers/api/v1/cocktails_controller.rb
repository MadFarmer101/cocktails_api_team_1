class Api::V1::CocktailsController < ApplicationController
  before_action :check_query_param

  def index
    response = RestClient.get(
      "https://www.thecocktaildb.com/api/json/v1/1/search.php",
      {
        params: {
          s: params[:q]
        }
      }
    )
      if response.body.empty?
        render json: {error: 'No drinks were found'}, status: 400
      else
        drinks = JSON.parse(response)
        sanitized_drinks = drinks["drinks"].map { |drink|
          {
            "id": drink["idDrink"],
            "name": drink["strDrink"],
            "category": drink["strCategory"],
            "IBA": drink["strIBA"]
          }
        }
        render json: {drinks: sanitized_drinks }
      end
  end

  def show
    response = RestClient.get(
      "https://www.thecocktaildb.com/api/json/v1/1/lookup.php",
      {
        params: {
          i: params[:id]
        }
      }
    )
    drinks = JSON.parse(response)
    sanitized_drinks = drinks["drinks"].map { |drink|
      {
        "id": drink["idDrink"],
        "name": drink["strDrink"],
        "category": drink["strCategory"],
        "IBA": drink["strIBA"],
        "glass": drink["strGlass"],
        "instructions": drink["strInstructions"],
        "image": drink["strDrinkThumb"],
        "IBA": drink["strIBA"],
        "ingredient_1": drink["strIngredient1"],
        "ingredient_2": drink["strIngredient2"],
        "ingredient_3": drink["strIngredient3"],
        "ingredient_4": drink["strIngredient4"],
        "ingredient_5": drink["strIngredient5"],

      }
    }
    render json: {drinks: sanitized_drinks }


  
  end

  private
  def check_query_param
    if params[:q] == ""
      render json: {error: 'No input in search field'}, status: 400
      return
    end
  end
end