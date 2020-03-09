# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

u1=User.create!(username:'john')
u2=User.create!(username:'jess')
u3=User.create!(username:'james')
u4=User.create!(username:'jones')
a1=Artwork.create!(title: 'Mona Lisa', image_url:'google.com', artist_id:u1.id)
a2=Artwork.create!(title: 'Stary Night', image_url:'google1.com', artist_id:u2.id)
a3=Artwork.create!(title: 'The Scream', image_url:'google2.com', artist_id:u3.id)
a4=Artwork.create!(title: 'The Snore', image_url:'google3.com', artist_id:u4.id)
as1=ArtworkShare.create!(artwork_id:a1.id,viewer_id:u1.id)
as1=ArtworkShare.create!(artwork_id:a2.id,viewer_id:u1.id)
as1=ArtworkShare.create!(artwork_id:a3.id,viewer_id:u1.id)
as1=ArtworkShare.create!(artwork_id:a1.id,viewer_id:u2.id)
c1=Comment.create!(user_id: u1.id, artwork_id: a1.id,body:'Love this picture')
c2=Comment.create!(user_id: u2.id, artwork_id: a1.id,body:'I don\'t')

