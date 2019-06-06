feature "Adding a post" do

  scenario "can enter a name and a message" do
    visit('/add-post')
    fill_in "name", :with => "Mike"
    fill_in "content", :with => "I learn how to be a better software engineer every day"
    click_button "Add"
    expect(page).to have_content"I learn how to be a better software engineer every day"
  end

end