mandy = User.create!(username:"AMF",password:"password",fname:"Mandy",lname:"Fielding",gender:"female",dob:DateTime.new(1987, 3, 10),email:"amandamfielding@gmail.com",phone_number:"209-614-5459",tips_cert:true, no_vis_tats:true, valid_dl:true, admin:true, no_felonies:true, company_id: 1,
image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_400,w_400/v1480576832/demo_profile_pic_l6t2lm.jpg", resume_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/v1480737694/amanda_fielding_2_lesxtc.pdf", about_me:"Software Engineer looking for a job!")

lindsey = User.create!(username:"lew",password:"123456",fname:"Lindsey",lname:"Whitley",gender:"female",dob:DateTime.new(1992, 12, 5),email:"lewhitley@gmail.com",phone_number:"714-343-0605", valid_dl:true, admin:true, no_vis_tats:true, no_felonies:true, company_id: 2)

Company.create!(name:"Cerda Productions",description:"event staffing", website_url:"http://cerdaproductions.com/")
Company.create!(name:"Dream a Little Dream Events",description:"event planning", website_url: "http://www.dreamalittledreamevents.com/")


event1 = Event.create!(admin_id:1,title:"Coachella",lat:33.72, lng:-116.21, city: "Indio", state: "CA", event_type: "concert", description: "This festival is attended by half a million people every year and is held at the Empire Polo Club in Indio, California. This year's lineup includes Guns N' Roses, LCD Soundsystem, Calvin Harris, Ice Cube, Sufjan Stevens, and so many more.", pay: 400, pay_freq: "day",start_date:DateTime.new(2017, 4, 14),
end_date:DateTime.new(2017, 4, 16), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1480580675/Coachella-2013-Live-Stream-Channel-1_fx3wrg.jpg")

event2 = Event.create!(admin_id:1,title:"Outside Lands",lat:37.76,lng:-122.48,city:"San Francisco",state:"CA",description:"concert in the city",pay:300,pay_freq:"day",
start_date:DateTime.new(2016, 12, 27),end_date:DateTime.new(2016, 12, 28),image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1480464979/2014-08-05-vintagewoodenwindmillsatOutsideLandsJeffKravitzFilmMagic_wsfnau.jpg")

event3 = Event.create!(admin_id:2,title:"Gusto Banquet",lat:38.2085, lng:-122.4518, city: "Sonoma", state: "CA", event_type: "banquet", description: "Start-up's end of the year celebration", pay: 15, pay_freq: "hour",
start_date:DateTime.new(2016, 12, 20), end_date:DateTime.new(2016, 12, 20),image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600/v1480797041/750_ago6k0.jpg")

event4 = Event.create!(admin_id:2,title:"Adam and Steve's Wedding",lat:37.7793, lng:-122.4188, city: "San Francisco", state: "CA", event_type: "wedding", description: "A beautiful wedding in City Hall", pay: 17, pay_freq: "hour",
start_date:DateTime.new(2017, 1, 1), end_date:DateTime.new(2017, 1, 1),image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1480797190/p21_oc3lm9.jpg")

event5 = Event.create!(admin_id:2,title:"SalesForce Holiday Party",lat:37.79, lng:-122.39, city: "San Francisco", state: "CA", event_type: "company party", description: "", pay: 18, pay_freq: "hour",
start_date:DateTime.new(2016, 12, 16), end_date:DateTime.new(2016, 12, 16),image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1480798020/e19448image3_mg6iua.jpg")

event6 = Event.create!(admin_id:2,title:"Cooney Wedding",lat: 34.2172, lng:- 119.0180, city: "Camarillo", state: "CA", event_type: "wedding", description: "https://cooneytoons.com", pay: 14, pay_freq: "hour",
start_date:DateTime.new(2017, 1, 14), end_date:DateTime.new(2017, 1, 14),image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1480797495/original_mb3jmk.jpg")

event7 = Event.create!(admin_id:2,title:"Graduation Party",lat:37.87, lng:-122.27, city: "Berkeley", state: "CA", event_type: "private party", description: "", pay: 18, pay_freq: "hour",
start_date:DateTime.new(2016, 12, 31), end_date:DateTime.new(2016, 12, 31),image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1480798020/e19448image3_mg6iua.jpg")

event8 = Event.create!(admin_id:2,title:"Heather and John's Wedding",lat:38.5021, lng:-122.4643, city: "Saint Helena", state: "CA", event_type: "wedding", description: "", pay: 15, pay_freq: "hour",
start_date:DateTime.new(2016, 12, 24), end_date:DateTime.new(2016, 12, 24),image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600/v1480797388/napa_wedding_reception_002_uwfcqn.jpg")

event9 = Event.create!(admin_id:2,title:"Graham and Isla's Wedding",lat:37.8143, lng:-122.2672, city: "Oakland", state: "CA", event_type: "wedding", description: "", pay: 13, pay_freq: "hour",
start_date:DateTime.new(2016, 12, 27), end_date:DateTime.new(2016, 12, 27),image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1480799677/Preservation-Park-Wedding-Oakland-CA-11-main_lbwhf8.jpg")

event10 = Event.create!(admin_id:2,title:"Jefferson Wedding",lat:36.6002, lng:-121.8947, city: "Monterey", state: "CA", event_type: "wedding", description: "", pay: 16, pay_freq: "hour",
start_date:DateTime.new(2016, 12, 27), end_date:DateTime.new(2016, 12, 27),image_url:, image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481220536/Memory-Garden-2-680x430_degkqg.jpg")

event11 = Event.create!(admin_id:2,title:"NYE Party",lat:37.7553, lng:-122.4194, city: "San Francisco", state: "CA", event_type: "private party", description: "We need 5 bartenders and 3 servers to pass out hors d'oeuvres and champagne for a private roof top party NYE. Awesome view and the bay bridge and fireworks. Hours needed are from 7pm to 2am.", pay: 40, pay_freq: "hour",
start_date:DateTime.new(2016, 12, 27), end_date:DateTime.new(2016, 12, 27),image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1480799035/San_2BFrancisco_2BNew_2BYears_2BEve_2B_2BFireworks_2B2016_jd2kco.jpg")

event11 = Event.create!(admin_id:2,title:"Watson Wedding",lat:37.8087, lng:-122.4098, city: "San Francisco", state: "CA", event_type: "wedding", description: "", pay: 16, pay_freq: "hour",
start_date:DateTime.new(2016, 12, 27), end_date:DateTime.new(2016, 12, 27),image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1480799566/Sheraton-Lakeside-Chalet-Wedding-St.-Louis-MO-1_main.1445337032_lw1u9t.jpg")

event12 = Event.create!(admin_id:2,title:"Frederick Wedding",lat:37.8087, lng:-122.4098, city: "San Francisco", state: "CA", event_type: "wedding", description: "", pay: 13, pay_freq: "hour",
start_date:DateTime.new(2016, 12, 31), end_date:DateTime.new(2016, 12, 31), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481220687/Wedding-Reception_akte4w.jpg")

event13 = Event.create!(admin_id:2,title:"Janine and Christian's Wedding",lat:37.8718, lng:-122.2558, city: "Berkeley", state: "CA", event_type: "wedding", description: "", pay: 15, pay_freq: "hour",
start_date:DateTime.new(2016, 12, 26), end_date:DateTime.new(2016, 12, 26), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481220822/FacultyClub1_1_augynd.jpg")

event14 = Event.create!(admin_id:2,title:"Peabody Wedding",lat:37.7694, lng:-122.4862, city: "San Francisco", state: "CA", event_type: "wedding", description: "", pay: 400, pay_freq: "event",
start_date:DateTime.new(2016, 12, 31), end_date:DateTime.new(2016, 12, 31), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481220772/san-francisco-wedding-photographer-007.0.0_dzclrr.jpg")

event15 = Event.create!(admin_id:2,title:"Linda and Terry's Wedding",lat:37.7845, lng:-122.5008, city: "San Francisco", state: "CA", event_type: "wedding", description: "", pay: 400, pay_freq: "event",
start_date:DateTime.new(2017, 1, 7), end_date:DateTime.new(2017, 1, 7), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/v1481221299/san-francisco-wedding-designer-rotunda-san-francisco-city-hall_ssgkih.jpg")

event16 = Event.create!(admin_id:2,title:"Joe and Elaine's Wedding",lat:38.4932, lng:-122.7238, city: "Santa Rosa", state: "CA", event_type: "wedding", description: "", pay: 400, pay_freq: "event",
start_date:DateTime.new(2017, 1, 7), end_date:DateTime.new(2017, 1, 7), image_url:"")

event17 = Event.create!(admin_id:2,title:"DAR Luncheon",lat:, lng:-, city: "Los Angeles", state: "CA", event_type: "private party", description: "", pay: 170, pay_freq: "event",
start_date:DateTime.new(2017, 2, 3), end_date:DateTime.new(2017, 2, 3), image_url:"")

event18 = Event.create!(admin_id:2,title:"CalTech Pie Day Party",lat:, lng:-, city: "Pasadena", state: "CA", event_type: "private party", description: "", pay: 14, pay_freq: "hour",
start_date:DateTime.new(2017, 3, 14), end_date:DateTime.new(2017, 3, 14), image_url:"")

event19 = Event.create!(admin_id:2,title:"",lat:, lng:-, city: "Los Angeles", state: "CA", event_type: "private party", description: "", pay: 13, pay_freq: "hour",
start_date:DateTime.new(2017, 2, 3), end_date:DateTime.new(2017, 2, 3), image_url:"")

event20 = Event.create!(admin_id:2,title:"",lat:, lng:-, city: "Los Angeles", state: "CA", event_type: "private party", description: "", pay: 400, pay_freq: "event",
start_date:DateTime.new(2017, 2, 3), end_date:DateTime.new(2017, 2, 3), image_url:"")

requirement1 = Requirement.create!(title:"no visible tattoos")
requirement2 = Requirement.create!(title:"valid drive's license")
requirement3 = Requirement.create!(title:"valid TIPS certification")
requirement4 = Requirement.create!(title:"no felonies")

EventRequirement.create!(event_id:1,requirement_id:3)
EventRequirement.create!(event_id:1,requirement_id:4)
EventRequirement.create!(event_id:2,requirement_id:3)
EventRequirement.create!(event_id:3,requirement_id:1)
EventRequirement.create!(event_id:3,requirement_id:2)
