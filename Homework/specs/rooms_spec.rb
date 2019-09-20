require("minitest/autorun")
require('minitest/rg')
require_relative("../room")
require_relative("../guest")
require_relative("../songs")
require('pry-byebug')

class RoomTest < MiniTest::Test

  def setup
    @song1 = Song.new("Scorpians", "Wind of change")
    @song2 = Song.new("Billy Idol", "White wedding")


    @kyoto_room = Room.new("Kyoto Room", [@song1, @song2], [@guest1], 10)
    @tokyo_room = Room.new("Tokyo Room", [], [], 10)
    @osaka_room = Room.new("Osaka Room", [@song1, @song2], [@guest1, @guest2], 2)

    @guest1 = Guest.new("Lewis", 50.00, [@song1])
    @guest2 = Guest.new("Ryan", 50.00, [@song2, @song1])
  end

  def test_room_has_name
    assert_equal("Kyoto Room", @kyoto_room.name())
  end

  def test_room_has_songs
    assert(@kyoto_room.playlist() >= 1)
  end

  def test_room_is_occupied
    assert(@kyoto_room.guests() >=1)
  end

  def test_get_room_guest_names
    asset_equal("Lewis", @kyoto_room.get_guest_names())


  def test_room_is_empty
    assert_equal(0, @kyoto_room.guests())
  end

  def test_can_add_guest_to_room
    asset_equal(1, @osaka_room.get_length())
  end

  def test_room_is_full
    assert_equal("room is full!", @kyoto_room.guests())
  end
  def test_cant_add_to_full_room
    asset_equal("room is full!", @osaka_room.capacity_check())
  end

  def test_can_remove_guest_from_room
    asset_equal(0, @kyoto_room.get_length())
  end


end
