class Guest

  attr_reader :name, :wallet, :songs

  def initialize(name, wallet, songs)
    @name = name
    @wallet= wallet
    @songs = songs
  end

end
