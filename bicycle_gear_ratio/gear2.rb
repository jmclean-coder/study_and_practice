class Gear 
    private  #<--- restricts access from public to private TK?
    attr_reader :chainring, :cog

    public #<--- defines that the code below can be accessed publicly TK?
    def initialize(chainring, cog)
        @chainring = chainring
        @cog = cog
    end
end

class Blinkered
    def cog(gear)
        gear.cog
    end
end

puts Blinkered.new.cog(Gear.new(54, 11))
#=> private method `cog' called for #<Gear:0x00007f9ff7920100 @chainring=54, @cog=11> (NoMethodError)
# att_reader is private, so Blinkered class has no access to the cog instance variable.
