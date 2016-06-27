module Helper
  def get_random_select_value_without_default arr
    arr.shift
    arr.sample
  end

  def generate_base_url locale
    if locale == 'zh-cn'
      "#{FigNewton.storm.base_url}"
    else
      "#{FigNewton.storm.row_base_url}" + "/" + locale
    end
  end
end
