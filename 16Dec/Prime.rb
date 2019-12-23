puts "Enter the number:"
num=gets.chomp.to_i
count=0
i=1

while(i<=num)
if (num%i==0)
 count=count+1
end
i=i+1
end
if count==2
	puts "Prime number"
else
	puts "Not a prime number"
end
