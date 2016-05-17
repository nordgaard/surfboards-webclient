class Surfboard

  attr_accessor :name, :feet, :inches, :color


  def initialize(hash)
    @name = hash["name"]
    @feet = hash["feet"]
    @inches = hash["inches"]
    @color = hash["color"]
  end

  def full_height
    "#{@feet}' #{@inches}"
  end

  def self.find(id)
    surfboard_hash = Unirest.get("#{ENV['DOMAIN']}/surfboards/#{id}.json").body
    return Surfboard.new(surfboard_hash)
  end

  def self.all
    surfboard_hashes = Unirest.get("#{ENV['DOMAIN']}/surfboards.json").body
    surfboards = []
    surfboard_hashes.each do |hash|
      surfboards << Surfboard.new(hash)
    end
    return surfboards
  end



end
