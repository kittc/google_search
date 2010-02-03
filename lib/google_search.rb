require 'open-uri'
require 'active_support'
require 'cgi'

class GoogleSearch
  # Sets up default options that should be present in every request
  cattr_accessor :default_options

  def self.method_missing(method, args)
    raise "Unknown search type" unless self.supported_search_types.include?(method)
    self.query(method, args)
  end

  private
    def self.supported_search_types
      [:web, :local, :video, :blogs, :news, :books, :images, :patent]
    end

    def self.query(type, options)
      options = self.default_options.merge(options)
      options[:v] = "1.0"
      
      query_string = options.collect { |key, value| "#{key}=#{CGI::escape(value.to_s)}" }.join("&")
      uri = "http://ajax.googleapis.com/ajax/services/search/#{type}?#{query_string}"
     
      ActiveSupport::JSON.decode(open(uri).read)
    end
end
