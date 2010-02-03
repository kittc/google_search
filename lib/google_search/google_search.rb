class GoogleSearch
  ##
  # :singleton-method:
  # Sets up default options that should be present in every request
  cattr_accessor :default_options
 
  ##
  # :singleton-method: web(options)
  
  ## 
  # :singleton-method: video(options)
  
  ##
  # :singleton-method: blogs(options)

  ##
  # :singleton-method: news(options)

  ##
  # :singleton-method: books(options)

  ##
  # :singleton-method: images(options)

  ##
  # :singleton-method: patent(options)

  def self.method_missing(method, args) # :nodoc:
    raise "Unknown search type '#{method}'" unless self.supported_search_types.include?(method)
    self.query(method, args)
  end

  # Yields the search object for number +pages+ specified.
  # Each page will contain 8 results, +pages+ must be something enumerable
  def self.with_pages(pages)
    pages.each do |page|
      GoogleSearch.with_options :rsz => "large", :start => (page - 1) * 8 do |search|
        yield search
      end
    end
  end

  private
    def self.supported_search_types
      [:web, :local, :video, :blogs, :news, :books, :images, :patent]
    end
      
    def self.query(type, options)
      options = (self.default_options || {}).merge(options)
      options[:v] = "1.0"
      
      query_string = options.collect { |key, value| "#{key}=#{CGI::escape(value.to_s)}" }.join("&")
      uri = "http://ajax.googleapis.com/ajax/services/search/#{type}?#{query_string}"
     
      result = ActiveSupport::JSON.decode(open(uri).read)
      raise GoogleSearchError, "#{result['responseStatus']} - #{result['responseDetails']}" unless result["responseStatus"] == 200
      result
    end
end
