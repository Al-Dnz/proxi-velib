# frozen_string_literal: true

# == Schema Information
#
# Table name: stations
#
#  id             :bigint           not null, primary key
#  identification :string
#  latitude       :decimal(15, 13)
#  longitude      :decimal(15, 13)
#  name           :string
#  vacant_bikes   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Station, type: :model do
  let(:station) { FactoryBot.build(:station) }

  describe Station do
    it 'has a valid Factory' do
      build(:station).should be_valid
    end
  end

  describe 'Model instantiation' do
    subject(:new_station) { described_class.new }

    describe 'Database' do
      it { is_expected.to have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
      it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }
      it { is_expected.to have_db_column(:identification).of_type(:string) }
      it { is_expected.to have_db_column(:latitude).of_type(:decimal).with_options(precision: 15, scale: 13) }
      it { is_expected.to have_db_column(:longitude).of_type(:decimal).with_options(precision: 15, scale: 13) }
      it { is_expected.to have_db_column(:vacant_bikes).of_type(:integer) }
    end
  end
end
