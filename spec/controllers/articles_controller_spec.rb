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

  context 'GET #new' do
    # except index and show all other controller methods needs to be authenticated.
    before(:each) do
      admin_login('sam', 'sam')
    end
    it 'returns a success if http authentication is done' do
      get :new
      expect(response).to have_http_status(:ok) #200 as we already authenticated using admin_login else it would be 401 error if authentication not done.
    end
    it 'render new template view if authorized' do
      get :new
      expect(response).to render_template("new")
      expect(response.body).to eq ""
    end
  end


  context 'GET #create' do
    before(:each) do
      admin_login('sam', 'sam')
    end

    #TODO: find the right way to pass the params to controller methods
    # it 'render index page if article is created' do
    #   article  = Article.create!(title: 'Test title', text: 'Test text test text')
    #   get :create, params: { article.to_param}
    #   expect(response).to render_template("index")
    # end
    # it 'render new page if article is not created' do
    #   article  = Article.create(title: 'Test', text: 'Test text test text')
    #   get :create, params: { title: 'Test', text: 'Test text test text'}
    #   expect(response).to render_template("new")
    # end

  end

  private
  def admin_login(user_name, password)
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user_name, password)
  end

end
