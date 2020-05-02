# frozen_string_literal: true

describe Address do
  it { is_expected.to belong_to(:addressable) }
end
