require 'rails_helper'

#RSpec.feature "Projects", type: :feature do
#  pending "add some scenarios (or delete) #{__FILE__}"
#end

RSpec.feature "Projects", type: :feature do
  login_user

  context "Create new project" do
    before(:each) do
      # login_user
      visit new_project_path
      # Increase specificity to allow more than one form (e.g. a search box and the projects form) 
      # to simultaneously exist on the same page.
      within(find_by_id("ProjectForm")) do
        fill_in "Title", with: "Test title"
      end
    end

    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
    end

    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update project" do
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      visit edit_project_path(project)
    end

    scenario "should be successful" do
      within(find_by_id("ProjectForm")) do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      within(find_by_id("ProjectForm")) do
        fill_in "Description", with: ""
      end
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Remove existing project" do
    let!(:project) { Project.create(title: "Test title", description: "Test content") }
    scenario "remove project" do
      visit projects_path
      click_link "Delete"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end
  end
end