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

    sanitized_products = results["ProductSearchResults"].map { |product|
      {
        product_image: product["Thumbnail"]["ImageUrl"],
        product_id: product["ProductId"],
        product_number: product["ProductNumber"],
        product_name: product["ProductNameBold"],
        product_name_2: product["ProductNameThin"],
        product_category: product["Category"],
        product_price: product["Price"],
        product_volume: product["Volume"],
        product_country: product["Country"],
        product_producer: product["ProducerName"]
      }
    }
    
    render json: { results: sanitized_products } 
   end
end

