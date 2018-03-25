require 'sinatra'
require_relative './app/controllers/api_controller.rb'

use Rack::MethodOverride

run APIController
