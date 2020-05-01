# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'profiles/new', type: :view do
  before(:each) do
    assign(:profile, Profile.new(
                       name: 'MyString',
                       email: 'MyString',
                       phone: 'MyString',
                       gender: 1
                     ))
  end

  it 'renders new profile form' do
    render

    assert_select 'form[action=?][method=?]', profiles_path, 'post' do
      assert_select 'input[name=?]', 'profile[name]'

      assert_select 'input[name=?]', 'profile[email]'

      assert_select 'input[name=?]', 'profile[phone]'

      assert_select 'input[name=?]', 'profile[gender]'
    end
  end
end
