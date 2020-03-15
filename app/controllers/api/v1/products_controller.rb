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

    sanitized_products = 
    {
     product_image: products["Thumbnail"]["ImageUrl"],
     product_id: products["ProductId"],
     product_number: products["ProductNumber"],
     product_name: products["ProductNameBold"],
     product_name_2: products["ProductNameThin"],
     product_category: products["Category"],
     product_price: products["Price"],
     product_volume: products["Volume"],
     product_country: products["Country"],
     product_producer: products["ProducerName"]
    }
	
    render json: { results: sanitized_products } 
   end
end

