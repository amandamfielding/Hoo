# Hoo

[Hoo Live][live]

[live]: http://www../#/

Hoo is a full-stack recruitment application for short-term event staffing. Administrative users can post job listings, and users can search for short-term gigs. Users can apply for events. It utilizes Ruby on Rails on the backend, a PostgreSQL database, and Vue.js with a Vuex architectural framework on the frontend.

## Features & Implementation

![image of splash](docs/screenshots/hoo-splash.png)

In our implementation of this app, we used VueRouter to handle the route and component changes, as well as the transitions between the routes. Each component is built as a single-file Vue component and given access to the store with the `App` component's `<router-view>` tag. As AJAX requests are made to the backend from the component's methods, the success response dispatches actions to commit mutations on the state.

### Events

  Upon log in, the store saves user data and puts it into `localStorage`. A logged in user has access to the `Events` component, which lists all of the future events posted by admin users (event planners or staffing agencies). The index of `Events` shows the user a short description, location, dates, and estimated pay rate for each event. Upon selecting an `Event`, the user is taken to the `EventShow`

## Future Directions for the Project

In addition to the features already implemented, we plan to continue work on this project.  The next steps for Hoo are outlined below.

### Admin User Functionality

Searching for tracks is a standard feature of Genius. This will search all track titles that contain the input string.

### Playing Songs on Track Show

Although this is less essential functionality, I also plan to implement the ability to listen to the music while on the track show page.  To do this, I plan to use the react-player gem.
