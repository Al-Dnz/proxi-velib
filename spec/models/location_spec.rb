# frozen_string_literal: true

# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  address    :string
#  latitude   :decimal(15, 13)
#  longitude  :decimal(15, 13)
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Location, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  let(:location) { FactoryBot.build(:location) }

  describe Location do
    it 'has a valid Factory' do
      build(:location).should be_valid
    end
  end

  describe 'Model instantiation' do
    subject(:new_location) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
      it { is_expected.to have_db_column(:address).of_type(:string) }
      it { is_expected.to have_db_column(:latitude).of_type(:decimal) }
      it { is_expected.to have_db_column(:longitude).of_type(:decimal) }
    end
  end
end
