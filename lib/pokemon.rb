require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  @@all = []

  def initialize(hp= 60, db)
    @db = db
    @name = name
    @type = type
    @hp = hp
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    pokemon = self.new(hp=60, db)
    pokemon.id = result[0][0]
    pokemon.name = result[0][1]
    pokemon.type = result[0][2]
    pokemon.hp = result[0][3]
    pokemon
  end

  def alter_hp(hp, db)
    Pokemon.find(self.id, db).healthpower = hp
  end

end
