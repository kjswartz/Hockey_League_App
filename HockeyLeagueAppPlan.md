# App Idea: Intramural Hockey League Social Network

## Features (what will it do?)
1. User signup/in/out (facebook/twitter authentication if time)
2. email users signup
3. individual player profile pages (bio/stats)
4. Individual Team pages (schedules/team news)
5. League pages showing teams belonging to league
6. League forums/news for fans/potential players, team stats/standings
7. admin site for CRUD of leages/teams/players

## User Stories
1. Visitors should be able to visit the home page
2. Visitors should be able to visit leagues and see schedules of teams
3. Visitors should be able to browse teams and see players
4. Visitors should be able to signup and create a player profile page
5. Users should be able to request to join teams
6. Users should be able to post in league forums
7. Team owners should be able to add and remove players from roster
8. League owner/admin should be able to add and remove teams.
9. Admin should be able to CRUD leagues
10. Admin should be able to CRUD teams
11. Admin should be able to CRUD users/players
12. Players part of a team should be able to update calendar/post in team forum


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
1. Leagues (has_many teams)
2. Teams (belongs_to league | has_many players through teamplayers)
3. Players (has_many teams through teamplayer)
4. TeamPlayers (references teams/players)
5. Permissions

### Visitors should be able to sign up
#### Review using bcrypt
1. Create a session controller
2. Create a signup route and action
3. Create a signup form
4. Create an action to create the user upon signup
5. Add validations to user model (name, email, password)
6. Add link on home page/nav to sign up
7. incorporate facebook/twitter signup/signin (do at end)

### Users should be able to upload an avatar
#### Review using carrierwave
1. ~~Install carrierwave gem~~
2. ~~Create an uploader~~
3. ~~Setup the initializer~~
4. ~~Setup S3 security~~
5. ~~Setup S3 bucket~~
6. ~~Install fog gem~~
7. ~~Install minimagic gem~~
8. Modify the user form with a file field and cache field
9. Adjust the controller params

### Setup Leagues
1. Create leagues controller
2. links to each league on welcome page
3. Create leagues show page (display each team of the league)
4. Create route for leagues show page
5. Create/seed leagues info
6. Admin is responsible for over seeing Leagues

### Setup teams
1. Create teams controller (create/permissions)
2. Create form for setting up teams
3. teams must belong to a league (dropdown select form for leagues)
4. New teams must be approved by admin
5. Create Team views (Member view / visitor view)
6. visitor view: flat front page with players, schedule, contact info
7. Players should be able to request to join team (link)
8. Team owner's should be able to approve Players/drop players
9. Team membership area should have forum, calendar function, schedule
10. Team owners should be able to set/revoke permissions
11. Setup routes for team views

### Setup Admin
#### Review Active admin
1. setup Active Admin
1. SuperAdmin should be able to CRUD everything
2. publisherAdmin should be able to manipulate stats
3. publisherAdmin should be able to update/edit team names/status
4. setup admin routes

### Setup about page
1. create an about page detailing app and myself
2. about view

## Data / Models
1 Leagues (has_many teams)
- [ ] skill
- [ ] description

2 Teams (belongs_to league | has_many players through teamplayers)
- [ ] name (string)
- [ ] owners (string)??
?????- [ ] active/inactive (boolean) | status (string: active, inactive)
- [ ] references league

3 Players (has_many teams through teamplayer)
- [ ] name (string)
- [ ] email (string)
- [ ] password (string)
- [ ] avatar (string)
????- [ ] Phone number (integer or string)
- [ ] bio (text)
- [ ] team (string)
- [ ] goals (integer)
- [ ] assists (integer)
- [ ] penalties (integer)
- [ ] role (string)
?????- [ ] active/inactive (boolean) | status (string: active, inactive)

4 TeamPlayers (belongs_to team | belongs_to player)
- [ ] references teams
- [ ] references players

5 Permissions (belongs_to player)
- [ ] admin
- [ ] TeamOwner
- [ ] TeamMember
- [ ] registered user
- [ ] guest
- [ ] references players

## Controllers
1 Session
- [ ] signup
- [ ] signin
- [ ] singout

2 League
- [ ] create
- [ ] update
- [ ] destroy
- [ ] show
- [ ] index

3 Team
- [ ] create
- [ ] update/edit
- [ ] destroy
- [ ] show
- [ ] index

4 Player
- [ ] show
- [ ] index
- [ ] create
- [ ] update/edit
- [ ] destroy
- [ ] role

## Technologies/Gems
1. S3
2. Carrierwave / Fog
3. Environment variables
4. Kaminari
5. bcrypt
6. Search engine (browse player names)
7. Active admin
8. OmniAuth (facebook authentication)

### Gems
- [ ] gem 'activeadmin', github: 'activeadmin' (setting up active admin)
- [x] gem 'bcrypt', '~> 3.1.7'
- [x] gem 'faker' (seeding db)
- [x] gem 'fog' (carrierwave/images)
- [ ] gem 'kaminari' (pagination of listing all players if necessary)
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
