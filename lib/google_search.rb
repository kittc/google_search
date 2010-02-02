require 'active_support'
require 'open-uri'
require 'addressable/uri'

module GoogleSearch
  @@default_options = {}
  
  def self.default_options(options = {})
    @@default_options = options
  end

  def self.method_missing(method, args)
    raise unless [:web, :local, :video, :blogs, :news, :books, :images, :patent].include?(method)
    self.query(method, args)
  end

  private
    def self.query(type, options)
      uri = Addressable::URI.parse("http://ajax.googleapis.com/ajax/services/search/#{type}")
      options[:v] = "1.0"
      uri.query_values = @@default_options.merge(options)
      ActiveSupport::JSON.decode(open(uri).read)
    end
end
