rails_admin_ordering
====================

Ordering plugin for rails_admin.

Installation
====================

Add into your Gemfile

```ruby
  gem 'rails_admin_ordering', :git => 'git://github.com/netcook/rails_admin_ordering.git'
```

run from console
```ruby
  rails g rails_admin_ordering:install
```
This should create migration file in your project

Add following line to your model:
```ruby
  class Article < ActiveRecord::Base
    acts_as_ordering
  end
```

Run migration to create all stuff

```ruby
  $ rake db:migrate
```

Edit config/initializers/rails_admin.rb and add orderup and orderdown actions.

```ruby
config.actions do
  # root actions
  dashboard 
  # collection actions 
  index
  new
  bulk_delete
  # member actions
  show
  edit
  delete

  # Set the custom action here
  orderup
  orderdown
end
```

