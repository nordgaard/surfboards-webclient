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
    surfboard_hash = Unirest.get("#{ENV['DOMAIN']}/surfboards/#{id}.json", headers: {"Accept" => "application/json", "Authorization" => "Token token=#{ENV['API_KEY']}", "X-User-Email" => ENV['USER_EMAIL']}).body
    return Surfboard.new(surfboard_hash)
  end

  def self.all
    surfboard_hashes = Unirest.get("#{ENV['DOMAIN']}/surfboards.json", headers: {"Accept" => "application/json", "Authorization" => "Token token=#{ENV['API_KEY']}", "X-User-Email" => ENV['USER_EMAIL']}).body
    @surfboards = []
    surfboard_hashes.each do |hash|
      @surfboards << Surfboard.new(hash)
    end
    return @surfboards
  end

  def self.create(hash)
   # surfboard = Unirest.post("#{ENV['DOMAIN']}/surfboards.json", headers: {"Accept" => "application/json", "Authorization" => "abc123", "X-User-Email" => "jenordgaard@gmail.com"}), parameters: hash).body
  end

 def destroy
  Unirest.delete("#{ENV['DOMAIN']}/surfboards/#{id}.json", headers: {"Accept" => "application/json","Authorization" => "Token token=#{ENV['API_KEY']}", "X-User-Email" => ENV['USER_EMAIL']}).body
  end
end
