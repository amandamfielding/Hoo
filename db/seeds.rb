# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!(username:"AMF",password:"password",fname:"Mandy",lname:"Fielding",gender:"female",dob:DateTime.new(1987, 3, 10),email:"amandamfielding@gmail.com",phone_number:"209-614-5459",tips_cert:true, vis_tats:true, valid_dl:true, admin:true, company_id: 1)

Company.create!(name:"Cerda Productions",description:"event staffing")

Event.create!(admin_id:1,title:"Outside Lands",lat:0,lng:0,city:"San Francisco",state:"CA",description:"concert in the city",pay:500,pay_freq:"day",start_date:DateTime.new(2016, 12, 27),end_date:DateTime.new(2016, 12, 28))
