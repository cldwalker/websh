require 'ripl/websh'
require 'websh/util'
require 'websh/shell'
require 'websh/runner'

module Websh
  def self.completions(line_buffer)
    input = line_buffer[/([^#{Bond::Readline::DefaultBreakCharacters}]+)$/,1]
    arr = Bond.agent.call(input || line_buffer, line_buffer)
    return [] if arr[0].to_s[/^Bond Error:/] #silence bond debug errors
    return arr if input == line_buffer
    chopped_input = line_buffer.sub(/#{Regexp.quote(input.to_s)}$/, '')
    arr.map {|e| chopped_input + e }
  end
end
