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
  pending "add some examples to (or delete) #{__FILE__}"
end
