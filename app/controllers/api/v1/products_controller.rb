class Api::V1::ProductsController < ApplicationController
   def index
		response = RestClient.get(
      "https://www.systembolaget.se/api/productsearch/search/sok-dryck",
      {
        params: {
          type: params[:q]
        },
        headers: {
          'Ocp-Apim-Subscription-Key': 'ac91b542647e461daa3620efb4b544ed'
        }
      }
    )		
    results = JSON.parse(response)
 
    products = results["ProductSearchResults"].first
		
    render json: { results: products } 
   end
end

