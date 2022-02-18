NAMES = 'names.txt'
BUFFER = 'buffer.txt'

def index
  File.foreach(NAMES) { |name| puts name }
end

def where(pattern)
  File.foreach(NAMES).with_index do |name, index|
    @name_id = index if name.include?(pattern)
  end

  @name_id
end

def update(id, text)
  file = File.open(BUFFER, 'w')
  
  File.foreach(NAMES).with_index do |name, index|
    file.puts(id == index ? text : name)
  end

  file.close
  File.write(NAMES, File.read(BUFFER))

  File.delete(BUFFER) if File.exist?(BUFFER)
end

def delete(id)
  file = File.open(BUFFER, "w")
  File.foreach(NAMES).with_index do |name, index|
      file.puts name if id != index
  end

  file.close
  File.write(NAMES, File.read(BUFFER))

  File.delete(BUFFER) if File.exist?(BUFFER)
end

def find(id)
  File.foreach(NAMES).with_index do |name, index|
    puts name if id == index
  end
end

puts index
puts find(3)
puts where('Igrem')
# update(2, "Gromikovskiy Andrey")
# delete(1)
