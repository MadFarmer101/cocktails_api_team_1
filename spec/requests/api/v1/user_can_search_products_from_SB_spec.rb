RSpec.describe Api::V1::ProductsController, type: :request do
  describe "GET /api/alcohols successfully" do
    before do
      get "/api/v1/products",
      params: {
        q: "Vodka"
      }
    end

    it "should return a 200 response" do
      expect(response).to have_http_status 200
    end
    it "should return a correct name of first product" do
      binding.pry
      expect(JSON.parse(response.body)["results"]["ProductSearchResults"][0]["ProductNameBold"]).to eq '1850'
    end
  end
end