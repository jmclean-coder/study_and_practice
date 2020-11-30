class ObscuringReferences
    attr_reader :data

    def initialize(data)
        @data = data
    end

    def diameters
        #0 is rim, 1 is tire
        data.collect { |cell| 
        cell[0] + (cell[1] * 2)}
    end
    #other methods...
end
#this class expects to be initia.lized with a 2d array of rims and tires in mm
# @data = [[622, 20],[622, 23],[559, 30],[559, 40]]

#This is an anti-pattern because while the class does everything necessary to hide the data from itself
# the data method simply return the array, require each sender of data to to know what piece of data is at what index of the array
# the diameters method knows not only how to calculate the diameters, but also where to find the rim, and tire data
# The diameters method depends on the array's structure, if that were to change at all, the method would need to change

#That is known as a leaky reference, when you have data in an array, it's not long until I have references to that array's structure all over my code.