module Helper
  def get_random_select_value_without_default arr
    arr.shift
    arr.sample
  end

end
