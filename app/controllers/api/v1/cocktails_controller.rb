class Api::V1::CocktailsController < ApplicationController
    def index
        response = RestClient.get(
            "https://www.thecocktaildb.com/api/json/v1/1/search.php",
            {
                params: {
                    s: params[:q]
                }
            }   
        )

        if response.body == []
            render json: {error: 'No drinks were found'}, status: 400
            
        else
            results = JSON.parse(response)
            render json: {drinks: results['drinks'] }
        end
    end
end