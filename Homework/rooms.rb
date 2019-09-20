class Room

  attr_reader :name, :playlist, :guests, :capacity

  def initialize(name, playlist, guests, capacity)
    @name = name
    @playlist = playlist
    @guests = []
    @capacity = capacity
  end

  def get_length
    return @guests.size
  end


  def add_guest(guest)
    @guests.push(guest)
  end

end
