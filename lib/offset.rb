class Offset

  attr_accessor :offset_values, :date

  def initialize(date = todays_date)
    @date = date
    @offset_values = []
  end

  def return_offset
    squared = square(@date).to_s
    rotation_a(squared)
    rotation_b(squared)
    rotation_c(squared)
    rotation_d(squared)
    @offset_values
  end

  def todays_date
    time = Time.now
    time = time.strftime("%m%d%y")
  end

  def square(date)

    if date.start_with?("0")
      time = date.slice(1, 5).to_i
    else
      time = date.to_i
    end
    time * time
  end

  def rotation_a(square)
    @offset_values << square[5].to_i
  end

  def rotation_b(square)
    @offset_values << square[6].to_i
  end

  def rotation_c(square)
    @offset_values << square[7].to_i
  end

  def rotation_d(square)
    @offset_values << square[8].to_i
  end

end
