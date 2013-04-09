#1
array_1 = (1..16).to_a

#puts array_1.each_slice(4) {|i| print i.collect {|b| b*2}}




#3

def my_grep(filename, pattern)
  if File.exist?(filename)
    occurs = 0
    lines = IO.readlines(filename)
    lines.each do |line|
      if line.index(Regexp.new(pattern))
        print "line number #{lines.index(line) +1}: " + line
        occurs += 1
      end
    end
    if occurs == 0
      p "The pattern doesn't cocur in the given file"
    end
  else
    puts "bad1"
  end
end

puts "Please input the file name: "
file_name = gets
puts "Please input the pattern: "
pattern = gets

my_grep(file_name.strip, pattern.strip)
