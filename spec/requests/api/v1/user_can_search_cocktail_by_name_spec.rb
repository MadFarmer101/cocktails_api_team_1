describe 'GET /cocktails', type: :request do
  describe'successfull' do
    before do
      get '/api/v1/cocktails',
        params: {
            q: 'Margarita'
        }
    end

    it 'returns 200 status' do
      expect(response.status).to eq 200
    end

    it 'returns drink id' do
      expect(JSON.parse(response.body)["drinks"].first["id"]).to eq "11007"
    end

    it 'returns drink name' do
      expect(JSON.parse(response.body)["drinks"].first["name"]).to eq "Margarita"
    end

    it 'returns drink Category' do
      expect(JSON.parse(response.body)["drinks"].first["category"]).to eq "Ordinary Drink"
    end

    it 'returns drink IBA' do
      expect(JSON.parse(response.body)["drinks"].first["IBA"]).to eq "Contemporary Classics"
    end

    it 'returns number of drinks' do
      expect(JSON.parse(response.body)["drinks"].count).to eq 5
    end

  end

  describe 'no cocktails found' do
    before do
      get '/api/v1/cocktails',
        params: {
            q: 'hgjhvhj'
        }
    end
    
    it 'returns 400 status' do
      expect(response.status).to eq 400
    end

    it 'returns error message' do
      expect(JSON.parse(response.body)['error']).to eq 'No drinks were found'
    end
  end 

  describe 'no query params' do
    before do
      get '/api/v1/cocktails',
        params: {
            q: ''
        }
    end
        
    it 'returns 400 status' do
      expect(response.status).to eq 400
    end

    it 'returns error message' do
      expect(JSON.parse(response.body)['error']).to eq 'No input in search field'
    end
  end 
end