number = gets.chomp.to_i

def prime? number
  i = 2

  while i <= Math.sqrt(number)
    return false if number%i == 0
    i += 1
  end
  
  return true
end

if prime?number
  p "Prime number"
else
  p "Not a Prime number "
end