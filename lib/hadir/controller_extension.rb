module Hadir
  module ControllerExtension
    def authorize?(record, query = nil)
      controller_namespace = params[:controller].split('/').inject('') { |a, e| a + '::' + e.classify }

      klass = "#{controller_namespace}Policy".constantize
      policy = klass.new(current_user, record)
      query ||= "#{params[:action]}?"

      unless policy.public_send(query)
        error = NotAuthorizedError.new("not allowed to #{query} this #{record}")

        raise error
      end
      true
    end
  end
end
