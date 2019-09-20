require("minitest/autorun")
require('minitest/rg')
require_relative("../room")
require_relative("../guest")
require_relative("../songs")
require('pry-byebug')

class GuestTest < MiniTest::Test

  def setup
    @song1 = Song.new("Scorpians", "Wind of change")
    @song2 = Song.new("Billy Idol", "White wedding")


    @kyoto_room = Room.new("Kyoto Room", [@song1, @song2], [@customer1], 10)
    @tokyo_room = Room.new("Tokyo Room", [], [], 10)
    @osaka_room = Room.new("Osaka Room", [@song1, @song2], [@customer1, @customer2], 2)

    @guest1 = Guest.new("Lewis", 50.00, [@song1])
    @guest2 = Guest.new("Ryan", 50.00, [@song2, @song1])
  end

  def test_song_has_artist
    assert_equal("Scorpians", @song1.artist())
  end

  def test_song_has_title
    assert_equal("Lewis", @song1.title())
  end




end
