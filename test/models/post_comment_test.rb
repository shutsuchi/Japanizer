# == Schema Information
#
# Table name: post_comments
#
#  id         :bigint           not null, primary key
#  comment    :text(65535)      not null
#  rate       :float(24)        default("0"), not null
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer          not null
#  user_id    :integer          not null
#
require 'test_helper'

class PostCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
