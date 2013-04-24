module Muxit
  class CLI < Thor
    desc 'start NAME', 'Start a named tmux session'
    def start name
      tmux_exec ['tmux', 'new-session', '-s', '#{name}']
    end

    desc 'list', 'List all existing tmux sessions'
    def list
      tmux_exec ['tmux', 'list-sessions']
    end

    desc 'attach NAME', 'Attach to NAME session'
    def attach name
      tmux_exec ['tmux', 'attach-session', '-t', name]
    end

    desc 'nuke NAME', 'Destroy a named session'
    def nuke name
      tmux_exec ['tmux', 'kill-session', '-t', name]
    end

    desc 'code NAME', 'opens up a new tmux session with split windows, in the project directory, with an $EDITOR pane'
    def code project
      name = project.split('/').last
      directory = "#{ENV['PROJECTS']}/#{project}"
      tmux_exec "tmux new-session -s #{name} 'cd #{directory} && #{ENV['EDITOR']}' \\; split-window -h -c #{directory}"
    end

    private
    def tmux_exec tmux_command
      IO.popen(tmux_command, 'r') do |process|
        puts process.gets until process.eof?
      end
    end
  end
end
