require 'hadir/controller_extension'

module Hadir
  class NotAuthorizedError < StandardError; end

  ::ActionController::Base.send :include, Hadir::ControllerExtension
end
