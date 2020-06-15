files = Dir["./*.txt"]
patterns = {}
files.each do |file|
  patterns["[[#{file.gsub('./','').gsub('.txt','')}]]"] = :not_found
end

patterns.each do |pattern,value|
  files.each do |file|
    File.open(file).read.each_line{ |line|
      if line.include?(pattern) then
        patterns[pattern] = :found
      end
    }
  end
end

puts patterns.select { |pattern,value| value == :not_found }
