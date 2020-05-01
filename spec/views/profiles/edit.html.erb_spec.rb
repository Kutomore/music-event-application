require 'rails_helper'

RSpec.describe "profiles/edit", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      name: "MyString",
      email: "MyString",
      phone: "MyString",
      gender: 1
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "input[name=?]", "profile[name]"

      assert_select "input[name=?]", "profile[email]"

      assert_select "input[name=?]", "profile[phone]"

      assert_select "input[name=?]", "profile[gender]"
    end
  end
end
