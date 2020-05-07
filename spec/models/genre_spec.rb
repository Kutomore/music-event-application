# frozen_string_literal: true

describe Genre do
  it { is_expected.to have_and_belong_to_many(:events) }
  it { is_expected.to have_and_belong_to_many(:profiles) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
end
