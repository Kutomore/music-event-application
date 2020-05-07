# frozen_string_literal: true

describe Profile do
  it { is_expected.to have_one(:user) }
  it { is_expected.to have_and_belong_to_many(:genres) }

  it { is_expected.to define_enum_for(:gender).with_values(undisclosed: 0, female: 1, male: 2, other: 3) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:birthdate) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:phone) }
  it { is_expected.to validate_presence_of(:address) }
  it { is_expected.to validate_presence_of(:time_zone) }
  it { is_expected.to validate_numericality_of(:phone) }
  it { is_expected.to validate_length_of(:phone).is_at_least(8).is_at_most(15) }
  it { is_expected.to allow_value('user@example.com').for(:email) }
  it { is_expected.not_to allow_value('userexample.com').for(:email) }
  it { is_expected.to validate_inclusion_of(:time_zone).in_array(ActiveSupport::TimeZone::MAPPING.keys) }
end
