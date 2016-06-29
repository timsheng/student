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

  def generate_page_url (locale,page_path)
    base_url = generate_base_url locale
    url = base_url + page_path
  end

  def visit_specify_locale_page (locale,page_path)
    url = generate_page_url locale,page_path
    puts 111
    puts url
    puts 222
    navigate_to url
  end
end
