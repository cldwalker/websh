module Websh
  module Shell
    def self.format_stderr(str)
      "<div class='websh_exception'>#{Util.format_output(str)}</div>"
    end

    def self.output(stdout, stderr)
      output = ''
      output << Util.format_output(stdout) if !stdout.empty?
      output << Shell.format_stderr(stderr) if !stderr.empty?
      output
    end

    def loop_and_return_output
      stdout, stderr, _ = Util.capture_all { loop_once }
      # multi-line plugins use @buffer
      unless @buffer && !@buffer.empty?
        Shell.output(stdout, stderr) +
        (@error_raised ? '' : format_result(result).to_s)
      end
    end
  end
end
