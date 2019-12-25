
# Problem Statement : -
# A  application for handling data of as much as countries that we can. Example of what data that we can have:
# 1. Population
# 2. GDP(Gross Domestic Production)
# 3. States
# 4. Army Strength
# 5. State of country(developing, developed)

# On the basis of all these data we will be building modules to conceive various outputs like:
# 1. Whether that country will get loan from IMF (International Monetary Fund) or WB (World bank).
# 2. Whether the country can have a seat in the UN (United Nations) Security council.
# 3. Whether the country can win the war or not

module War
  
  def win_war? army_strength
    return true if (army_strength > 100)
    return false
  end
  
end

module Loan

  def loan_from_IMF? state_of_country , gdp 
    return true if state_of_country == "DEVELOPING" and gdp > 150
    return false
  end

  def loan_from_WorldBank? gdp 
    return true if gdp > 190
    return false
  end

end

module UN_seat
  
  def seat? gdp, army_strength , state_of_country
    return true if gdp > 200 and army_strength > 100 and state_of_country == "DEVELOPED"
    return false
  end

end

class Countries

  include War
  include Loan
  include UN_seat

  attr_accessor :country_name , :gdp , :population , :number_of_states , :army_strength , :state_of_country , :countries_list

  @@countries_list = Hash.new

  def input_country

    puts "Enter your Country name"
    country_name = gets.chomp.upcase
    puts "Enter GDP  (in lakhs) "
    gdp = gets.chomp.to_i
    puts "Enter Population (in lakhs)"
    population = gets.chomp.to_i
    puts "Number of states"
    number_of_states = gets.chomp.to_i
    puts "Army Strength (in lakhs)"
    army_strength = gets.chomp.to_i
    puts "State of Country"
    state_of_country = gets.chomp.upcase
    country_hash = {"name_of_country"=> country_name , "gdp" => gdp , "population" => population ,"number_of_states" => number_of_states ,"army_strength" => army_strength , "state_of_country" => state_of_country}
    @@countries_list["#{country_name}"] = country_hash

  end

  def display_country
    puts @@countries_list
  end

  country = Countries.new
  country.input_country
  while true
  puts "1. Input Country"
  puts "2. Display Country"
  puts "3. Get Loan from IMF"
  puts "4. Get Loan from World Bank"
  puts "5. Seat in UN"
  puts "6. Win war"
  puts "Select a option"
  option = gets.chomp.to_i
  case option
  when 1
    country.input_country

  when 2
    country.display_country

  when 3
    puts "Enter your country name"
    country_name = gets.chomp.upcase

    if @@countries_list.has_key?(country_name)
      state_of_country = @@countries_list[country_name]['state_of_country']
      gdp = @@countries_list[country_name]['gdp']

      if country.loan_from_IMF? state_of_country , gdp
        puts "#{country_name} can get loan from IMF"
      else
        puts "#{country_name} cannot get loan from IMF"
      end
    else
      puts "Country does not exists in list"
    end

  when 4
    puts "Enter your country name"
    country_name = gets.chomp.upcase

    if @@countries_list.has_key?(country_name)
      gdp = @@countries_list[country_name]['gdp']

      if country.loan_from_WorldBank? gdp
        puts "#{country_name} can get loan from World Bank"
      else
        puts "#{country_name} cannot get loan from World Bank"
      end
    else
      puts "Country does not exists in list"
    end

  when 5
    puts "Enter your country name"
    country_name = gets.chomp.upcase

    if @@countries_list.has_key?(country_name)
      gdp = @@countries_list[country_name]['gdp']
      army_strength = @@countries_list[country_name]['army_strength']
      state_of_country = @@countries_list[country_name]['state_of_country']

      if country.seat? gdp , army_strength , state_of_country
        puts "#{country_name} can get a seat in UN Security council"
      else
        puts "#{country_name} cannot get a seat in UN Security council"
      end
    else
      puts "Country does not exists in list"
    end

  when 6
    puts "Enter your country name"
    country_name = gets.chomp.upcase
    
    if @@countries_list.has_key?(country_name)
      army_strength = @@countries_list[country_name]['army_strength']

      if country.win_war? army_strength
        puts "#{country_name} can win war"
      else
        puts "#{country_name} cannot win war"
      end
    else
      puts "Country does not exists in list"
    end

  else
    puts "Invalid choice"
  end

  puts "Enter X to exit any character to Continue"
  if gets.chomp.upcase == 'X'
    exit
  end
  end
end
