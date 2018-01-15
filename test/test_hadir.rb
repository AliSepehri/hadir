require 'spec_helper'
require 'hadir'

class HadirTest < Test::Unit::TestCase
  def test_accessible
    result = PostController.new(controller: 'post', action: 'accessible').accessible
    assert_equal true, result
  end

  def test_inaccessible
    exp = assert_raises ::NotAuthorizedError do
      PostController.new(controller: 'post', action: 'inaccessible').inaccessible
    end
  end

  def test_custom_method
    result = PostController.new(controller: 'post', action: 'custom_method').custom_method
    assert_equal true, result
  end

  def test_custom_message
    exp = assert_raises ::NotAuthorizedError do
      PostController.new(controller: 'post', action: 'custom_message').custom_message
    end

    assert_equal 'You are not allowed to call inaccessible action.', exp.message
  end

  def test_custom_method_and_message
    exp = assert_raises ::NotAuthorizedError do
      PostController.new(controller: 'post', action: 'custom_method_and_message').custom_method_and_message
    end

    assert_equal 'You are not allowed to call inaccessible action.', exp.message
  end
end
