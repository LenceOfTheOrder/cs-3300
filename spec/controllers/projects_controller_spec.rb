require 'rails_helper'
# require './app/controllers/projects_controller'

# Change this ArticlesController to your project
RSpec.describe ProjectsController, type: :controller do
    login_user

    # This should return the minimal set of attributes required to create a valid
    # Article. As you add validations to Article, be sure to adjust the attributes here as well.
    let(:valid_attributes) {
        { :title => "Test title!", :description => "This is a test description" }
    }

    let(:valid_session) { {} }

    let!(:tproject) { Project.create(title: "Test title", description: "Test description") }

    describe "GET #index" do
        # GET / projects#index
        # GET /projects(.:format) projects#index
        it "returns a success response" do
            # Project.create! valid_attributes
            get :index, params: {}, session: valid_session
            expect(response).to be_successful # be_successful expects a HTTP Status code of 200
            #expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
        end
    end

    describe "GET #show" do
        # GET /projects/:id(.:format) projects#show
        it "returns a success response" do
            # Project.create! valid_attributes
            get :show, params: { id: tproject }, session: valid_session
            expect(response).to be_successful
        end
    end

    describe "GET #new" do
        # GET /projects/new(.:format) projects#new
        it "returns a success response" do
            # Project.create! valid_attributes
            get :new, params: {}, session: valid_session
            expect(response).to be_successful
        end
    end

    describe "GET #edit" do
        # GET /projects/:id/edit(.:format) projects#edit
        it "returns a success response" do
            # Project.create! valid_attributes
            get :edit, params: { id: tproject }, session: valid_session
            expect(response).to be_successful
        end
    end

    describe "POST #create" do
        # POST /projects(.:format) projects#create
        it "returns a success response" do
            # Instantiate a project
            Project.create! valid_attributes
            expect(response).to be_successful
        end
    end

    describe "PATCH #update" do
        # PATCH /projects/:id(.:format) projects#update
        # PUT /projects/:id(.:format) projects#update
        it "returns a success response" do
            # instantiate a project object
            @project = Project.create! valid_attributes
            # use the ActiveRecord "update" class method: https://apidock.com/rails/ActiveRecord/Persistence/ClassMethods/update
            Project.update(@project.id, title: "Updated test title", description: "Updated test description" )#, session: valid_session
            expect(response).to be_successful
        end
    end

    describe "DELETE #destroy" do
        # DELETE /projects/:id(.:format) projects#destroy
        it "returns a success response" do
            @project = Project.create! valid_attributes
            delete :destroy, params: { id: @project.id }, session: valid_session
            # After deleting a resource, we are redirected to the index
            expect(response).to have_http_status(302) # Expects a HTTP Status code of 302
        end
    end

end