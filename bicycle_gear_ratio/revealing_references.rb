class RevealingReferences
    attr_reader :wheels
    # this class expects to be initialized with a 2d array of rims and tires in mm
    # @wheels = [[622, 20],[622, 23],[559, 30],[559, 40]]
    def initialize(data)
        @wheels = wheelify(data)
    end

    # this method has two responsibilities, Iterating over the wheels and calculating the diameter
    # lets split it up!
    # def diameters
    #     #0 is rim, 1 is tire
    #     wheels.collect { |wheel| 
    #     wheel.rim + (wheel.tire * 2)}
    # end

    # 1. iteratre over the array
    def diameters
        wheels.collect {|wheel| diameter(wheel)}
    end

    # 2. calculate the diameter of one wheel
    def diameter(wheel)
        wheel.rim + (wheel.tire * 2)
    end

    # now everyone can send rim/tire to wheel
    
    # Struct: http://ruby-doc.org/core-2.5.0/classes/Struct.html 
    # a convienient way to bundle a number of attributes together, using accessor methods
 
    Wheel = Struct.new(:rim, :tire)

    #during initilization, the data is sent to wheelify, which return an array of Structs that respond to .rim and .tire
    # The knowledge of the structure of the incoming array is only held by wheelify
    def wheelify(data)
        data.collect {|cell| 
        Wheel.new(cell[0], cell[1])}
    end
end
# This allows me to protect against changes to the structure of the incoming data, 
# instead of a direct reference to an index, we send the message .rim and .tire instead
# this is much more readable, DRY, and tolerant to change
# If I can control the input, then make it into a useful object, otherwise hide the mess, even from myself.