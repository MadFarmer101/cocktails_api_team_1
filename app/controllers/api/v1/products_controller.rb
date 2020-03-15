class Api::V1::ProductsController < ApplicationController
   def index
   
    response = RestClient.get('https://www.systembolaget.se/api/productsearch/search/sok-dryck/',
        params: {'SearchQuery': 'Vodka'}, 
        headers: {'Ocp-Apim-Subscription-Key': '49416a6bf3604134b9a119f4781e5d5d
            '})
        binding.pry
        if response.body.empty?
            render json: {error: 'No drinks were found'}, status: 400
          else
            results = JSON.parse(response.body)
           
        
         end
   end
end

