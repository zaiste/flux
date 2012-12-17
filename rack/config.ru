require 'rack_app'
run FancyRackApp

#run lambda {|env| [200, {'Content-Type' => 'text/plain'}, ["Hello, Zaiste!"]]}

