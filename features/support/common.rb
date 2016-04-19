module Helper
  def get_random_array_value_without_default arr
    arr.shift
    arr.sample
  end

end
