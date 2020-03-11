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
        results = JSON.parse(response)
        binding.pry
        if results['drinks'].nil?
            render json: {error: 'No drinks were found'}, status: 400
        else
            render json: {drinks: results['drinks'] }
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