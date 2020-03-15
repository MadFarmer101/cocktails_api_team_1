class Api::V1::ProductsController < ApplicationController
   def index
    binding.pry
    RestClient.get('https://www.systembolaget.se/api/productsearch/search/sok-dryck/',
        params: {'SearchQuery': 'Vodka'}, 
        headers: {'Ocp-Apim-Subscription-Key': 'ac91b542647e461daa3620efb4b544ed'})


   end
end