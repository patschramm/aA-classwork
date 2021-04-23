# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.create(username: "kobe")
User.create(username: "jordan")
User.create(username: "erin")
User.create(username: "naruto")

Artwork.create(title: "Lakers", image_url: "https://images2.minutemediacdn.com/image/fetch/c_fill,g_auto,f_auto,h_2133,w_3200/https%3A%2F%2Flakeshowlife.com%2Fwp-content%2Fuploads%2Fgetty-images%2F2016%2F04%2F1171559135.jpeg", artist_id: 1)
Artwork.create(title: "Lakers 2", image_url: "https://static01.nyt.com/images/2020/12/04/sports/04nba-lakers-1/03nba-lakers-1-videoSixteenByNineJumbo1600.jpg", artist_id: 1)

Artwork.create(title: "Lakers", image_url: "https://thumbor.forbes.com/thumbor/1963x1963/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5d6586c068cb0a0008c08f54%2F0x0.jpg%3Ffit%3Dscale", artist_id: 2)

Artwork.create(title: "Attack on Titans", image_url: "https://cdn.mos.cms.futurecdn.net/3NeCJKhyQwDamEZM5hHzrZ-1200-80.jpg", artist_id: 3)

ArtworkShare.create(artwork_id: 1, viewer_id: 1)
ArtworkShare.create(artwork_id: 1, viewer_id: 2)

ArtworkShare.create(artwork_id: 2, viewer_id: 3)
ArtworkShare.create(artwork_id: 4, viewer_id: 3)

Comment.create(artwork_id: 1, user_id: 3, body: "HEY it's me ERIN")
Comment.create(artwork_id: 1, user_id: 2, body: "HEY it's me JORDAN")
Comment.create(artwork_id: 1, user_id: 1, body: "HEY it's me KOBE")
Comment.create(artwork_id: 1, user_id: 3, body: "HEY it's me ERIN AGAIN")