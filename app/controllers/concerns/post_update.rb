module PostUpdate
  extend ActiveSupport::Concern

  def city_update(post)
    params[:post][:city_id].presence || post.city_id
  end

  def rate_update(post)
    if post_params[:rate].blank?
      # if blank, default value
      post.rate.to_i
    else
      post_params[:rate].to_i
    end
  end
end
