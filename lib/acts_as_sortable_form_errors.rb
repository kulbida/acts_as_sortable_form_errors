module SimpleForm

  class FormBuilder

    def error_messages(options={})
      options[:fields] ||= []

      return super(options) unless options[:fields].size > 0

      object = convert_to_model(objectify_options(options)[:object])
      if object.errors.count > 0
        ordered_error_messages = ::ActiveSupport::OrderedHash.new
        options[:fields].each do |field|
          ordered_error_messages.store(field, object.errors.messages[field])
        end
        object.errors.clear
        object.errors.messages.merge!(ordered_error_messages)

        @template.error_messages_for(object, objectify_options(options))
      else
        ''
      end
    end
  end
end
