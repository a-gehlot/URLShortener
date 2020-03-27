# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create!(email: 'andrew.gehlot@gmail.com')
u2 = User.create!(email: 'vijay.gehlot@villanova.edu')
u3 = User.create!(email: 'spencer.christian@uvm.edu')

surl1 = ShortenedUrl.create_shortened_url(u1, 'google.com')
surl2 = ShortenedUrl.create_shortened_url(u2, 'imdb.com')
surl3 = ShortenedUrl.create_shortened_url(u3, 'youtube.com')
surl4 = ShortenedUrl.create_shortened_url(u3, 'plex.tv')


Visit.record_visit!(u1, surl1)
Visit.record_visit!(u1, surl2)
Visit.record_visit!(u1, surl3)

Visit.record_visit!(u2, surl3)
Visit.record_visit!(u2, surl3)
Visit.record_visit!(u2, surl3)

Visit.record_visit!(u3, surl4)

tt1 = TagTopic.create(topic: 'search')
tt2 = TagTopic.create(topic: 'videos')
tt3 = TagTopic.create(topic: 'sports')

Tagging.create(shortened_url: surl1, tag_topic: tt1)
Tagging.create(shortened_url: surl2, tag_topic: tt2)
Tagging.create(shortened_url: surl3, tag_topic: tt2)
Tagging.create(shortened_url: surl4, tag_topic: tt2)