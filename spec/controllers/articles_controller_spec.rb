require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  context 'GET #index' do

    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
    it 'render index template view' do
      get :index
      expect(response).to render_template("index") #for this add rails-controller-testing gem to Gemfile.
      expect(response.body).to eq ""
    end
  end
  context 'GET #show' do
    article  = Article.create!(title: 'Test title', text: 'Test text test text')
    it 'returns a success response' do
      get :show, params: { id: article.to_param}
      expect(response).to have_http_status(:ok)
    end
    it 'render show template view' do
      get :show, params: { id: article.to_param}
      expect(response).to render_template("show")
      expect(response.body).to eq ""
    end
  end

end
