require 'sinatra/base'
#require 'sinatra/synchrony'
require 'ripl'
require 'ripl/shell'

class Websh < Sinatra::Base
  #register Sinatra::Synchrony
  set :public, File.dirname(__FILE__) + '/public'

  get '/' do
    File.read('public/index.html')
  end

  get '/eval' do
    eval(params[:input]).inspect
  end
end

