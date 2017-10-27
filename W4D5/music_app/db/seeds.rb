User.destroy_all
Band.destroy_all

# User
fred = User.create!(email: 'fred@metal.com', password: 'password')
daniel = User.create!(email: 'daniel@classical.com', password: 'password')

# Band
little_as = Band.create!(name: 'the little \'a\'s')
big_as = Band.create!(name: 'THE BIG \'A\'s')
