describe 'GET /cocktails/:id', type: :request do
  before do
    get '/api/v1/cocktails/16158'
  end

  it 'returns 200 status' do
    expect(response.status).to eq 200    
  end

  it 'returns correct cocktail name' do
    expect(JSON.parse(response.body)['drinks'].first['name']).to eq 'Whitecap Margarita'
  end

  it 'returns drink id' do
    expect(JSON.parse(response.body)["drinks"].first["id"]).to eq "16158"
  end

  it 'returns drink Category' do
    expect(JSON.parse(response.body)["drinks"].first["category"]).to eq "Other/Unknown"
  end

  it 'returns drink IBA' do
    expect(JSON.parse(response.body)["drinks"].first["IBA"]).to eq nil
  end

  it 'returns drink Glass type' do
    expect(JSON.parse(response.body)["drinks"].first["glass"]).to eq "Margarita/Coupette glass"
  end

  it 'returns Instructions' do
    expect(JSON.parse(response.body)["drinks"].first["instructions"]).to eq "Place all ingredients in a blender and blend until smooth. This makes one drink."
  end

  it 'returns drink Image' do
    expect(JSON.parse(response.body)["drinks"].first["image"]).to eq "https://www.thecocktaildb.com/images/media/drink/srpxxp1441209622.jpg"
  end

  it 'returns drink Ingredient 1' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][0]["name"]).to eq "Ice"
  end

  it 'returns drink Ingredient 2' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][1]["name"]).to eq "Tequila"
  end

  it 'returns drink Ingredient 3' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][2]["name"]).to eq "Cream of coconut"
  end

  it 'returns drink Ingredient 4' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][3]["name"]).to eq "Lime juice"
  end

  it 'returns drink Ingredient 5' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][4]["name"]).to eq nil
  end

  it 'returns drink Ingredient 6' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][5]["name"]).to eq nil
  end

  it 'returns drink Ingredient 7' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][6]["name"]).to eq nil
  end

  it 'returns drink Ingredient 8' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][7]["name"]).to eq nil
  end

  it 'returns drink Ingredient 9' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][8]["name"]).to eq nil
  end

  it 'returns drink Ingredient 10' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][9]["name"]).to eq nil
  end

  it 'returns drink Ingredient 11' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][10]["name"]).to eq nil
  end

  it 'returns drink Ingredient 12' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][11]["name"]).to eq nil
  end

  it 'returns drink Ingredient 13' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][12]["name"]).to eq nil
  end

  it 'returns drink Ingredient 14' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][13]["name"]).to eq nil
  end

  it 'returns drink Ingredient 15' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][14]["name"]).to eq nil
  end

  it 'returns drink measurement 1' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][0]["measure"]).to eq "1 cup "
  end

  it 'returns drink measurement 2' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][1]["measure"]).to eq "2 oz "
  end

  it 'returns drink measurement 3' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][2]["measure"]).to eq "1/4 cup "
  end

  it 'returns drink measurement 4' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][3]["measure"]).to eq "3 tblsp fresh "
  end

  it 'returns drink measurement 5' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][4]["measure"]).to eq nil
  end

  it 'returns drink measurement 6' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][5]["measure"]).to eq nil
  end

  it 'returns drink measurement 7' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][6]["measure"]).to eq nil
  end

  it 'returns drink measurement 8' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][7]["measure"]).to eq nil
  end

  it 'returns drink measurement 9' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][8]["measure"]).to eq nil
  end

  it 'returns drink measurement 10' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][9]["measure"]).to eq nil
  end

  it 'returns drink measurement 11' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][10]["measure"]).to eq nil
  end

  it 'returns drink measurement 12' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][11]["measure"]).to eq nil
  end

  it 'returns drink measurement 13' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][12]["measure"]).to eq nil
  end

  it 'returns drink measurement 14' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][13]["measure"]).to eq nil
  end
  it 'returns drink measurement 15' do
    expect(JSON.parse(response.body)["drinks"].first["ingredients"][14]["measure"]).to eq nil
  end

  it 'returns number of drinks' do
    expect(JSON.parse(response.body)["drinks"].count).to eq 1
  end
end