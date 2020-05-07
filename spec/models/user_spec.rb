# frozen_string_literal: true

describe User do
  it { is_expected.to belong_to(:profile) }
  it { is_expected.to delegate_method(:time_zone).to(:profile) }
  it { is_expected.to delegate_method(:genre_ids).to(:profile) }
  it { is_expected.to accept_nested_attributes_for(:profile) }
end
