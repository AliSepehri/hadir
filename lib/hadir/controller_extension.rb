require 'active_support/inflector'

module Hadir
  module ControllerExtension
    def authorize(record, query = nil, message: nil)
      controller_namespace = params[:controller].split('/').inject('') { |a, e| a + '::' + e.classify }

      klass = "#{controller_namespace}Policy".constantize
      policy = klass.new(current_user, record)
      query ||= "#{params[:action]}?"

      unless policy.public_send(query)
        message ||= "not allowed to #{query} this #{record}"
        error = NotAuthorizedError.new(message)

        raise error
      end
      true
    end
  end
end
