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
            sanitized_drinks = 
                {
                    "name": drinks["drinks"][0]["strDrink"],
                    "id": drinks["drinks"][0]["idDrink"]
                }
            
            render json: {drinks: sanitized_drinks }
        end
    end

    private

    def check_query_param
        if params[:q] == ""
            render json: {error: 'No input in search field'}, status: 400
            return
        end
    end
end