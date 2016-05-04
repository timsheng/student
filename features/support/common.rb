module Helper
  def get_random_select_value_without_default arr
    arr.shift
    arr.sample
  end

  def generate_base_url locale
    "#{FigNewton.row_base_url}" + "/" + locale
  end


end
