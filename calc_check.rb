#!/usr/bin/env ruby

require 'colorize'

def help11(times, num)   
	puts "0#{num} * #{times}"
	n = num.to_s.size + 1
	n.times{print '-'}		
	puts 
	cur = " " * n;
	pos = n - 1
    carry = 0
	while pos >= 0 do
		if pos == n - 1 then
			cur[pos]  = num.to_s.split(//)[-1];
			print cur, " <- rewrite last digit\n"
		else
			a = (pos == 0 ? 0 : num.to_s[pos - 1].to_i)
			b = num.to_s[pos + 1 - 1].to_i
			res = carry + a + b
			if (res >= 10) then
				cur[pos] = (res % 10).to_s.colorize(:red) if pos != 0
				print cur, " <- add #{pos}th digit (#{a}) and #{pos + 1}th digit (#{b})" + (carry == 1 ? " with carry" : "") + (" and have carry to the next digit")
				puts
				carry = 1
			else
				cur[pos] = res.to_s;	 
				print cur, " <- add #{pos}th digit (#{a}) and #{pos + 1}th digit (#{b})" + (carry == 1 ? " with carry" :"")
				puts
				carry = 0;
			end
		end
		pos -= 1
	end
	puts cur
	puts "Help was done"
end

def mult(times)
    a = rand(100000)
    puts "#{a} * #{times}"
	while (true) do
		res = gets().chomp; 
		if (res == "help") then
			help11(times, a) if times == 11
		elsif not res.scan(/\D/).empty? or res.empty? then return end
		if res.to_i != a * times then
			puts "Wrong answer"
		else
			puts "Ok, go to the next"
			a = rand(100000)
			puts "#{a} * #{times}"
		end 
	end
end

while (true) do
promt_for_type = <<promt
Enter the type of multiplicatoin you want to practice
1) multiple by 11
2) multiple by 12
promt

puts promt_for_type
type = gets.chomp

case type
	when "1" then mult(11)
	when "2" then mult(12)
end

puts "Do you want to coninue? (y/n)"
ans = gets().chomp;

puts "Good bye" if ans == "n"
break if ans == "n"
end
