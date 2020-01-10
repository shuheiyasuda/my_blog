require "rails_helper"

describe UsersController, type: :controller do

  describe "GET #show" do
    it "assigns the requested user to @user" do
      user = create(:user)
      get :show, params: { id: user}
      expect(assigns(:user)).to eq user
    end

    it "renders the :show remplate" do
      user = create(:user)
      get :show, params: { id: user}
      expect(response).to render_template :show
    end
  end


end