module UserStatus
  extend ActiveSupport::Concern

  def get_post(val, obj)
    obj_count = 0
    val.each do |post|
      count = obj.where(post_id: post.id).count
      obj_count += count
    end
  end

  def get_album(val, obj)
    obj_count = 0
    val.each do |album|
      count = obj.where(album_id: album.id).count
      obj_count += count
    end
  end

  def give_obj(obj, theuser)
    obj.where(user_id: theuser.id)
  end
end
