class FoodOrder
	attr_reader :name
	public
	@@menu = Hash.new
	@@menu = {"MANCHURIAN"=>40,"NOODLES"=>70,"SCHEZWAN RICE"=>90,"SCHEZWAN NOODLES"=>80,"MANCHOW SOUP"=>20,"RICE"=>60}
	
	def initialize(name)
		@name = name
	end

	def accept_order
		puts "---Enter you order--"
		@order = gets.chomp
		@order = @order.upcase
	end

	def show_menu
		puts "***********MENU ITEMS***********"
		@@menu.each do |key, value|
			puts "#{key} -- Rs.#{value}"
		end
	end

	def check_item
		if @@menu.has_key?(@order)
			puts "---#{@order} is Available---"
			@status = "AVAILABLE"
			@bill = @@menu.fetch(@order)
			puts @status
		else
			puts "#{@order} Not Available"
			@status = "NOT AVAILABLE "
		end
	end

	def order_status
		puts "Status of your order #{@order}"
	end

	def change_status
		if @status == "AVAILABLE"
			sleep 5
			@status = "ORDER ACCEPTED"
			puts @status
			puts "Your Bill Amount #{@bill}"
			puts "Please Wait for Sometime"		
			sleep 5
			@status = "ORDER DELIVERED"
			puts @status
		else 
			puts @status
		end
	end
end

f1=FoodOrder.new("Preeti")
f1.show_menu
puts f1.name
f1.accept_order
f1.check_item
f1.order_status
f1.change_status

