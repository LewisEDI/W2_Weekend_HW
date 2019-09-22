class Room

  attr_accessor :name, :playlist, :guests, :capacity

  def initialize(name, playlist, guests, capacity)
    @name = name
    @playlist = playlist
    @guests = []
    @capacity = capacity
  end

  def check_room
    return @guests.size
  end

  def check_playlist
    return @playlist.size
  end

  def check_room_has_space
    if @guests.size == @capacity
      return "room is full!"
    else
      return "room has space"
    end
  end
  
  def add_guest(guest)
    @guests.push(guest)
  end

  def add_song(song)
    @playlist.push(song)
  end


  def remove_guest(guest)
    hallway = []
    hallway.push(guest)
    @guests.delete(guest)
  end

end
