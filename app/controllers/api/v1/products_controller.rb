class Api::V1::ProductsController < ApplicationController
   def index
    binding.pry
    RestClient.get('https://www.systembolaget.se/api/productsearch/search/sok-dryck/',
        params: {'SearchQuery': 'Vodka'}, 
        headers: {'Ocp-Apim-Subscription-Key': '98b9582575b5412ab492850d2b0ce318'})

   end
end