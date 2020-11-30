# chainring = 52  #number of teeth
# cog = 11
# ratio = chainring / cog.to_f
# puts ratio  #=> 4.7272727272727275, each time the pedals complete one rotation, the wheels turn almost 5 times, harder gear

# chainring2 = 30  #number of teeth
# cog2 = 27
# ratio2 = chainring2 / cog2.to_f
# puts ratio2 #=> 1.1111111111111112, each time the pedals turn once, the wheel turns about 1 time, easy gear

# 1. For a gear calculator, calculate the gear ratio with the formula:  chainring teeth / cog teeth
# 2. New feature request: Bikes sometimes have different wheel sizes. Big wheels go farther, little wheels go shorter
# Calculate the gear inches with the formula: gear inches = wheel diameter * gear ratio
# wheel diameter = rim diameter + tire diameter * 2

class Gear 
    attr_reader :chainring, :cog, :rim, :tire

    def initialize(chainring, cog, rim, tire)
        @chainring = chainring
        @cog = cog
        @rim = rim
        @tire = tire
    end

    def ratio 
        chainring / cog.to_f
    end

    def gear_inches
        # tire goes around rim twice for diameter
        ratio * (rim + (tire * 2))
    end
end

puts Gear.new(52, 11).ratio
#=> 4.7272727272727275
puts Gear.new(30, 27).ratio
#=> 1.1111111111111112

puts Gear.new(52, 11, 26, 1.5).gear_inches
#=>
puts Gear.new(52, 11, 24, 1.25)
#=>
