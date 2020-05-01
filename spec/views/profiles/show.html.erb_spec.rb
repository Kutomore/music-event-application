# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'profiles/show', type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
                                  name: 'Name',
                                  email: 'Email',
                                  phone: 'Phone',
                                  gender: 2
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/2/)
  end
end
