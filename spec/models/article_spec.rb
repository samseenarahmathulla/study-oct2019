require 'rails_helper'

RSpec.describe Article, type: :model do

  #samseena
  context 'validation tests' do
    it 'ensures the presence of title' do
      article = Article.new(text: 'Test text test text').save
      expect(article).to eq(false)
    end
    it 'ensures the minimum length of the title is 5' do
      article = Article.new(title: 'Test title', text: 'Test text test text')
      expect(article[:title].length).to be >= 5
      #OR
      article = Article.new(title: 'Tes', text: 'Test text test text').save
      expect(article).to eq(false)
    end
    it 'should save the article successfully' do
      article = Article.new(title: 'Test title', text: 'Test text test text').save
      expect(article).to eq(true)
    end
  end

  #for eg to get the active users etc if active is a boolean field in users table.
  # context 'scope tests' do
  #   let(:params) {{first_name: 'First', last_name: 'Last', email: 'sam@ex.com'}} #populating 5 kinds of users
  #   before(:each) do
  #     User.new(params).save
  #     User.new(params).save
  #     User.new(params.merge(active: true)).save
  #     #inactive users
  #     User.new(params.merge(active: false)).save
  #     User.new(params.merge(active: false)).save
  #   end
  #
  #   it 'should return active users' do
  #     expect(User.active_users.size).to eq(3)
  #   end
  #
  #   it 'should return inactive users' do
  #     expect(User.inactive_users.size).to eq(2)
  #   end
  # #go to User.rb model and create the scope for active and inactive users.
  # scope :active_users, -> { where(active: true) }
  # scope :inactive_users, -> { where(active: false) }
  # end
end
