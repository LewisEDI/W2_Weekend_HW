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


    @KyotoRoom = Room.new("Kyoto Room", [@song1, @song2], [@customer1], 10)
    @TokyoRoom = Room.new("Tokyo Room", [], [], 10)

    @customer1 = Guest.new("Lewis", 50.00, 28, 0)
    @customer2 = Guest.new("Ryan", 50.00, 17, 0)
  end

  def test_room_has_name
    assert_equal("Kyoto Room", @KyotoRoom.name())
  end

  def test_room_has_songs
    assert_equal(>= 1, @KyotoRoom.playlist())
  end

  def test_room_is_occupied
    assert_equal(>= 1, @KyotoRoom.guests())
  end

  def test_room_is_empty
    assert_equal(0, @KyotoRoom.guests())
  end

  def test_room_is_full
    assert_equal(10, @KyotoRoom.guests())
  end

    def test_cant_add_to_full_room

    end






  def test_pub_can_serve_drink
    @pub.add_drink(@drink1)
    @pub.serve(@customer1, @drink1)
    assert_equal(8.00, @customer1.wallet())
    assert_equal(102.00, @pub.till())
    assert_equal(0, @pub.stock_level(@drink1))
  end

  def test_pub_cannot_serve_non_stocked_drink
    @pub.serve(@customer1, @drink3)
    assert_equal(0, @pub.stock_level(@drink3))
    assert_equal(10.00, @customer1.wallet())
    assert_equal(0, @customer1.drunkenness)
    assert_equal(100.00, @pub.till)
  end

  def test_pub_cannot_serve_stock_runs_out
    @pub.add_drink(@drink3)
    @pub.serve(@customer3, @drink3)
    @pub.serve(@customer1, @drink3)
    assert_equal(0, @pub.stock_level(@drink3))
    assert_equal(10.00, @customer1.wallet())
    assert_equal(0, @customer1.drunkenness)
    assert_equal(104.00, @pub.till)
  end

  def test_pub_does_not_serve_too_many_drinks
    @pub.add_drink(@drink1)
    @pub.add_drink(@drink1)
    @pub.serve(@customer1, @drink1)
    assert_equal(1, @pub.stock_level(@drink1))
  end

  def test_pub_restocking
    @pub.add_drink(@drink1)
    @pub.add_drink(@drink1)
    @pub.serve(@customer1, @drink1)
    @pub.add_drink(@drink1)
    assert_equal(2, @pub.stock_level(@drink1))
  end

  def test_pub_has_stock_value
    @pub.add_drink(@drink1)
    assert_equal(2.00, @pub.stock_value())
  end

  def test_can_get_stock_level
    @pub.add_drink(@drink1)
    assert_equal(1, @pub.stock_level(@drink1))
  end

  def test_stock_level_0_if_drink_not_in_stock
    assert_equal(0, @pub.stock_level(@drink3))
  end

  def test_customer_too_young__returns_true
    assert_equal(true, @pub.customer_too_young?(@customer2))
  end

  def test_customer_too_young__returns_false
    assert_equal(false, @pub.customer_too_young?(@customer1))
  end

  def test_customer_too_drunk__returns_false
    assert_equal(false, @pub.customer_too_drunk?(@customer1))
  end

  def test_customer_too_drunk__returns_true
    a_drunk = Customer.new("Alex", 75.00, 64, 50)
    assert_equal(true, @pub.customer_too_drunk?(a_drunk))
  end

  def test_pub_checks_age__serves_over_18
    @pub.add_drink(@drink2)
    @pub.serve(@customer1, @drink2)
    assert_equal(7.00, @customer1.wallet())
    assert_equal(103.00, @pub.till())
  end

  def test_pub_checks_age__doesnt_serve_underage
    @pub.add_drink(@drink2)
    @pub.serve(@customer2, @drink2)
    assert_equal(15.00, @customer2.wallet())
    assert_equal(100.00, @pub.till())
  end

  def test_pub_doesnt_serve_at_or_above_50_drunkenness
    the_chanter = Pub.new("The Chanter", 100.00)
    a_drunk = Customer.new("Alex", 75.00, 64, 50)
    the_chanter.add_drink(@drink2)
    the_chanter.serve(a_drunk, @drink2)
    assert_equal(1, the_chanter.stock_level(@drink2))
    assert_equal(75.00, a_drunk.wallet())
    assert_equal(50, a_drunk.drunkenness())
    assert_equal(100.00, the_chanter.till())
  end

end
