# hadir

[![Build Status](https://travis-ci.org/AliSepehri/hadir.svg?branch=master)](https://travis-ci.org/AliSepehri/hadir)

Hadir provides an authorization system like [Pundit](https://github.com/varvet/pundit). With Hadir you separate policy logics and put them in policy classes based on each controller.

## Installation
All you need is adding `hadir` to your Gemfile:

``` ruby
gem 'hadir'
```

## Getting Started
Hadir is focused on policy classes. You need a policy class for each controller and a method into it for each action (It's possible to use same method for multiple actions).

Assume you have following controller:

``` ruby
class Api::V1::PostsController < ActionController::Base
  def update
    post = Post.find(params[:id])
    authorize post
  end

  private

  def current_user
    # retrieve current-user and return it
  end
end
```

Following policy class will allow updating a post if it is not unpublished:

``` ruby
class Api::V1::PostsPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def update?
    record.published?
  end
end
```

Hadir makes following assumptions about your policy classes:

- Policy class name is the same as resource part of controller with `Policy` suffix.
- Policy class has the same namespace as contoller class.
- The first argument is a user. In your controller, Hadir will call the
  `current_user` method to retrieve what to send into this class. (`null` is acceptable)
- The second argument is an object which you want to check its authorization. It can be any object you want.
- As a default behaviour Hadir maps your action to the method with the same name and question mark (`?`) as a suffix. For example Hadir maps `update` action to `update?` method in your policy class. It is also possible to send your desired method name as second argument of `authorize` method.

## `Hadir` vs `Pundit` - The main differences
In Pundit you create a policy class for each object's class(most of the time a model) and put methods into it for each controller's action, there are some disadvantages:

- You have only one policy class for different API versions or admin APIs(different controllers) for the same model(class). You will have a messy class!
- You are not able to have policy if you don't pass a specific object as argument of `authorize` method.