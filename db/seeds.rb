# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "Example User",
						email: "example@email.com",
						password: "foobar",
						password_confirmation: "foobar",
						activated: true,
						activated_at: Time.zone.now,
						admin: true)

User.create!(name: "Example User2",
						email: "example2@email.com",
						password: "foobar",
						password_confirmation: "foobar",
						activated: true,
						activated_at: Time.zone.now)