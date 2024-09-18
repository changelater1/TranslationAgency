# spec/controllers/users_controller_spec.rb
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create(:user) } # Используем фабрику для создания пользователя

#   describe "GET #index" do
#     it "returns a success response" do
#       get :index
#       expect(response).to have_http_status(:ok)
#       expect(assigns(:users)).to eq([user])
#     end

    # describe "GET #show" do
    #     it "returns a success response" do
    #     get :show, params: { id: user.id }, format: :json # Если вы работаете с JSON
    #     expect(response).to have_http_status(:ok)
    #     expect(JSON.parse(response.body)["id"]).to eq(user.id)
    #     end
    # end

    describe "GET #new" do
        it "returns a success response" do
          get :new
          expect(response).to have_http_status(:ok)
        end
    end

    describe "POST #create" do
        context "with valid parameters" do
          it "creates a new User and redirects to the show page" do
            expect {
              post :create, params: { user: { name: 'John Doe', email: 'john@example.com', password: 'password' } }
            }.to change(User, :count).by(1)
            expect(response).to redirect_to(User.last)
          end
        end
    
        context "with invalid parameters" do
          it "does not create a new User and renders the new template" do
            expect {
              post :create, params: { user: { name: '', email: 'invalid', password: '' } }
            }.not_to change(User, :count)
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response.body).to include("errors") # Если рендерится JSON
          end
        end
    end

end