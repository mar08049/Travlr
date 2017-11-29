
Progress:
Welcome/Application  O
Login                O
Signup               O
User/:id             O
User creates trip    -  ...Fails when clicking create button.
User/:id shows trips O
User/:id edits trips -  ...Fails when clicking edit button.
User/:id delete trips-
Can add places to tr -
Can edit places      O
Can delete places    O
Can find by year     -
Can see all places   -
Logout               O

O = completed
*Current Problems*
For User/:id/trip/:id/edit, route reads user id correctly in (/users/5) but when selecting a trip, route changes to /users/3/trips/7. why?

Cannot differentiate between @trip's when attempting to "show" or "edit"


*Routes*
sessions_new GET    /sessions/new(.:format)
               root GET    /
             signup GET    /signup(.:format)
                    POST   /signup(.:format)
              login GET    /login(.:format)
                    POST   /login(.:format)
             logout GET    /logout(.:format)
                    POST   /users/:user_id/trips/new(.:format)
                    POST   /users/:user_id/trips/:trip_id/edit(.:format)
   user_trip_places GET    /users/:user_id/trips/:trip_id/places(.:format)
                    POST   /users/:user_id/trips/:trip_id/places(.:format)
new_user_trip_place GET    /users/:user_id/trips/:trip_id/places/new(.:format)
edit_user_trip_place GET    /users/:user_id/trips/:trip_id/places/:id/edit(.:forma
    user_trip_place GET    /users/:user_id/trips/:trip_id/places/:id(.:format)
                    PATCH  /users/:user_id/trips/:trip_id/places/:id(.:format)
                    PUT    /users/:user_id/trips/:trip_id/places/:id(.:format)
                    DELETE /users/:user_id/trips/:trip_id/places/:id(.:format)
         user_trips GET    /users/:user_id/trips(.:format)
                    POST   /users/:user_id/trips(.:format)
      new_user_trip GET    /users/:user_id/trips/new(.:format)
     edit_user_trip GET    /users/:user_id/trips/:id/edit(.:format)
          user_trip GET    /users/:user_id/trips/:id(.:format)
                    PATCH  /users/:user_id/trips/:id(.:format)
                    PUT    /users/:user_id/trips/:id(.:format)
                    DELETE /users/:user_id/trips/:id(.:format)
              users GET    /users(.:format)
                    POST   /users(.:format)
           new_user GET    /users/new(.:format)
          edit_user GET    /users/:id/edit(.:format)
               user GET    /users/:id(.:format)
                    PATCH  /users/:id(.:format)
