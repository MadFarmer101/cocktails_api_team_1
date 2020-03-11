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

        it 'returns drink' do
            expect(JSON.parse(response.body)['drinks'].first['strDrink']).to eq "Margarita"
        end
    end

    describe 'no cocktails found' do
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
            expect(JSON.parse(response.body)['error']).to eq 'No drink were found'
        end
    end 
end