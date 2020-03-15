describe 'GET /products', type: :request do
  describe'successfull' do
    before do
      get '/api/v1/products',
        params: { 
          SearchQuery: 'Vodka'
        }
    end

    it 'returns 200 status' do
      expect(response.status).to eq 200
    end

  end
end