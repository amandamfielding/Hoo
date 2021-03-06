# API Endpoints

## HTML API

### Root

- `GET /` - loads React web app

## JSON API

### Users

- `GET /api/users/:id`
- `POST /api/users`

### Session

- `POST /api/session`
- `DELETE /api/session`
- `GET /api/session`

### Events

- `GET /api/events`
  - index of all events
- `GET /api/events/:id`
  - event information
- `POST /api/events`
  - only for admins
- `PATCH /api/events/:id`
  - only for admins
- `DELETE /api/events/:id`
  - only for admins

### Companies

- `POST /api/companies`
- `GET /api/companies/:id`
- `PATCH /api/companies/:id`
- `DELETE /api/companies/:id`

### Requirements

- `POST /api/requirements`
- `DELETE /api/requirements`
- `GET /api/requirements`

### Requests

- `POST /api/requests`
- `DELETE /api/requests`
- `GET /api/requests`
