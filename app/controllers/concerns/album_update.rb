module AlbumUpdate
  extend ActiveSupport::Concern

  def post_quantity_update(album)
    if params[:album][:post_quantity]
      params[:album][:post_quantity].count
    else
      album.post_quantity
    end
  end

  def rate_update(album)
    if params[:album][:rate].blank?
      album.rate.to_i
    else
      params[:album][:rate].to_i
    end
  end

  def post_album_update(album)
    if album.post_quantity.present?
      c = 0
      while c < album.post_quantity
          post_id = params[:album][:post_quantity][c].to_i
          post = find_post(post_id)
          post.update(album_id: album.id)
          (c += 1)
      end
    end
  end

end
