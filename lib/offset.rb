class Offset

  attr_accessor :offset_values, :date


  def initialize(date = todays_date)
    @date = date
    @offset_values = {}

  end

  def todays_date
    time = Time.now
    time = time.strftime("%m%d%y")
  end

  def square(date)
    if date.start_with?("0")
      time = date.slice(1, 5).to_i
    else
      time = time.to_i
    end
    time * time
  end

  def rotation_a(square)
    @offset_values[:a] = square[0,1].to_i
  end

  def rotation_b(square)
    @offset_values[:b] = square[1,1].to_i
  end

  def rotation_c(square)
    @offset_values[:c] = square[2,1].to_i
  end

  def rotation_d(square)
    @offset_values[:d] = square[3,1].to_i
  end

end
