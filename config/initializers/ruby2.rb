# config/initializers/ruby2.rb added per:
# http://blog.lucascaton.com.br/index.php/2014/02/28/have-a-rails-2-app-you-can-run-it-on-the-newest-ruby/

# This is a very important monkey patch to make Rails 2.3.18 to work with Ruby 2.x
# If you're thinking to remove it, really, don't, unless you know what you're doing.
# KTHXBYE

if Rails::VERSION::MAJOR == 2 && RUBY_VERSION >= '2.0.0'
  module ActiveRecord
    module Associations
      class AssociationProxy
        def send(method, *args)
          if proxy_respond_to?(method, true)
            super
          else
            load_target
            @target.send(method, *args)
          end
        end
      end
    end
  end
end

if Rails::VERSION::MAJOR == 2 && RUBY_VERSION >= '2.0.0'
  module I18n
    module Backend
      module Base
        def load_file(filename)
          type = File.extname(filename).tr('.', '').downcase
          # As a fix added second argument as true to respond_to? method
          raise UnknownFileType.new(type, filename) unless respond_to?(:"load_#{type}", true)
          data = send(:"load_#{type}", filename) # TODO raise a meaningful exception if this does not yield a Hash
          data.each { |locale, d| store_translations(locale, d) }
        end
      end
    end
  end
end