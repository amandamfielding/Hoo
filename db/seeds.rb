mandy = User.create!(username:"AMF",password:"password",fname:"Mandy",lname:"Fielding",gender:"female",dob:DateTime.new(1987, 3, 10),email:"amandamfielding@gmail.com",phone_number:"209-614-5459",tips_cert:true, no_vis_tats:true, valid_dl:true, admin:true, no_felonies:true, company_id: 1,
image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_400,w_400/v1480576832/demo_profile_pic_l6t2lm.jpg", resume_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/v1481433604/amanda_fielding_-_Google_Docs_j61182.pdf", about_me:"Software Engineer looking for a job!")

lindsey = User.create!(username:"lew",password:"123456",fname:"Lindsey",lname:"Whitley",gender:"female",dob:DateTime.new(1992, 12, 5),email:"lewhitley@gmail.com",phone_number:"714-343-0605", valid_dl:true, admin:true, no_vis_tats:true, no_felonies:true, company_id: 2,
image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_400,w_400/v1481307753/lindsey_mctsqn.jpg", resume_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/v1481434940/resume_12-10-16_qaqs8m.pdf",
about_me:"I am a Software Engineer looking for a job! I deliver excellent results, on-time, without pain or panic. When it comes to writing code, I can be expected to tackle problems with determination, learn new languages, contribute my perspective, and be a committed member of the team.")

Company.create!(name:"Cerda Productions",description:"event staffing", website_url:"http://cerdaproductions.com/")
Company.create!(name:"Dream a Little Dream Events",description:"event planning", website_url: "http://www.dreamalittledreamevents.com/")


