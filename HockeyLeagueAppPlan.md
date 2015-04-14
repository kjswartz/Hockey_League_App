# App Idea: Intramural Hockey League Social Network

## Features (what will it do?)
1. User signup/in/out (facebook/twitter authentication if time)
2. ~~email users signup~~
3. ~~individual user profile pages (bio/stats)~~
4. ~~Individual Team pages (schedules/team news)~~
5. ~~League pages showing teams belonging to league~~
6. League forums/news for fans/potential users, ~~team stats/standings~~
7. ~~admin site for CRUD of leages/teams/users~~

## User Stories
1. ~~Visitors should be able to visit the home page~~
2. ~~Visitors should be able to browse teams and see users~~
3. ~~Visitors should be able to signup and create a user profile page~~
4. ~~Users should be able to request to join teams~~
5. ~~Team owners should be able to add and remove users from roster~~
6. ~~League owner/admin should be able to add and remove teams.~~
7. ~~Admin should be able to CRUD leagues~~
8. ~~Admin should be able to CRUD teams~~
9. ~~Admin should be able to CRUD users/users~~


## Tasks

### Visitors should be able to visit the home page
1. ~~Setup Rails app~~
2. ~~Configure my root route~~
3. ~~Create my welcome controller and welcome/home page~~
4. ~~Setup GitHub repo~~
5. ~~Setup gitignore list~~
6. ~~Setup initial heroku app and push to it~~
7. ~~add thin gem and production gem to work on heroku.~~
8. ~~Add Procfile~~

### Create all models and migrations
1. ~~Leagues (has_many teams)~~
2. ~~Teams (belongs_to league | has_many users through teamusers)~~
3. ~~Users (has_many teams through teamuser)~~
4. ~~Roster (references teams/users)~~
5. ~~Active Admin~~
6. ~~Seed~~

### Setup Admin
#### Review Active admin
1. ~~setup Active Admin~~
2. ~~Admin should be able to manipulate stats~~
3. ~~Admin should be able to update/edit team names/status~~
4. ~~setup admin routes~~

### Visitors should be able to sign up
#### Review using bcrypt
1. ~~Create a session controller~~
2. ~~Create a signup route and action~~
3. ~~Create a signup form~~
4. ~~Create an action to create the user upon signup~~
5. ~~Add validations to user model (name, email, password)~~
6. ~~Add link on home page/nav to sign up~~
7. ~~add mailer~~
8. incorporate facebook/twitter signup/signin (do at end)

### Users should be able to upload an avatar
#### Review using carrierwave
1. ~~Install carrierwave gem~~
2. ~~Create an uploader~~
3. ~~Setup the initializer~~
4. ~~Setup S3 security~~
5. ~~Setup S3 bucket~~
6. ~~Install fog gem~~
7. ~~Install minimagic gem~~
8. ~~Modify the user form with a file field and cache field~~
9. ~~Adjust the controller params~~

### Setup Leagues
1. ~~Seed leagues through Admin section.~~
2. ~~links to each league on welcome page~~
3. ~~Create leagues show page (display each team of the league)~~
4. ~~Create route for leagues show page~~
5. ~~Admin is responsible for over seeing Leagues~~


### Setup teams
1. ~~Create teams controller (create/permissions)~~
2. ~~Create form for setting up teams~~
3. ~~teams must belong to a league (dropdown select form for leagues)~
4. ~~New teams must be approved by admin~~
5. ~~Create Team views (Member view / visitor view)~~
6. ~~visitor view: flat front page with users, schedule, contact info~~
7. ~~Users should be able to request to join team (link)~~
8. ~~Team owner's should be able to approve Users/drop users~~
9. Team membership area should have forum, ~~calendar function, schedule~~
10. Team owners should be able to set/revoke permissions
11. ~~Setup routes for team views~~

### Additional User functionality
1. ~~add deleted_at datetime to user model~~
2. Users should be able to deacitvate (not delete) their account
http://stackoverflow.com/questions/12740397/how-to-simplify-the-soft-delete-process-with-ruby-on-rails
3. signin with facebook

### Setup about page
1. ~~create an about page detailing app and myself~~
2. ~~about view~~

## Data / Models
1 Leagues (has_many teams)
- [x] skill (string)
- [x] description (string)

2 Teams (belongs_to league | has_many users through roster)
- [x] name (string)
- [x] owners (string)??
- [x] active/inactive (boolean)
- [x] references league

3 Users (has_many teams through roster)
- [x] name (string)
- [x] email (string)
- [x] password_digest (string)
- [x] avatar (string)
- [x] Phone (string)
- [x] bio (text)
- [x] goals (integer)
- [x] assists (integer)
- [x] penalties (integer)
- [x] role (string)
- [x] active/inactive (boolean)

4 Roster (belongs_to team | belongs_to user)
- [x] references teams
- [x] references users


## Controllers
1 Session
- [x] signup
- [x] signin
- [x] singout

2 League
- [x] show
- [x] index

3 Team
- [x] create
- [x] update/edit
- [x] show
- [x] index
- [x] will_attend
- [x] not_attend

4 User
- [x] show
- [x] index
- [x] create
- [x] update/edit

5 Games
- [x] index
- [x] new
- [x] create
- [x] update/edit

6 Events
- [x] create
- [x] update/edit
- [x] destroy

7 Roster (stats)
- [ ] create
- [ ] update/edit

## Technologies/Gems
1. S3
2. Carrierwave / Fog
3. Environment variables
4. bcrypt
5. ~~Search engine (browse user names)~~
6. Active admin
7. Twitter Bootstrap
8. bootstrap_forms
9. Javascript (CoffeeScript)
10. Jquery
11. Postgres


### Gems
- [x] gem 'activeadmin', github: 'activeadmin' (setting up active admin)
- [x] gem 'bootstrap_form'
- [x] gem 'bcrypt', '~> 3.1.7'
- [x] gem 'chosen-rails'
- [x] gem 'faker' (seeding db)
- [x] gem 'fog' (carrierwave/images)
- [x] gem 'jquery-datatables-rails', '~> 3.2.0'
- [x] gem "mini_magick" (carrierwave images)
- [x] gem 'pg' (postgres db)
- [x] gem 'thin' (webserver to work on heroku)
- [x] group :production do (needed to work on heroku)
        gem 'rails_12factor'
      end
- [x] group :development, :test do
        gem 'byebug'
        gem 'web-console', '~> 2.0'
        gem 'spring'
        gem 'dotenv-rails' (environment variables)
        gem 'letter_opener'
        gem 'better_errors'
        gem 'quiet_assets'
      end

## Risks
1. Haven't used facebook/twitter signup
- [ ] https://coderwall.com/p/bsfitw/ruby-on-rails-4-authentication-with-facebook-and-omniauth
2. Haven't set multiple roles before

Create Branches before big changes!

##MISC
1. add eager loading
2. nest team routes under leagues
3. slug some urls
4. create UI for roster stats
5. Set different Admin levels
