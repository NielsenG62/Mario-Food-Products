# _Mario's Food Store_

#### By _**Gabe Nielsen**_

#### _This is an application for a food store, stocked with products that all have reviews._

## Technologies Used

- _Ruby 2.6.10_
- _Rails 5.2.8_
- _SQL_
- _Faker_
- _HTML_
- _CSS / Bootstrap_
- _shoulda-matchers_

## Description

_This is a Ruby on Rails project that stores products and reviews in a database. The user is able to add, update, or delete projects from the database. The database is seeded with 50 products and 250 reviews, distributed randomly across the products. The home page gives a snapshot at the products, showing the most reviewed product, the most recently added, and the products that originate in the USA. A user that is not signed in can only see the homepage. Signed in users can view products and write reviews, while admins can update and delete reviews, and add, update, and delete products._

## Setup/Installation Requirements

- _Clone this repository_
- _Make sure that your Ruby version is 2.6.X, and Rails version is 5.2.X_
- _Navigate to the root directory in the terminal_
- _Run `bundle install` to install the necessary gems_
- _Run `rake db:create db:migrate db:seed`_
- _If you would like to see the test results, run `rspec`_
- _Run `rails s`_
- _In your web browser of choice, enter `localhost:3000`_
- _Create an account. The default state is `admin: false`_

## To turn an account into an admin

- _In the root directory, open the rails console with `rails c`_
- _`User.where(email: "*email_of_desired_admin*").update(admin: true)`_
- _To double check admin status: `User.where(email: "*email_of_desired_admin*").first.admin?`_

## Known Issues

- _top_five scope is not working_

## License

Copyright (c) _2022_ _Gabe Nielsen_
