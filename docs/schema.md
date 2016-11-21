# Schema Information

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
username        | string    | not null, indexed, unique
fname           | string    | not null
lname           | string    | not null
gender          | string    | not null
dob             | date      | not null
about_me        | text      |
email           | string    | not null, indexed, unique
phone_number    | string    | not null
image_url       | string    |
resume_url      | string    |
tips_cert       | boolean   | not null
vis_tats        | boolean   | not null
felonies        | boolean   | not null
valid_dl        | boolean   | not null
admin           | boolean   | not null
company_id      | boolean   | foreign key (references companies)
password_digest | string    | not null
session_token   | string    | not null, indexed, unique

## events
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
title       | string    | not null
lat         | float     | not null
lng         | float     | not null
city        | string    | not null
state       | string    | not null
event_type  | string    |
image_url   | string    |
description | text      | not null
pay         | integer   | not null
pay_freq    | string    | not null
start_date  | date      | not null
end_date    | date      | not null
admin_id    | integer   | not null, foreign key (references users)

## requirements
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
body        | string    | not null
event_id    | integer   | not null

## companies
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
name        | string    | not null
description | text      | not null
logo_url    | string    | not null
image_url   | string    | not null
website_url | string    | not null
facebook_url| string    | not null
