# Stalker

Stalker is a web application split into two projects:

  - **stalker**: half Ruby on Rails application and half API, it consumes JSON POST requests and displays a list of contacts and data that is tracked from an
  - **example-site**: Ruby on Rails project that has an embedded Javascript library, *tracker.js*, and three pages (*Home*, *Contato*, *Sobre*).

### Here's how it works!

  - the user goes to example-site's Home
  - tracker.js sends a POST request to stalker's API with GUID (which it generates and sets in a cookie or gets it if already defined), url of the page and current date/time
  - stalker receives the JSON and creates a database record in a *trackers* table
  - every time a user acesses some page in the example-site, the process above is done
  - the user can create a Contact from the *Contato* page, filling all the fields in the respective form
  - then, a record in the table *contacts* is created in the stalker's database


### Installation

Stalker was made with ruby 2.5.0, using RVM, MySQL.

Clone the repository

```sh
$ git clone git@github.com:wehmoreira/teste-back-end.git
```

Install dependencies (here, I used RVM with a gemset)

```sh
$ cd teste-back-end
$ gem install bundler
$ cd stalker
$ bundle install
$ cd ../example-site
$ bundle install
```

Create database, tables...

```sh
$ cd ../stalker
$ rake db:create
$ rake db:migrate
```

### Usage

In your Terminal, enter stalker's folder, run `bundle exec rails s`. Then, in another tab, enter example-site's folder and run `bundle exec rails s -p 3001` (I used the 3001 port, but feel free to use any other port avaiable!).

Go to `localhost:3001` in your browser. There, you can navigate through all the pages (*Home*, *Contato*, *Sobre*). All the tracking will be displayed in `localhost:3000`.

### Running tests

All tests made with RSpec
```sh
$ cd stalker/
$ bundle exec rspec spec/ -cfd
$ cd ../example-site/
$ bundle exec rspec spec/ -cfd
```

##### Some notes
  - The Javascript lib makes realtime requests to the API. I didn't knew a lot about js, so most of its code was taken from multiple places that I've found when searching the internet, and adjusted to my needs. Because of that, I couldn't make automated tests for it. I tried to use Webmock to stub all requests made within the example-site, but couldn't make it work with Capybara (apparently they can't be used together without issues. Tried capybara-webmock gem too with no success).
  - Apart from the mentioned above, I made all the testing that I could in both projects.
  - Instead of Visitor A, B, etc., I left the Tracking Report page with the visitor's GUID. When he fills the Contact form and sends it, this GUID is recorded in the *contacts* table, along with name and e-mail. So, GUID is a field that associates a contact with a track (I didn't made the references in the tables, though).
  - example-site uses the same database of stalker, so both have a Contact model, and example-site uses stalker's database.yml.
  - Run both projects locally in the development environment.
