module Page
  extend ActiveSupport::Concern

  def type_page_6(obj, pg_name)
    obj.page(pg_name).order(created_at: :desc).per(6)
  end

  def type_page_8(obj, pg_name)
    obj.page(pg_name).order(created_at: :desc).per(8)
  end

  def page_8(obj)
    obj.page(params[:page]).order(created_at: :desc).per(8)
  end

  def array_page(obj)
    Kaminari.paginate_array([obj]).page(params[:page]).per(8)
  end

end