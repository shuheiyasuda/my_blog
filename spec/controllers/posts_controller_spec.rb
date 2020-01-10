require 'rails_helper'

describe PostsController, type: :controller do

  describe "GET #index" do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested post to @post" do
      post = create(:post)
      get :edit, params: { id: post }
      expect(assigns(:post)).to eq post
    end

    it "renders the :edit template" do
      post = create(:post)
      get :edit, params: { id: post }
      expect(response).to render_template :edit
    end
  end

  describe "GET #show" do
    it "assigns the requested post to @post" do
      post = create(:post)
      get :show, params: { id: post}
      expect(assigns(:post)).to eq post
    end

    it "renders the :show template" do
      post = create(:post)
      get :show, params: { id: post}
      expect(response).to render_template :show
    end
  
  end
end