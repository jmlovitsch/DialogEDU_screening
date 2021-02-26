# README

In order to use this API clone the repo down to your local machine. Navigate to the file and run "rails s".

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


PAGINATION:
To access pagination include ?page="insert number", ?per_page="insert number" with either localhost:3000/comments || localhost:3000/articles

e.g. localhost:3000/comments?page=5&per_page=3 => this will return page five with each page having 3 items( i.e. items 13,14,15)

localhost:3000/articles?page=5&per_page=1&?search=porro => this will return page 5 with one article on each page filtered by the search results "porro".

TESTS:

To run behavior driven development tests execute "rails test" in the command line.
