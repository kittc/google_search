$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'google_search'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|
  config.before :all do
    # The open method, used by GoogleSearch, will get cached so we 
    # don't bombard Google each time we do testing. Cache is stored 
    # in tmp/cached_open.
    GoogleSearch.should_receive(:open).any_number_of_times.and_return { |url| cached_open(url) }
  end
end

require 'digest/md5' 
require 'fileutils'

def cached_open(url) 
  dir = "tmp/cached_open" 
  FileUtils::mkdir_p(dir) unless File.exists?(dir)
  
  path = File.join(dir, Digest::MD5.hexdigest(url))
  
  unless File.exists?(path) 
    content = open(url).read
    File.open(path, "w") { |f| f.puts(content) } 
  end
  
  open(path)
end
