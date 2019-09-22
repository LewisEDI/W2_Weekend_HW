class Room

  attr_accessor :name, :playlist, :guests, :capacity

  def initialize(name, playlist, capacity)
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

  def remove_guest(guest)
      add_guest(@guest1)
      add_guest(@guest2)
      p @guests.name
      @guests.find{ |guest| @name == name}
      @guests.delete(guest) if guest == guest[:name]
    end

  # def remove_guest(guest)
  #   @guests.find |guest| guest.name == name
  #   return guest.delete
  end
