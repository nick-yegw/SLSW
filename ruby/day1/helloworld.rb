#1
str = "hello world"
puts str


#2
str1 = "hello,  ruby."
puts str1.index("ruby.").to_s
puts str1.index("ruby.")


#3.1
i = 0
while i < 10
  puts "nickle3.1"
  i += 1
end

#3.2
i = 0
until i == 10
  puts "nickle3.2"
  i += 1
end


#4
(1..10).to_a.each{|index| puts "This is sentence number #{index}"}


#5
puts "This file has been run"


# extra credit
def play
  puts "Please input the number(1-9) you guess: \n"
  type = gets
  user_number = type.to_i
  server_number = rand(10)
  puts "Your number #{user_number} is " + (user_number > server_number ? "greater than" : user_number == server_number ? "equal to" : "less than") + " correct number #{server_number}"
end


while 1
  play
end
