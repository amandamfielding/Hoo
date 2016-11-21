## Component Hierarchy

**AuthFormContainer**
 - AuthForm

**HomeContainer**
 - Header / Footer
 - Splash (IndexRoute)

 **EventsIndexContainer**
 - EventsIndex
  * EventsIndexItem

**ProfileContainer**
 - UserProfile

**EventDetailContainer**
 - EventDetail
 - ApplicationFormContainer
  * ApplicationForm

## Routes

|Path   | Component   |
|-------|-------------|
| "/" | "HomeContainer" |
| "/profile" | "ProfileContainer" |
| "/events" | "EventsIndexContainer" |
| "/events/:eventId" | "EventDetailContainer" |
