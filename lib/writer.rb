class FileWriter
  def save(filename, message)
    File.open(filename, "w") do |file|
      file.puts " #{message}"
    end
  end
end
