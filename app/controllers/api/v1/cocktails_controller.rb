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
        id: drink["idDrink"],
        name: drink["strDrink"],
        category: drink["strCategory"],
        IBA: drink["strIBA"],
        glass: drink["strGlass"],
        instructions: drink["strInstructions"],
        image: drink["strDrinkThumb"],
        ingredients: [
					{ 
						name: drink["strIngredient1"],
						measure: drink["strMeasure1"],
					},
					{ 
						name: drink["strIngredient2"],
						measure: drink["strMeasure2"]
					},
					{ 
						name: drink["strIngredient3"],
						measure: drink["strMeasure3"]
					},
					{ 
						name: drink["strIngredient4"],
						measure: drink["strMeasure4"]
					},
					{ 
						name: drink["strIngredient5"],
						measure: drink["strMeasure5"]
					},
					{ 
						name: drink["strIngredient6"],
						measure: drink["strMeasure6"]
					},
					{ 
						name: drink["strIngredient7"],
						measure: drink["strMeasure7"]
					},
					{ 
						name: drink["strIngredient8"],
						measure: drink["strMeasure8"]
					},
					{ 
						name: drink["strIngredient9"],
						measure: drink["strMeasure9"]
					},
					{ 
						name: drink["strIngredient10"],
						measure: drink["strMeasure10"]
					},
					{ 
						name: drink["strIngredient11"],
						measure: drink["strMeasure11"]
					},
					{ 
						name: drink["strIngredient12"],
						measure: drink["strMeasure12"]
					},
					{ 
						name: drink["strIngredient13"],
						measure: drink["strMeasure13"]
					},
					{ 
						name: drink["strIngredient14"],
						measure: drink["strMeasure14"]
					},
					{ 
						name: drink["strIngredient15"],
						measure: drink["strMeasure15"]
					}
      	]
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