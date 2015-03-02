# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(first_name: 'admin', last_name: 'test', email: 'admin@admin.com', password: 'qqqqqq', job: 'impact', is_admin: true)
User.create(first_name: 'guillaume', last_name: 'west', email: 'guillaume@west.com', password: 'qqqqqq', job: 'impact')
User.create(first_name: 'plop', last_name: 'plop', email: 'plop@plop.com', password: 'qqqqqq', job: 'model')

Shift.create(date: Date.current, time: Time.current, description: 'bla bla bla', user: User.first, job: User.first.job)
Shift.create(date: Date.current, time: Time.current, description: 'plo plo plo', user: User.first, job: User.first.job)
Shift.create(date: Date.current, time: Time.current, description: 'oui oui oui', user: User.last,  job: User.last.job)
