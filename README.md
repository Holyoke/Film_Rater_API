# Film Rater API Project
![](https://zippy.gfycat.com/MasculineImpressiveHippopotamus.gif)

This Rails 5 project allows users to retrieve film data and submit film ratings via RESTful JSON points. Please review the `api documentation` at `api/docs` for more detailed information on interacting with the server. It's primary purpose is to demonstrate a user submitting ratings to a film.

The project utilizes a seeded database provided by `films.json`.

To setup and start the server, please fork and change directory into the main directory. Then input:

`$ bundle install`  
`$ rake db:migrate`  
`$ rake db:seed`  
`$ rails server`  

I utilized [`Postman`](https://www.getpostman.com/) for manually testing, but there are `cuRL` examples in the api documentation.

To examine documentation for the endpoints, please run

`$ open doc/api/index.html`  

## Features

The project allows a user to submit scores to rate films in the database. Built with Rails 5's api controller, it follows the `JSON API specification` by utilizing `active model serializers`. There's an `average_rating` for each film as more ratings are entered for a film. Additionally, users can retrieve specific attributes as well, such as only pulling year data or descriptions. Extra consideration was given to the rating datatypes, notably specifying smaller integer datatypes for ratings.

The project utilizes [`rspec api documentation`](https://github.com/zipmark/rspec_api_documentation) to create specs and generate documentation.

### Additional Developer Thoughts
Notably there aren't any `User` models in the app, since the main focus seemed to be on submitting ratings to films. With multiple `users`, I'd setup a association between `User` and `Rating` to expand on the rating feature.

I feel pretty comfortable with the bonus features and given more time, I'd love to implement them with proper documentation and testing. For pagination, I would pursue a gem solution with `kaminari` or `will_paginate`. Filtering and sorting would be implemented and tested through activerecord scopes, but I noticed there are `related_film_ids` in the provided films.json, so I prioritized filtering film attributes instead since it seemed like a quick-win.
