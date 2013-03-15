# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
secret_code = SecretCode.create(:code=>1)
admin = User.create(email: "admin@grouptable.com", password: "password",:first_name=>"Admin",:secret_code=>"1",:role=>'admin') unless User.find_by_email("admin@grouptable.com").present?
