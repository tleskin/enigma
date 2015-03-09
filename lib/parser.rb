class Parser
attr_accessor :message

def load(file)
  File.readlines(file).each do |line|
    self.message = line.to_s.chomp
  end
  end
end
