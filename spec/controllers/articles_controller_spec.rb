require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  context 'GET #index' do

    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
    it 'render index template view' do
    end
  end
  context 'GET #show' do
    it 'returns a success response' do
      article  = Article.create!(title: 'Test title', text: 'Test text test text')
      get :show, params: { id: article.to_param}
      expect(response).to have_http_status(:ok)
    end
    it 'render show template view' do
    end
  end

end
