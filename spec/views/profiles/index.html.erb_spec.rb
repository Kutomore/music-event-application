# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'profiles/index', type: :view do
  before(:each) do
    assign(:profiles, [
             Profile.create!(
               name: 'Name',
               email: 'Email',
               phone: 'Phone',
               gender: 2
             ),
             Profile.create!(
               name: 'Name',
               email: 'Email',
               phone: 'Phone',
               gender: 2
             )
           ])
  end

  it 'renders a list of profiles' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Email'.to_s, count: 2
    assert_select 'tr>td', text: 'Phone'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
