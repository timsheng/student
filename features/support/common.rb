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
    navigate_to url
  end

  def visit_specify_locale_page_without_path (locale)
    url = generate_base_url locale
    navigate_to url
  end

  def wait_page_load(time)
    PageObject.javascript_framework=(:jquery)
    wait_for_ajax(time)
  end 
end
