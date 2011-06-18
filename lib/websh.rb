require 'ripl/websh'
require 'websh/util'

module Websh
  class <<self; attr_accessor :on_load_string; end

  def self.completions(line_buffer)
    input = line_buffer[/([^#{Bond::Readline::DefaultBreakCharacters}]+)$/,1]
    arr = Bond.agent.call(input || line_buffer, line_buffer)
    return [] if arr[0].to_s[/^Bond Error:/] #silence bond debug errors
    return arr if input == line_buffer
    chopped_input = line_buffer.sub(/#{Regexp.quote(input.to_s)}$/, '')
    arr.map {|e| chopped_input + e }
  end
end

unless ENV['NO_BEFORE_LOOP']
  Websh.on_load_string = Websh::Util.capture_all {
    Ripl.shell.before_loop
  }[0,2].inject(&:+)
end
