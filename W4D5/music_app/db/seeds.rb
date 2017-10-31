User.destroy_all
Band.destroy_all
Album.destroy_all

# User
fred = User.create!(email: 'fred@metal.com', password: 'password')
daniel = User.create!(email: 'daniel@classical.com', password: 'password')

# Band
little_as = Band.create!(name: 'the little \'a\'s')
big_as = Band.create!(name: 'THE BIG \'A\'s')

# Album
gonna  = Album.create!(title: 'Gonna be a big A someday!', band: little_as, year: 2017)
