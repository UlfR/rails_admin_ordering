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


Add :position field for target model

```ruby
  $ rails g migration add_position_to_articles position:integer
```

Edit your model and add 'include RailsAdminOrdering'

```ruby
  class Article < ActiveRecord::Base
    include RailsAdminOrdering
  end
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

Finally in config of your model edit "list" section and add

```ruby
  sort_by :position
```

to show your model list in right order
