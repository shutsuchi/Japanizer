# == Schema Information
#
# Table name: notifications
#
#  id              :bigint           not null, primary key
#  action          :string(255)      default(""), not null
#  checked         :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  album_id        :integer
#  post_comment_id :integer
#  post_id         :integer
#  visited_id      :integer          not null
#  visitor_id      :integer          not null
#
# Indexes
#
#  index_notifications_on_post_comment_id  (post_comment_id)
#  index_notifications_on_post_id          (post_id)
#  index_notifications_on_visited_id       (visited_id)
#  index_notifications_on_visitor_id       (visitor_id)
#
class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :post, optional: true
  belongs_to :post_comment, optional: true
  belongs_to :album, optional: true

  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
end
