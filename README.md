# Hoo

Collaboration between Amanda Fielding and Lindsey Whitley

[AWS Production Link][aws]

[aws]: lfkfslkjdf

## Minimum Viable Product

Hoo is a recruitment application for event staffing. Administrative users can post job listings, and users can search for short-term gigs. Users can apply for events. This app will be built with a Rails backend (PostgreSQL db) and Vue.js/Vuex frontend.

- [ ] Hosting on AWS
- [ ] New account creation, login, and guest/demo login (as user, not admin)
- [ ] Profile page for users
- [ ] Events index that can be filtered by location (radius) and date
- [ ] Event profile
- [ ] Users can respond to events
- [ ] Production README

## Design Docs
* [View Wireframes][wireframes]
* [React Components][components]
* [API endpoints][api-endpoints]
* [DB schema][schema]
* [Sample State][sample-state]

[wireframes]: docs/wireframes
[components]: docs/component-hierarchy.md
[sample-state]: docs/sample-state.md
[api-endpoints]: docs/api-endpoints.md
[schema]: docs/schema.md

## Implementation Timeline

### Phase 1: Backend setup and Front End User Authentication (1 day)

**Objective:** Functioning rails project with front-end Authentication, use Cloudinary API to allow users to upload pdf resumes and profile pictures.

### Phase 2: Events (2 days)

**Objective:** Users can view EventsIndex and EventDetail

### Phase 3: Search (2 days)

**Objective:** Users can search for events by location and date, use Google Places API.

### Phase 4: Event Application (1 day)

**Objective:** Users can apply to events

### Phase 6: Production README (1/2 day)
