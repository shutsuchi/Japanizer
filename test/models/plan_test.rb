# == Schema Information
#
# Table name: plans
#
#  id         :bigint           not null, primary key
#  budget     :string(255)      not null
#  first_date :date             not null
#  last_date  :date             not null
#  mean       :string(255)      not null
#  memo       :string(255)
#  people     :integer
#  purpose    :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  genre_id   :integer          not null
#  user_id    :integer          not null
#
require 'test_helper'

class PlanTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
