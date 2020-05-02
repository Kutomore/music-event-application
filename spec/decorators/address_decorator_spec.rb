# frozen_string_literal: true

describe AddressDecorator do
  let(:address) { build(:address).decorate }

  it 'returns a formatted string' do
    expect(address.to_s).to eq(
      [
        address.street,
        address.state,
        address.city,
        address.zip
      ].select(
        &:present?
      ).join(', ')
    )
  end
end
