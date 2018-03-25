require 'sinatra'
require_relative './app/controllers/api_controller.rb'
require_relative './lib/sinatra_api_parser.rb'

use Rack::MethodOverride

run APIController
