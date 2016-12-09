# Hoo

[Hoo Live][live]

[live]: http://www../#/

Hoo is a full-stack recruitment application for short-term event staffing. Administrative users can post job listings, and users can search for short-term gigs. Users can apply for events. It utilizes Ruby on Rails on the backend, a PostgreSQL database, and Vue.js with a Vuex architectural framework on the frontend.

## Features & Implementation

In our implementation of this app, we used VueRouter to handle the route and component changes, as well as the transitions between the routes. Each component is built as a single-file Vue component and given access to the store with the `App` component's `<router-view>` tag. As AJAX requests are made to the backend's REST api from the component's methods, the success response dispatches actions to commit mutations on the state.

### Home

![image of splash](docs/screenshots/hoo-splash.png)

The root route has links to login, signup, or use the demo account as well as information explaining the purpose of the website from both the admin and staff sides. To enhance user interaction, the first panel contains a looped video that helps explain what kind of staffing Hoo is designed to help with. A logged in user may not access this route; they are redirected to `/events`.

### User Login and Signup

For login, a POST request is made to the session controller in Rails, which sends back a `User` object. For signup, a POST request is made to the users controller in Rails, which logs the user in and returns the new user to the frontend.

During signup, the user is able to provide a pdf version of his/her resume and/or a brief summary in "About Me". Additionally, users provide personal information and qualification information. These help the site decide what they may apply to and help admins decide who to hire. Cloudinary's API is utilized to allow new users to upload a profile picture and pdf resume.

The store saves user data and an authentication service puts it into `localStorage` where it is accessible throughout the app. Storing the user in `localStorage` prevents the user from needing to be re-fetched between pages or on refresh.

### Events

A logged in user has access to the `Events` component, which lists all of the future events posted by admin users (event planners or staffing agencies). To get the `Events` index, an AJAX request is made to the backend and a jbuilder view returns  The index of `Events` shows the user the location, dates, and estimated pay rate for each event. We leveraged Vue's straightforward interface to iterate through the array of events with `v-for` inside `<li>` elements.

### EventShow

![image of event-show](docs/screenshots/hoo-event-show.png)

Upon selecting an `Event` from the index, the user is taken to the `EventShow` component which lists all of the information given in creating the event. This component also contains logic to allow a user to toggle their "application" to work the event, if they are eligible (by meeting the requirements for the event).

### Profile

![image of profile](docs/screenshots/hoo-profile.png)

On a user's `Profile`, his/her information is displayed, using the data stored in `localStorage`. The resume is available in a modal to make viewing easier for the recruiter. Check marks provide an easy to understand UI for which requirements the candidate meets.

## Future Directions for the Project

In addition to the features already implemented, we plan to continue work on this project to give users more control and further simplification of work flow. The next steps for Hoo are outlined below.

### Admin User Functionality

Admin users can create or join companies, create/update/destroy events, view event staff requests to deny or accept them, and view user profile pages.

### Staff Management Phase

Once the recruitment side of the app is fully built out, we plan to give admin users more functionality in using Hoo to manage their short-term staff. More data from event staffing agencies will be collected, but some possible features include: tracking staff location within the event, allow users and admins to rate and review each other, and use DocuSign or another API to quickly handle paperwork.
