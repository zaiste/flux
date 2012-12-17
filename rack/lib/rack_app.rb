require 'rack'

class RackApp
  def self.call(env)
    [200, {'Content-Type' => 'text/plain'}, [env.inspect]]
  end
end

class FancyRackApp
  def self.call(env)
    req = Rack::Request.new(env)
    case req.path
    when "/"
      Rack::Response.new("Hello, Zaiste!")
    when /^\/name\/(.*)/
      Rack::Response.new("Hello, #{$1}!")
    else
      Rack::Response.new("Not found", 404)
    end
  end
end



#Rack::Server.start app: RackApp
#Rack::Handler::Thin.run RackApp

=begin
{
    "SERVER_SOFTWARE"=>"thin 1.5.0 codename Knife",
    "SERVER_NAME"=>"localhost",
    "rack.input"=>#<Rack::Lint::InputWrapper:0x007ffdec490218 @input=#<StringIO:0x007ffdec4ccc18>>,
    "rack.version"=>[1, 0],
    "rack.errors"=>#<Rack::Lint::ErrorWrapper:0x007ffdec490128 @error=#<IO:<STDERR>>>,
    "rack.multithread"=>false,
    "rack.multiprocess"=>false,
    "rack.run_once"=>false,
    "REQUEST_METHOD"=>"GET",
    "REQUEST_PATH"=>"/",
    "PATH_INFO"=>"/",
    "REQUEST_URI"=>"/",
    "HTTP_VERSION"=>"HTTP/1.1",
    "HTTP_USER_AGENT"=>"curl/7.24.0 (x86_64-apple-darwin12.0) libcurl/7.24.0 OpenSSL/0.9.8r zlib/1.2.5",
    "HTTP_HOST"=>"localhost:9292",
    "HTTP_ACCEPT"=>"*/*",
    "GATEWAY_INTERFACE"=>"CGI/1.2",
    "SERVER_PORT"=>"9292",
    "QUERY_STRING"=>"",
    "SERVER_PROTOCOL"=>"HTTP/1.1",
    "rack.url_scheme"=>"http",
    "SCRIPT_NAME"=>"",
    "REMOTE_ADDR"=>"127.0.0.1",
    "async.callback"=>#<Method: Thin::Connection#post_process>,
    "async.close"=>#<EventMachine::DefaultDeferrable:0x007ffdec496410>
}
=end
