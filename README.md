# Hoo

[Hoo Live][live]

[live]: http://www../#/

Hoo is a full-stack recruitment application for short-term event staffing. Administrative users can post job listings, and users can search for short-term gigs. Users can apply for events. It utilizes Ruby on Rails on the backend, a PostgreSQL database, and Vue.js with a Vuex architectural framework on the frontend.

## Features & Implementation

![image of splash](docs/screenshots/hoo-splash.png)

In our implementation of this app, we used VueRouter to handle the route and component changes, as well as the transitions between the routes. Each component is built as a single-file Vue component and given access to the store with the `App` component's `<router-view>` tag. As AJAX requests are made to the backend's REST api from the component's methods, the success response dispatches actions to commit mutations on the state.

### Home

The root route has links to login, signup, or use the demo account as well as information explaining the purpose of the website from both the admin and staff sides. To enhance user interaction, we used the iFrame Player API to embed a video for the first panel.

### User Login and Signup



### Events

Upon log in, the store saves user data and puts it into `localStorage`. A logged in user has access to the `Events` component, which lists all of the future events posted by admin users (event planners or staffing agencies). To get the `Events` index, an AJAX request is made to the backend and a jbuilder view returns  The index of `Events` shows the user the location, dates, and estimated pay rate for each event.

### EventShow

Upon selecting an `Event` from the index, the user is taken to the `EventShow` component which lists all of the information given in creating the event and allows a user to "apply" to the .

### Profile



## Future Directions for the Project

In addition to the features already implemented, we plan to continue work on this project.  The next steps for Hoo are outlined below.

### Admin User Functionality

Admin users can create or join companies, create/update/destroy events, view event staff requests to deny or accept them, and view user profile pages.

### Staff Management Phase

Once the recruitment side of the app is fully built out, we plan to give admin users more functionality in using Hoo to manage their short-term staff. More data from event staffing agencies will be collected, but some possible features include: tracking staff location within the event, allow users and admins to rate and review each other, and use DocuSign or another API to quickly handle paperwork.
