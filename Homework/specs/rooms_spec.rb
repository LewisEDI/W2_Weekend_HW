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

    # @guests = [@guest1, @guest2]
  end

  def test_room_has_name

    assert_equal("Kyoto Room", @kyoto_room.name())
  end

  def test_room_is_occupied2
    @kyoto_room.add_guest(@guest1)
    assert_equal(1, @kyoto_room.check_room())
  end
  #
  # def test_room_has_songs
  #   assert(@kyoto_room.playlist(1))
  # end
  #
  # def test_room_is_occupied
  #   assert(@kyoto_room.guests() >=1)
  # end
  #
  # def test_get_room_guest_names
  #   asset_equal("Lewis", @kyoto_room.get_guest_names())
  #
  #
  # def test_room_is_empty
  #   assert_equal(0, @kyoto_room.guests())
  # end

  def test_can_add_guest_to_room()
    @tokyo_room.add_guest(@guest1)
    assert_equal(1, @tokyo_room.check_room())
  end

  def test_can_add_song_to_room()
    @tokyo_room.add_song(@song1)
    assert_equal(1, @tokyo_room.check_playlist())
  end

  # def test_room_is_full()
  #   @osaka_room.add_guest(@guest1)
  #   @osaka_room.add_guest(@guest2)
  #   @osaka_room.check_room_has_space
  #   assert_equal("room is full!", @kyoto_room.guests())
  # end

  # def test_cant_add_to_full_room
  #   asset_equal("room is full!", @osaka_room.capacity_check())
  # end

  # def test_bear_can_take_fish_from_river
  #     @bear.take_fish_from_river(@river)
  #     assert_equal(1, @bear.food_count)
  #     assert_equal(2, @river.number_of_fishes)
  #   end
  def test_can_remove_guest_from_room()
    @osaka_room.add_guest(@guest1)
    @osaka_room.add_guest(@guest2)
    @osaka_room.remove_guest(@guest2)
    assert_equal(1, @osaka_room.check_room())
  end


end
