require 'sinatra/base'
require 'json'
require 'websh'

class Websh::App < Sinatra::Base
  set :public, File.dirname(__FILE__) + '/public'

  get '/' do
    File.read File.dirname(__FILE__) + '/public/index.html'
  end

  get '/eval' do
    Ripl.shell.input = params[:input]
    Ripl.shell.loop_and_return_output
  end

  get '/autocomplete' do
    JSON.generate Websh.completions(params[:input])
  end

  get '/onload' do
    Websh::Util.format_output Websh.on_load_string
  end
end
