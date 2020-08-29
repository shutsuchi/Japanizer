module AlbumUpdate
  extend ActiveSupport::Concern

  def post_quantity_update(album)
    params[:album][:post_quantity] || album.post_quantity
  end

  def rate_update(album)
    if params[:album][:rate].blank?
      album.rate.to_i
    else
      params[:album][:rate].to_i
    end
  end

  def post_album_update(album)
    return if album.post_quantity.nil?

    c = 0
    while c < album.post_quantity
      post_id = params[:album][:post_quantity][c].to_i
      post = find_post(post_id)
      post.update(album_id: album.id)
      (c += 1)
    end
  end
end
