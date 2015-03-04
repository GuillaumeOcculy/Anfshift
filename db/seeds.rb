# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
User.create(name: 'admin test', email: 'admin@admin.com', password: 'qqqqqq', job: 'impact_2', is_admin: true)
User.create(name: 'guillaume west', email: 'guillaume@west.com', password: 'qqqqqq', job: 'impact_2')
User.create(name: 'plop plop', email: 'plop@plop.com', password: 'qqqqqq', job: 'model')

Shift.destroy_all
Shift.create(date: Date.current, time: Time.current, description: 'bla bla bla', user: User.first, job: User.first.job)
Shift.create(date: Date.current, time: Time.current, description: 'plo plo plo', user: User.first, job: User.first.job)
Shift.create(date: Date.current, time: Time.current, description: 'oui oui oui', user: User.last,  job: User.last.job)
