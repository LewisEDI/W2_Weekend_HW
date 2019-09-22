require("minitest/autorun")
require('minitest/rg')
require_relative("../rooms")
require_relative("../guests")
require_relative("../songs")
require('pry-byebug')

class RoomTest < MiniTest::Test

  def setup
    @song1 = Song.new("Scorpians", "Wind of change")
    @song2 = Song.new("Billy Idol", "White wedding")


    @kyoto_room = Room.new("Kyoto Room", [@song1, @song2], [], 10)
    @tokyo_room = Room.new("Tokyo Room", [], [], 10)
    @osaka_room = Room.new("Osaka Room", [@song1, @song2], [], 2)

    @guest1 = Guest.new("Lewis", 50.00, [@song1])
    @guest2 = Guest.new("Ryan", 50.00, [@song2, @song1])
    @guest3 = Guest.new("Sketcher", 0, [])


  end

  def test_room_has_name

    assert_equal("Kyoto Room", @kyoto_room.name())
  end

  def test_room_is_occupied2
    @kyoto_room.add_guest(@guest1)
    assert_equal(1, @kyoto_room.check_room())
  end

  def test_can_add_guest_to_room()
    @tokyo_room.add_guest(@guest1)
    assert_equal(1, @tokyo_room.check_room())
  end

  def test_no_cash()
    @tokyo_room.add_guest(@guest3)
    expected = "go sing in the street"
    assert_equal("go sing in the street", expected)
  end

  def test_check_room_for_guest
    @kyoto_room.add_guest(@guest1)
    @kyoto_room.room_check(@guest1)
    result = @kyoto_room.room_check(@guest1)
    assert_equal(true, result)
  end

  def test_can_add_song_to_room()
    @tokyo_room.add_song(@song1)
    assert_equal(1, @tokyo_room.check_playlist())
  end

  def test_room_is_full()
    @osaka_room.add_guest(@guest1)
    @osaka_room.add_guest(@guest2)
    @osaka_room.check_room_has_space
    assert_equal("room is full!", @osaka_room.check_room_has_space())
  end

  def test_room_has_space()
    @osaka_room.add_guest(@guest1)
    @osaka_room.check_room_has_space
    assert_equal("room has space", @osaka_room.check_room_has_space())
  end

  def test_can_remove_guest_from_room()
    @osaka_room.add_guest(@guest1)
    @osaka_room.add_guest(@guest2)
    @osaka_room.remove_guest(@guest2)
    assert_equal(1, @osaka_room.check_room())
  end


end
