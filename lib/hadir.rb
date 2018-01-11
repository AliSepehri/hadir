require 'hadir/controller_extension'
require 'hadir/errors'

module Hadir
  ::ActionController::Base.send :include, Hadir::ControllerExtension
end
