# frozen_string_literal: true

require 'rails_helper'

describe 'profiles/show' do
  before(:each) do
    @profile = assign(:profile, FactoryBot.create(:profile, :with_address))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/2/)
  end
end
