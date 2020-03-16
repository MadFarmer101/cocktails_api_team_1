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
        image: product["Thumbnail"]["ImageUrl"],
        id: product["ProductId"],
        number: product["ProductNumber"],
        name: product["ProductNameBold"],
        name_2: product["ProductNameThin"],
        category: product["Category"],
        price: product["Price"],
        volume: product["Volume"],
        country: product["Country"],
        producer: product["ProducerName"]
      }
    }
    
    render json: { results: sanitized_products } 
   end
end

