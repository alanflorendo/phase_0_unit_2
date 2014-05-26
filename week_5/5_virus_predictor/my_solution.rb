# U2.W5: Virus Predictor

# I worked on this challenge by myself.

# EXPLANATION OF require_relative
#  The general require method allows a program to access code stored in other files.  This allows
#  programs to be broken up into smaller, more workable, logically grouped files.  The use of 
#  require_relative indicates that the required file is in the same directory as the file being 
#  run (original_code.rb).
#
require_relative 'state_data'
#  STATE_DATA contains a hash of hashes.  The first hash has 51 states/districts as keys and hashes 
#  as values.  The internal state hashes have statistic labels as keys and the corresponding 
#  statistics as the values.

class VirusPredictor

  #  Create an initialize method to instantiate a VirusPredictor object
  def initialize(state_of_origin, population_density, population, region, regional_spread)
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end

  # Create a virus_effects method to print, for the state-VirusPredictor called upon, a string
  # indicating the predicted deaths and speed of spread for the given state. 
  def virus_effects  #HINT: What is the SCOPE of instance variables?
    #predicted_deaths(@population_density, @population, @state)
    #speed_of_spread(@population_density, @state)

    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
      speed = 0.5
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
      speed = 1
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
      speed = 1.5
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
      speed = 2
    else 
      number_of_deaths = (@population * 0.05).floor
      speed = 2.5
    end

    puts "#{@state} will lose #{number_of_deaths} people in this outbreak and will spread across 
      the state in #{speed} months.\n\n"


  end

=begin
  private  #what is this?  what happens if it were cut and pasted above the virus_effects method
  # private makes the methods below it unavailable to be called on a specific object.  The 
  virus_effects method can call on these private methods, but they cannot be called outside of
  this object:  Thus, I cannot call "alabama.predicted_deaths".

  # Create a predicted_deaths method to print, for the state-VirusPredictor called upon, a string
  # indicating the predicted number of deaths for the given state.
  def predicted_deaths(population_density, population, state)
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else 
      number_of_deaths = (@population * 0.05).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  # Create a speed_of_spread method to print, for the state-VirusPredictor called upon, a string
  # indicating the predicted speed the disease will spread for the given state.
  def speed_of_spread(population_density, state) #in months
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else 
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end
=end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

=begin
alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population], STATE_DATA["Alabama"][:region], STATE_DATA["Alabama"][:regional_spread]) 
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population], STATE_DATA["New Jersey"][:region], STATE_DATA["New Jersey"][:regional_spread]) 
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population], STATE_DATA["California"][:region], STATE_DATA["California"][:regional_spread]) 
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population], STATE_DATA["Alaska"][:region], STATE_DATA["Alaska"][:regional_spread]) 
alaska.virus_effects
=end


STATE_DATA.each do |state, state_hash|
  state_predictor = VirusPredictor.new(state, STATE_DATA[state][:population_density], 
    STATE_DATA[state][:population], STATE_DATA[state][:region], STATE_DATA[state][:regional_spread])
  state_predictor.virus_effects
end