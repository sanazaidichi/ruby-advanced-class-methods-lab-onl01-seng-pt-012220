class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create 
    song = self.new.save
  end 

def self.new_by_name(name) 
  song = self.new 
  song.name = name 
  song 
 end 

def self.create_by_name(name)
  song = Song.new_by_name(name).save
end 
  
def self.find_by_name(name)
self.all.find{|song| song.name ==name}
end 

def self.find_or_create_by_name(name)
  self.find_by_name(name) or self.create_by_name(name)
end   

def self.alphabetical 
  @@all.sort_by{|name| name.name} 
end   

def self.new_from_filename(filename)
#returb a sobg that has a name and artist_name from inside of the filename
  info = filename.split(" - ")

song = self.new 
song.name = info[1].chomp(".mp3")
song.artist_name = info[0]
song 
end 

def self.create_from_filename(filename)
self.new_from_filename(filename).save
  #info = filename.split(" - ")

#song = self.create 
#song.name = info[1].chomp(".mp3")
#song.artist_name = info[0]
#song 
end 

def self.destroy_all
  @@all.clear 
end 

def save
  self.class.all << self
  self
end

end