event1 = Event.create!(admin_id:1,title:"Coachella",lat:33.72, lng:-116.21, city: "Indio", state: "CA", event_type: "concert", description: "This festival is attended by half a million people every year and is held at the Empire Polo Club in Indio, California. This year's lineup includes Guns N' Roses, LCD Soundsystem, Calvin Harris, Ice Cube, Sufjan Stevens, and so many more.", pay: 400, pay_freq: "day",start_date:DateTime.new(2017, 4, 14),
end_date:DateTime.new(2017, 4, 16), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1480580675/Coachella-2013-Live-Stream-Channel-1_fx3wrg.jpg")

event2 = Event.create!(admin_id:1,title:"Outside Lands",lat:37.76,lng:-122.48,city:"San Francisco",state:"CA",description:"Come along and live outside with Ranger Dave. San Francisco’s Golden Gate Park transforms into an otherworldly celebration of music, food, wine, beer, art and comedy. Last year's lineup included Radiohead, Sufjan Stevens, Chance the Rapper, Lionel Ricthie, Lana Del Rey, J. Cole, and many more.",pay:300,pay_freq:"day",
start_date:DateTime.new(2017, 8, 11),end_date:DateTime.new(2017, 8, 13),image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1480464979/2014-08-05-vintagewoodenwindmillsatOutsideLandsJeffKravitzFilmMagic_wsfnau.jpg")

event3 = Event.create!(admin_id:2,title:"Gusto Banquet",lat:38.2085, lng:-122.4518, city: "Sonoma", state: "CA", event_type: "banquet", description: "Start-up's end of the year celebration. 3 bartenders needed to pour wine and beer. Hours are 5pm to 10pm.", pay: 15, pay_freq: "hour",
start_date:DateTime.new(2016, 12, 20), end_date:DateTime.new(2016, 12, 20),image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600/v1480797041/750_ago6k0.jpg")

event4 = Event.create!(admin_id:2,title:"Adam and Steve's Wedding",lat:37.7793, lng:-122.4188, city: "San Francisco", state: "CA", event_type: "wedding", description: "A beautiful wedding in City Hall. We need 2 bartenders and 2 servers to pour wine and serve 5 course meal for a wedding in wine country. Big potential for tips. Hours needed are from 6pm to 11pm.", pay: 17, pay_freq: "hour",
start_date:DateTime.new(2017, 1, 1), end_date:DateTime.new(2017, 1, 1),image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1480797190/p21_oc3lm9.jpg")

event5 = Event.create!(admin_id:2,title:"SalesForce Holiday Party",lat:37.79, lng:-122.39, city: "San Francisco", state: "CA", event_type: "company party", description: "We need 10 bartenders and 7 servers to pour drinks and pass out appetizers for a private party. Awesome location and venue; good potential for tips. Hours needed are from 6pm to 11pm.", pay: 18, pay_freq: "hour",
start_date:DateTime.new(2016, 12, 16), end_date:DateTime.new(2016, 12, 16),image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1480798020/e19448image3_mg6iua.jpg")

event6 = Event.create!(admin_id:2,title:"Cooney Wedding",lat: 34.2172, lng:- 119.0180, city: "Camarillo", state: "CA", event_type: "wedding", description: "The reception will take place in a barn, so being able to carry and unload ice and supplies is required. Need 6 servers and 3 bartenders to help set plates, serve dinner, and pour drinks. Hours are 4pm to 10pm.", pay: 14, pay_freq: "hour",
start_date:DateTime.new(2017, 1, 14), end_date:DateTime.new(2017, 1, 14),image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1480797495/original_mb3jmk.jpg")

event7 = Event.create!(admin_id:2,title:"Graduation Party",lat:37.87, lng:-122.27, city: "Berkeley", state: "CA", event_type: "private party", description: "We need 1 bartender and 1 server to pour wine and beer and serve dinner for a graduation party. Hours needed are from 2pm to 5pm.", pay: 18, pay_freq: "hour",
start_date:DateTime.new(2016, 12, 31), end_date:DateTime.new(2016, 12, 31),image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1480798020/e19448image3_mg6iua.jpg")

event8 = Event.create!(admin_id:2,title:"Heather and John's Wedding",lat:38.5021, lng:-122.4643, city: "Saint Helena", state: "CA", event_type: "wedding", description: "We need 3 bartenders and 6 servers to pour drinks and pass out appetizers for a wedding. Awesome location and venue; good potential for tips. Hours needed are from 6pm to 11pm.", pay: 15, pay_freq: "hour",
start_date:DateTime.new(2016, 12, 24), end_date:DateTime.new(2016, 12, 24),image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600/v1480797388/napa_wedding_reception_002_uwfcqn.jpg")

event9 = Event.create!(admin_id:2,title:"Graham and Isla's Wedding",lat:37.8143, lng:-122.2672, city: "Oakland", state: "CA", event_type: "wedding", description: "This venue is a beautiul old house. The 6 servers will need to help with protecting the house, in addition to serving a four course dinner for a wedding. Hours needed are from 6pm to 11pm.", pay: 13, pay_freq: "hour",
start_date:DateTime.new(2016, 12, 27), end_date:DateTime.new(2016, 12, 27),image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1480799677/Preservation-Park-Wedding-Oakland-CA-11-main_lbwhf8.jpg")

event10 = Event.create!(admin_id:2,title:"Jefferson Wedding",lat:36.6002, lng:-121.8947, city: "Monterey", state: "CA", event_type: "wedding", description: "We need 2 bartenders and 3 servers to pour drinks and serve a four course dinner for a wedding. Hours needed are from 6:45pm to 11pm.", pay: 16, pay_freq: "hour",
start_date:DateTime.new(2016, 12, 27), end_date:DateTime.new(2016, 12, 27),image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481220536/Memory-Garden-2-680x430_degkqg.jpg")

event11 = Event.create!(admin_id:2,title:"NYE Party",lat:37.7553, lng:-122.4194, city: "San Francisco", state: "CA", event_type: "private party", description: "We need 2 bartenders and 3 servers to pass out hors d'oeuvres and champagne for a private roof top party NYE. Awesome view and the bay bridge and fireworks. Hours needed are from 7pm to 2am.", pay: 40, pay_freq: "hour",
start_date:DateTime.new(2016, 12, 27), end_date:DateTime.new(2016, 12, 27),image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1480799035/San_2BFrancisco_2BNew_2BYears_2BEve_2B_2BFireworks_2B2016_jd2kco.jpg")

event11 = Event.create!(admin_id:2,title:"Watson Wedding",lat:37.8087, lng:-122.4098, city: "San Francisco", state: "CA", event_type: "wedding", description: "Need 2 bartenders and 4 servers to pour drinks and serve dinner for a wedding. Hours are from 6pm to 11pm.", pay: 16, pay_freq: "hour",
start_date:DateTime.new(2016, 12, 27), end_date:DateTime.new(2016, 12, 27),image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1480799566/Sheraton-Lakeside-Chalet-Wedding-St.-Louis-MO-1_main.1445337032_lw1u9t.jpg")

event12 = Event.create!(admin_id:2,title:"Frederick Wedding",lat:37.8087, lng:-122.4098, city: "San Francisco", state: "CA", event_type: "wedding", description: "We need 5 bartenders and 6 servers to serve a four course dinner for a wedding. Hours are from 3pm to 9pm.", pay: 13, pay_freq: "hour",
start_date:DateTime.new(2016, 12, 31), end_date:DateTime.new(2016, 12, 31), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481220687/Wedding-Reception_akte4w.jpg")

event13 = Event.create!(admin_id:2,title:"Janine and Christian's Wedding",lat:37.8718, lng:-122.2558, city: "Berkeley", state: "CA", event_type: "wedding", description: "We need 2 bartenders and 4 servers to pour drinks and serve formal dinner for a wedding. Hours needed are from 1pm to 5pm.", pay: 15, pay_freq: "hour",
start_date:DateTime.new(2016, 12, 26), end_date:DateTime.new(2016, 12, 26), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481220822/FacultyClub1_1_augynd.jpg")

event14 = Event.create!(admin_id:2,title:"Peabody Wedding",lat:37.7694, lng:-122.4862, city: "San Francisco", state: "CA", event_type: "wedding", description: "We need 3 bartenders and 4 servers to pour drinks and serve dinner for a wedding. Hours are from 4pm to 10pm.", pay: 400, pay_freq: "event",
start_date:DateTime.new(2016, 12, 31), end_date:DateTime.new(2016, 12, 31), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481220772/san-francisco-wedding-photographer-007.0.0_dzclrr.jpg")

event15 = Event.create!(admin_id:2,title:"Linda and Terry's Wedding",lat:37.7845, lng:-122.5008, city: "San Francisco", state: "CA", event_type: "wedding", description: "We need 2 bartenders and 4 servers to pour drinks and serve formal four-course dinner for a wedding. Goregous venue, potential for networking, great tips. Hours needed are from 6pm to 11pm.", pay: 400, pay_freq: "event",
start_date:DateTime.new(2017, 1, 7), end_date:DateTime.new(2017, 1, 7), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481221299/san-francisco-wedding-designer-rotunda-san-francisco-city-hall_ssgkih.jpg")

event16 = Event.create!(admin_id:2,title:"Joe and Elaine's Wedding",lat:38.4932, lng:-122.7238, city: "Santa Rosa", state: "CA", event_type: "wedding", description: "Need 5 bartenders and 6 servers to pour drinks and serve dinner for a wedding. Hours needed are from 6:30pm to 11pm.", pay: 400, pay_freq: "event",
start_date:DateTime.new(2017, 1, 7), end_date:DateTime.new(2017, 1, 7), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481221658/3b7865d74be38ef268e7c15276b0402f_huwzgn.jpg")

event17 = Event.create!(admin_id:2,title:"DAR Luncheon",lat:34.0015, lng:-118.4834, city: "Santa Monica", state: "CA", event_type: "private party", description: "Need 3 servers to help with the formal table setup and to serve tea and luncheon. Hours are from 11:30am to 2pm.", pay: 170, pay_freq: "event",
start_date:DateTime.new(2017, 2, 3), end_date:DateTime.new(2017, 2, 3), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481222205/camerons-seafood-restaurant-pasadena-ca_idif9o.jpg")

event18 = Event.create!(admin_id:2,title:"CalTech Pie Day Party",lat:34.1662, lng:-118.1328, city: "Pasadena", state: "CA", event_type: "private party", description: "For this mathematical celebration, we need 6 servers to slice and serve pie and pour beer and wine. Hours are from 10pm to 2am.", pay: 14, pay_freq: "hour",
start_date:DateTime.new(2017, 3, 14), end_date:DateTime.new(2017, 3, 14), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481222238/magnolia-house.lounge.retouched-small_tujft5.jpg")

event19 = Event.create!(admin_id:1,title:"Private House Party",lat:34.1002, lng:-118.4595, city: "Los Angeles", state: "CA", event_type: "private party", description: "The venue is deep in the hills, so need a valid driver's license to get there. We need 6 bartenders to make drinks and 2 servers to handle food. Hours needed are from 9pm to 3am.", pay: 13, pay_freq: "hour",
start_date:DateTime.new(2017, 2, 3), end_date:DateTime.new(2017, 2, 3), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481222070/e21561PatioNight_f0efpu.jpg")

event20 = Event.create!(admin_id:1,title:"Launch Party",lat:34.0259, lng:-118.7798, city: "Malibu", state: "CA", event_type: "private party", description: "This venue is in a gorgeous location and a beautiul old house. Aside from pouring drinks and serving food, we need the service staff to help with protecting the house. Hours are from 6pm to 10pm.", pay: 400, pay_freq: "event",
start_date:DateTime.new(2017, 2, 3), end_date:DateTime.new(2017, 2, 3), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481222624/party-decor-archives-ov-home-private-house-reception-decoration-on-budget_home-reception-decoration_home-decor_home-decorators-coupon-pinterest-diy-decor-gothic-shabby-chic-nicole-miller-and-fall-depo_d5gw6g.jpg")

event21 = Event.create!(admin_id:1,title:"Huntzberger Birthday Party",lat:38.4935, lng:-122.4061, city: "Rutherford", state: "CA", event_type: "private party", description: "For this party, we need the 4 bartenders to be very witty and willing to participate in the party (minus the drinking). Hours are from 10pm to 4am.", pay: 400, pay_freq: "event",
start_date:DateTime.new(2017, 2, 16), end_date:DateTime.new(2017, 2, 16), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481221757/3c5355018bb98ba0979b1cf604b67c66_ohh9dd.jpg")

event22 = Event.create!(admin_id:1,title:"Bottlerock",lat:38.299229, lng:-122.278013, city: "Napa", state: "CA", event_type: "concert", description: "When you put on a music festival smack dab in the middle of the legendary Napa Valley, you better be prepared to “bring it” with your wine offerings (and your bartenders). Previous experience with wine tasting is preferred. We will need a large team of enthusiastic people.", pay: 300, pay_freq: "day",
start_date:DateTime.new(2017, 5, 25), end_date:DateTime.new(2017, 5, 28), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481222444/BottleRock-Main-Stage_1-small907pic_ks4x4k.jpg")

event23 = Event.create!(admin_id:2,title:"Alumni Basketball Party",lat:37.8697, lng:-122.2611, city: "Berkeley", state: "CA", event_type: "private party", description: "If you're a fan of Cal Athletics, this is the job for you! We need 4 bartenders and 2 server to work one of the Young Alumni Events.", pay: 16, pay_freq: "hour",
start_date:DateTime.new(2017, 2, 19), end_date:DateTime.new(2017, 2, 19), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481221914/BMES_1_gybqa6.jpg")

event24 = Event.create!(admin_id:1,title:"Desert Trip First Weekend",lat:33.72, lng:-116.21, city: "Indio", state: "CA", event_type: "concert", description: "We are looking for the most fun and responsible people we can find. The festival is held at the Empire Polo Club in Indio, California. Last year's line up included The Rolling Stones, Bob Dylan, Paul McCartney, and The Who.", pay: 250, pay_freq: "day",
start_date:DateTime.new(2017,10,7), end_date:DateTime.new(2017,10,9), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481223351/gettyimages-469447954_g4lze0.jpg")

event25 = Event.create!(admin_id:1,title:"Desert Trip Second Weekend",lat:33.72, lng:-116.21, city: "Indio", state: "CA", event_type: "concert", description: "We are looking for the most fun and responsible people we can find. The festival is held at the Empire Polo Club in Indio, California. Last year's line up included The Rolling Stones, Bob Dylan, Paul McCartney, and The Who.", pay: 200, pay_freq: "day",
start_date:DateTime.new(2017,10,14), end_date:DateTime.new(2017,10,16), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481223351/gettyimages-469447954_g4lze0.jpg")

event26 = Event.create!(admin_id:1,title:"Stagecoach",lat:33.72, lng:-116.21, city: "Indio", state: "CA", event_type: "concert", description: "Stagecoach is always a good time. The festival is held at the Empire Polo Club in Indio, California. Last year's lineup included Luke Bryan, Eric Church, Carrie Underwood, and so many more.", pay: 220, pay_freq: "day",
start_date:DateTime.new(2017,4,28), end_date:DateTime.new(2017,4,30), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481224744/635977374761126691-160501stagecoach-04_kxl0jg.jpg")

event27 = Event.create!(admin_id:1,title:"NYE Concert",lat:37.7786, lng:-122.3893, city: "San Francisco", state: "CA", event_type: "concert", description: "Fireworks over the Bay, great venue, and great potential for tips. Need 18 bartenders to serve champagne and drinks. Headliner to be announced. Hours are 9pm to 1am.", pay: 20, pay_freq: "hour",
start_date:DateTime.new(2016,12,31), end_date:DateTime.new(2016,12,31), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481225539/Giants_20Enterprises_20-_20Private_20Event_20-_20700x380_hvbvfc.jpg")

event28 = Event.create!(admin_id:1,title:"San Francisco BBQ Festival",lat:37.7786, lng:-122.3893, city: "San Francisco", state: "CA", event_type: "festival", description: " It will be the must attend food event of the year. This year will be bigger, louder, saucier, tastier and even more delicious than before. We need a large team of beer-loving bartenders.", pay: 200, pay_freq: "day",
start_date:DateTime.new(2017,10,14), end_date:DateTime.new(2017,10,15), image_url:"http://res.cloudinary.com/dbsxgncvx/image/upload/c_fill,h_600,w_800/v1481225988/6b124b24455bc90fdcae193415780de3x_bpxaq3.jpg")


requirement1 = Requirement.create!(title:"no visible tattoos")
requirement2 = Requirement.create!(title:"valid driver's license")
requirement3 = Requirement.create!(title:"valid TIPS certification")
requirement4 = Requirement.create!(title:"no felonies")

EventRequirement.create!(event_id:1,requirement_id:3)
EventRequirement.create!(event_id:1,requirement_id:4)
EventRequirement.create!(event_id:2,requirement_id:4)
EventRequirement.create!(event_id:2,requirement_id:3)
EventRequirement.create!(event_id:3,requirement_id:1)
EventRequirement.create!(event_id:3,requirement_id:3)
EventRequirement.create!(event_id:3,requirement_id:2)
EventRequirement.create!(event_id:4,requirement_id:3)
EventRequirement.create!(event_id:4,requirement_id:1)
EventRequirement.create!(event_id:5,requirement_id:3)
EventRequirement.create!(event_id:5,requirement_id:1)
EventRequirement.create!(event_id:6,requirement_id:3)
EventRequirement.create!(event_id:6,requirement_id:1)
EventRequirement.create!(event_id:7,requirement_id:3)
EventRequirement.create!(event_id:7,requirement_id:1)
EventRequirement.create!(event_id:8,requirement_id:3)
EventRequirement.create!(event_id:8,requirement_id:1)
EventRequirement.create!(event_id:9,requirement_id:1)
EventRequirement.create!(event_id:10,requirement_id:3)
EventRequirement.create!(event_id:10,requirement_id:2)
EventRequirement.create!(event_id:10,requirement_id:1)
EventRequirement.create!(event_id:11,requirement_id:3)
EventRequirement.create!(event_id:11,requirement_id:1)
EventRequirement.create!(event_id:12,requirement_id:3)
EventRequirement.create!(event_id:12,requirement_id:1)
EventRequirement.create!(event_id:13,requirement_id:3)
EventRequirement.create!(event_id:13,requirement_id:1)
EventRequirement.create!(event_id:14,requirement_id:3)
EventRequirement.create!(event_id:14,requirement_id:1)
EventRequirement.create!(event_id:15,requirement_id:3)
EventRequirement.create!(event_id:15,requirement_id:1)
EventRequirement.create!(event_id:16,requirement_id:3)
EventRequirement.create!(event_id:16,requirement_id:1)
EventRequirement.create!(event_id:17,requirement_id:1)
EventRequirement.create!(event_id:17,requirement_id:2)
EventRequirement.create!(event_id:17,requirement_id:4)
EventRequirement.create!(event_id:18,requirement_id:3)
EventRequirement.create!(event_id:18,requirement_id:4)
EventRequirement.create!(event_id:19,requirement_id:2)
EventRequirement.create!(event_id:19,requirement_id:3)
EventRequirement.create!(event_id:19,requirement_id:4)
EventRequirement.create!(event_id:20,requirement_id:3)
EventRequirement.create!(event_id:20,requirement_id:4)
EventRequirement.create!(event_id:21,requirement_id:3)
EventRequirement.create!(event_id:22,requirement_id:3)
EventRequirement.create!(event_id:22,requirement_id:4)
EventRequirement.create!(event_id:23,requirement_id:1)
EventRequirement.create!(event_id:23,requirement_id:2)
EventRequirement.create!(event_id:23,requirement_id:3)
EventRequirement.create!(event_id:23,requirement_id:4)
EventRequirement.create!(event_id:24,requirement_id:4)
EventRequirement.create!(event_id:24,requirement_id:3)
EventRequirement.create!(event_id:25,requirement_id:4)
EventRequirement.create!(event_id:25,requirement_id:3)
EventRequirement.create!(event_id:26,requirement_id:3)
EventRequirement.create!(event_id:26,requirement_id:4)
EventRequirement.create!(event_id:27,requirement_id:3)
EventRequirement.create!(event_id:27,requirement_id:4)
EventRequirement.create!(event_id:28,requirement_id:2)
EventRequirement.create!(event_id:28,requirement_id:3)
EventRequirement.create!(event_id:28,requirement_id:4)
