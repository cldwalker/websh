require 'sinatra/base'
#require 'sinatra/synchrony'
require 'json'
require 'websh'

class Websh::App < Sinatra::Base
  #register Sinatra::Synchrony
  set :public, File.dirname(__FILE__) + '/public'

  get '/' do
    File.read('public/index.html')
  end

  get '/eval' do
    sh = Ripl.shell
    sh.input = params[:input]
    sh.loop_once
    unless sh.respond_to?(:buffer) && !sh.buffer.empty?
      sh.format_result(sh.result)
    end
  end

  get '/autocomplete' do
    JSON.generate Websh.completions(params[:input])
  end

  get '/onload' do
    Websh::Util.format_output Websh.on_load_string
  end
end
