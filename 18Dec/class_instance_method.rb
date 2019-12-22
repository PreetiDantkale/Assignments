#This program is to demonstrate the implementation of atrr_reader,attr_writer
#attr_reader ,attr_accessor, class and instance variables, public ,private ,protected

class Today
	attr_reader :name, :gender
	# creates reader. instead of writing getter for each and every variable 
	#attr_reader shortens the code and works in place of getter	
  attr_writer :gender 
  # creates writer. instead of writing setters for every variable attr_writer 
  #shortens the code and replaces the setters
	attr_accessor :city
	# creates reader and writer : It is used to create both reader and writer for a variable  	

	def initialize(name,gender,city)
		@name=name
		@gender=gender
		@city=city
	end
  
  def self.Class_method
	p "This is class method.Class methods are called on class. To call class metho	d instance is not required. It provides functionality to the class itself."
	end

	def Today.Class_method2
		p "This is another way to create class method"
	end

	#Can be called by everyone. No access control
	public
	def instance_method
		p "It provides functionality to particular instance of class. 
		These methods are called on instance of class."
	end
	
	#Is used in inheritance
	protected
	def demo_protected
		p "This is protected"
	end

	#Cannot be called anywhere outside the class. Is accessible within the class only
	private
	def demo_private
		p "This is private"
	end
	#ways to call class methods
	self.Class_method
	Today.Class_method2
	end
	
	t=Today.new("Preeti","Female","Pune")
	t.instance_method
	puts t.name
	puts t.gender
	puts t.city

	#t.demo_protected		
	#t.demo_private

#Output
# "This is class method.Class methods are called on class. To call class method \n\tinstance is not required. It provides functionality to the class itself."
# "This is another way to create class method"
# "It provides functionality to particular instance of class. \n\tThese methods are called on instance of class."
# Preeti
# Female
# Pune
