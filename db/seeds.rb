# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

title = [
  'Midnight Cowboy',
  'Toy Joy',
  'The Cathedral of Junk',
  'Graffiti Park at Castle',
  'Hippie Hollow',
  'The Cloak Room',
  'Bat Watching at the Congress Avenue Bridge',
  'Weird Wednesdays at Alamo Ritz',
  'Austin Panic Room',
  'Barbarella'
]

address = [
  '313 E 6th St, Austin, Tx 78701',
  '403 W 2nd St, Austin, Tx 78701',
  '4422 Lareina Dr, Austin, Tx 78745',
  '1008 Baylor St, Austin, Tx 78703',
  '7000 Comanche Trail, Austin, Tx 78732',
  '1300 Colorado St, Austin, Tx 78701',
  '305 Congress Ave, Austin, Tx 78701',
  '320 E 6th St, Austin, Tx 78701',
  '1205 Rio Grande St, Austin, Tx 78701',
  '615 Red River St, Austin, Tx 78701'
]

users = %w(
  Rob,
  Shannon,
  Dane,
  Gabe,
  Matt,
  Princess_Haley,
  Ahkeem,
  user,
  Justin,
  Jess
)

imgurl = [
  'http://drinks.seriouseats.com/images/2012/08/20120809-218035-midnight-cowboy-austin-steven-robbins.jpg',
  'http://whitehotphotoblog.com/wp-content/uploads/2010/09/toy_joy_03_white_hot_phoenix.jpg',
  'http://eecue.com/i/Cathedral-of-Junk-Doorway-eecue_31407_hbwe_l.jpg',
  'http://365thingsaustin.com/wp-content/uploads/2012/04/photo-158.jpg',
  'http://media6.trover.com/T/545197acd809d86342000211/fixedw_large_4x.jpg',
  'http://www.transcend-me.com/wp-content/uploads/2013/04/IMG_1933.jpg',
  'https://res-1.cloudinary.com/simpleview/image/fetch/f_auto,q_90/http://Austin.simpleviewcrm.com/images/listings/original_Bat-Bridge-Credit-Austin-CVB.jpg',
  'https://c2.staticflickr.com/8/7054/6844361590_b186af08ab_b.jpg',
  'https://media-cdn.tripadvisor.com/media/photo-s/07/0d/e3/04/austin-panic-room.jpg',
  'http://c0056906.cdn2.cloudfiles.rackspacecloud.com/633293.jpg'
]

10.times do |i|
  Place.create!(title: title[i], address: address[i], imgurl: imgurl[i])
end

users.each do |name|
  User.create!(name: name, username: Faker::App.name.gsub(' ', ''), email: "#{name}@example.com", password: 'password')
end
