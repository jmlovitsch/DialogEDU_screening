# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

In order to use this API clone the repo down to your local machine. Navigate to the file and run <rails s>.

Once the rails server is running the default address will be http://localhost:3000/.

The available routes are:

GET /articles
GET /articles?search=foo
  should filter article to only those containing string 'foo'
GET /articles/:id
POST /articles
  it should validate presence of title and body
  it should validate that title is at least 10 characters long
PUT /articles
  same as POST
DELETE /articles/:id

GET /comments
GET /comments?article_id=1
  should filter comments by specific article
GET /comments/:id
POST /comments
  it should validate presence of necceary attributes
PUT /comments
DELETE /comments/:id

To sample these request enter your developer tools in chome. Navigate to the console and create a fetch request. There are no required headers.

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
