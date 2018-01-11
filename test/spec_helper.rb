require 'test/unit'

module ActionController
  class Base
  end
end

class PostController < ::ActionController::Base
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def current_user
    nil
  end

  def accessible
    authorize? nil
  end

  def inaccessible
    authorize? nil
  end
end

class PostPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def accessible?
    true
  end

  def inaccessible?
    false
  end
end
