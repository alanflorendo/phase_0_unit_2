# U2.W6: Create a Car Class from User Stories


# I worked on this challenge [by myself, with: ].


# 2. Pseudocode 
=begin
    * CREATE a car class
      * CREATE initialize method with color and model as attributes
      * CREATE a distance_to_drive method(user defined distance)
      * CREATE a current_speed method(no argument)
      * CREATE orientation method(user defined orientation)
      * CREATE set_speed method(user defined speeed)
      * CREATE total_distance method(no argument)
      * CREATE action_log method(no argument)
=end


# 3. Initial Solution
=begin
     class Car
       attr_reader :color, :model, :speed, :total_distance, :orientation
       
       
       def initialize(color, model)
         @color = color
         @model = model
       end
       
       def set_orientation(orientation)
         @orientation = orientation
         @actions << "car points to #{@orientation}"
       end
       
       def set_speed(speed)
         @speed = speed
         @actions << "car moves at #{@speed}"
       end
       
       def reset_distance
         @total_distance = 0
         @actions = []
       end
         
      
       def drive(distance)
         @total_distance += distance
         @actions << "car has travelled #{distance} miles"
       end
       
       def action_log
         @actions
       end
       
       def pizza_orders
           @pizza_compartment = []
       end
       
       def add_pizza(pizza_order)
           @pizza_compartment << pizza_order
       end
       
       def pizza_delivery
           @pizza_compartment.shift
           @pizza_compartment
       end
       
       def number_of_pizzas
           @pizza_compartment.length
       end

       def show_pizzas
          @pizza_compartment  
       end
       
       
     end
     
     class Pizza
         def initialize(size, topping)
             @size = size
             @topping = topping
         end
     
     end
     

********** INITIAL DRIVER TESTS **********
# 1. INITIAL DRIVER TESTS GO BELOW THIS LINE
  my_car = Car.new("blue", "Nissan Maxima")
  
  p my_car.color == "blue"
  p my_car.model == "Nissan Maxima"
  
  my_car.reset_distance 
  
  my_car.set_orientation(0)
  my_car.set_speed(25)
  my_car.drive(0.25)
  
  p my_car.speed == 25
  
  my_car.set_speed(0)
  my_car.set_orientation(90)
  my_car.set_speed(35)
  my_car.drive(1.5)
  
  p my_car.speed == 35
  p my_car.total_distance == 1.75
  
  my_car.set_speed(15)
  my_car.drive(0.25)
  my_car.set_speed(0)
  my_car.set_orientation(0)
  my_car.set_speed(35)
  my_car.drive(1.4)
  my_car.set_speed(0)
  
  p my_car.total_distance == 3.4
  p my_car.orientation == 0
  
  p my_car.action_log
  
  alans_pizza = Pizza.new("med", "mushrooms")
  daniels_pizza = Pizza.new("med", "spinach")
  
  my_car.pizza_orders
  my_car.add_pizza(alans_pizza)
  my_car.add_pizza(daniels_pizza)
  
  p my_car.show_pizzas

  
  my_car.pizza_delivery
  p my_car.number_of_pizzas == 1

=end

# 4. Refactored Solution

     class Car
       attr_reader :color, :model, :speed, :total_distance, :orientation
       
       
       def initialize(color, model)
         @color = color
         @model = model
       end
       
       def set_orientation(orientation)
         @orientation = orientation
       end
       
       def turn_right
       	@orientation += 90
       	set_orientation(@orientation)         
        @actions << "#{@actions.length + 1}.  Car turns right."
       end

       def turn_left
       	@orientation -= 90
       	set_orientation(@orientation)
        @actions << "#{@actions.length + 1}.  Car turns left."
       end

       def set_speed(speed)
         @speed = speed
       end
       
       def reset_distance
         @total_distance = 0
         @actions = []
       end        
      
       def drive(speed, distance)
         set_speed(speed)
         @total_distance += distance
         @actions << "#{@actions.length + 1}.  Car has travelled #{distance} miles at #{speed} mph."
       end
       
       def stop
        set_speed(0)
        @actions << "#{@actions.length + 1}.  Car stops."
      end

       def action_log
         @actions
       end
       
       def pizza_orders
           @pizza_compartment = []
       end
       
       def add_pizza(pizza_order)
           @pizza_compartment << pizza_order
       end
       
       def pizza_delivery
           @pizza_compartment.shift
           @pizza_compartment
       end
       
       def number_of_pizzas
           @pizza_compartment.length
       end

       def show_pizzas
          @pizza_compartment  
       end
       
       
     end
     
     class Pizza
         def initialize(size, *toppings)
             @size = size
             @toppings = []
             @toppings << toppings
         end
     
     end
     





#********** REFACTORED DRIVER TESTS **********
# 1. DRIVER TESTS GO BELOW THIS LINE
  puts "DRIVER TESTS"

  my_car = Car.new("blue", "Nissan Maxima")
  
  p my_car.color == "blue"
  p my_car.model == "Nissan Maxima"
  
  my_car.reset_distance 
  
  my_car.set_orientation(0)
  my_car.drive(25, 0.25)
  
  p my_car.speed == 25
  
  my_car.stop
  p my_car.speed == 0

  my_car.turn_right
  my_car.drive(35, 1.5)
  
  p my_car.speed == 35
  p my_car.total_distance == 1.75
  
  my_car.drive(15, 0.25)
  my_car.stop
  my_car.turn_left
  my_car.drive(35, 1.4)
  my_car.stop
  
  p my_car.total_distance == 3.4
  p my_car.orientation == 0
  

  alans_pizza = Pizza.new("med", "mushrooms", "onions", "pineapple")
  daniels_pizza = Pizza.new("med", "spinach", "feta", "peppers", "olives")
  
  my_car.pizza_orders
  my_car.add_pizza(alans_pizza)
  my_car.add_pizza(daniels_pizza)
  
  p my_car.show_pizzas

  
  my_car.pizza_delivery
  p my_car.number_of_pizzas == 1

  


  puts "\nACTION LOG"
  puts my_car.action_log
  
  
  
  
  
  
  
  


# 5. Reflection 