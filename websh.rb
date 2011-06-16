require 'sinatra/base'
#require 'sinatra/synchrony'
require 'ripl/websh'
require 'json'
require 'bond'
Bond.start

class Websh < Sinatra::Base
  #register Sinatra::Synchrony
  set :public, File.dirname(__FILE__) + '/public'

  get '/' do
    File.read('public/index.html')
  end

  get '/eval' do
    Ripl.shell.input = params[:input]
    Ripl.shell.loop_once
  end

  get '/autocomplete' do
    JSON.generate completions(params[:input])
  end

  private

  def completions(line_buffer)
    input = line_buffer[/([^#{Bond::Readline::DefaultBreakCharacters}]+)$/,1]
    arr = Bond.agent.call(input || line_buffer, line_buffer)
    return [] if arr[0].to_s[/^Bond Error:/] #silence bond debug errors
    return arr if input == line_buffer
    chopped_input = line_buffer.sub(/#{Regexp.quote(input.to_s)}$/, '')
    arr.map {|e| chopped_input + e }
  end
end
