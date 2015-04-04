# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

softwareCategory = Category.create!(name: 'Software')
constructionCategory = Category.create!(name: 'Construction')
entertainmentCategory = Category.create!(name: 'Entertainment')

Offer.create!(category: softwareCategory, title: 'Rails developer position', body: "We're looking for mid-level rails developer")
Offer.create!(category: softwareCategory, title: 'Technical writer needed', body: "Great opportunity for technical writer in SF/CA")
Offer.create!(category: softwareCategory, title: 'C++ programmer internships', body: "Growing company looks for newbie C++ proggrammer")


