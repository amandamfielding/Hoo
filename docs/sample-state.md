{
  currentUser: {
    id: 1,
    username: "sara6",
    fname: "Sara",
    lname: "Johnson",
    gender: "Female",
    dob: Sun Feb 01 1996 20:09:38 GMT+0000,
    about_me: "I'm a senior at UCLA studying Communications. Throughout high school I worked weddings as a server with Star Catering.",
    email: "sara.johnson@ucla.edu",
    phone_number: "949-230-4176",
    image_url: "https://example.com",
    resume_url: "https://example.com",
    tips_cert: true,
    vis_tats: false,
    felonies: false,
    valid_dl: false,
    admin: false,
    company
  },
  events: [
    {id: 1,
    title: "Outside Lands",
    lat: 37.7694,
    lng: 122.4862,
    city: "San Francisco",
    state: "CA",
    event_type: "music festival",
    image_url: "https://example.com",
    description: "stuff",
    pay: 15,
    pay_freq: "per hour",
    start_date: Fri Aug 5 2017 15:00:00,
    end_date: Sun Aug 7 2017 22:00:00,
    admin_id: 4,
    requirements: [
      {
        id: 2,
        body: "tips certified"
      }
    ]},
    {id: 2,
    title: "Cooney Wedding",
    lat: 34.2172,
    lng: 119.0180,
    city: "Camarillo",
    state: "CA",
    event_type: "wedding",
    image_url: "https://example.com",
    description: "stuff",
    pay: 15,
    pay_freq: "per hour",
    start_date: Sat Jan 14 2017 15:00:00,
    end_date: Sat Jan 14 2017 22:00:00,
    admin_id: 2,
    requirements: [
      {
        id:3,
        body: "no visible tattoos"
      }
    ]},
    {id: 3,
      title: "Bottlerock",
      lat: 38.2988,
      lng: 122.2788,
      city: "Napa",
      state: "CA",
      event_type: "music festival",
      image_url: "https://example.com",
      description: "stuff",
      pay: 500,
      pay_freq: "per day",
      start_date: Sat May 21 2016 13:00:00,
      end_date: Sun May 22 2016 23:00:00,
      admin_id: 4,
      requirements: [
        {
          id: 2,
          body: "tips certified"
        }
      ]}
  ],
  errors: []
}
