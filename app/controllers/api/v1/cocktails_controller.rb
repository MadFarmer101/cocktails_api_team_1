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
        results = JSON.parse(response)
        sanitized_drinks = results["drinks"].map { |drink|
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
		
		result = JSON.parse(response)
		
		drink = result["drinks"].first

		ingredients = []

		drink.select do |key, value|
			next unless key.to_s.start_with? 'strIngredient'
		ingredient ={}
			number = key.to_s.scan( /\d+$/ ).first
			ingredient[:name] = value unless value.nil?
			drink.select do |key_2, value_2|
				next unless key_2.to_s.start_with? "strMeasure"
				ingredient[:measure] = value_2 if key_2.to_s.scan( /\d+$/ ).first == number && value != nil
			end
		ingredients.push(ingredient) unless ingredient.empty?
		end

    sanitized_drink = 
      {
        id: drink["idDrink"],
        name: drink["strDrink"],
        category: drink["strCategory"],
        IBA: drink["strIBA"],
        glass: drink["strGlass"],
        instructions: drink["strInstructions"],
        image: drink["strDrinkThumb"],
				ingredients: ingredients
			}
			
		render json: { drink: sanitized_drink } 
  end

  private
  def check_query_param
    if params[:q] == ""
      render json: {error: 'No input in search field'}, status: 400
      return
    end
  end
end