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

  def add_guest(guest)
    @guests.push(guest)
  end


  def remove_guest(guest)
    hallway = []
    hallway.push(guest)
    @guests.delete(guest)
    p hallway


  end
  # hallway = []
  # add_guest(@guest1)
  # add_guest(@guest2)
  # # @guests.delete(guest)
  #
  #
  # for guest in @queue hallway.push(guest)
  #   if guest == guest
  #   end
  #   p hallway
  #
  #   @queue.clear()
  #   return @queue
  #
  #   # @guests.pop
  #   # p @guests
  # end

  # def remove_guest(guest)
  #   @guests.find |guest| guest.name == name
  #   return guest.delete
end
