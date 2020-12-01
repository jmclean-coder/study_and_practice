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
    attr_reader :chainring, :cog, :wheel

    def initialize(chainring, cog, wheel=nil)
        @chainring = chainring
        @cog = cog
        @wheel = wheel
    end

    def ratio 
        chainring / cog.to_f
    end

    #assuming inches
    def gear_inches
        # tire goes around rim twice for diameter
        ratio * wheel.diameter
    end
end


# New feature request just came in to calculate the circumference (pi * diameter), aha! Now would be a good time for the Wheel class implementation.
class Wheel
    attr_reader :rim, :tire

    def initialize(rim, tire)
        @rim = rim
        @tire = tire 
    end

    def diameter
        (rim + (tire * 2))
    end

    def circumference
        diameter * Math::PI
    end
end

@wheel = Wheel.new(26, 1.5)
puts @wheel.circumference
# => 91.106186954104

puts Gear.new(52, 11, @wheel).gear_inches
# => 137.0909090909091

puts Gear.new(52, 11).ratio
# => 4.7272727272727275

# HOORAY! This code isn't perfect, but it is good enough.



