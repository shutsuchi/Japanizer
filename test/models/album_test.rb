# == Schema Information
#
# Table name: albums
#
#  id            :bigint           not null, primary key
#  budget        :string(255)
#  comment       :text(65535)
#  mean          :string(255)
#  people        :integer
#  post_quantity :integer          default(0), not null
#  rate          :float(24)        not null
#  title         :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  genre_id      :integer          not null
#  image_id      :string(255)
#  user_id       :integer          not null
#
require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
