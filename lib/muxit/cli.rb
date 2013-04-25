module Muxit
  class CLI < Thor
    desc 'start NAME', 'Start a named tmux session'
    def start name
      tmux_exec ['new-session', '-s', '#{name}']
    end

    desc 'list', 'List all existing tmux sessions'
    def list
      tmux_exec ['list-sessions']
    end

    desc 'attach NAME', 'Attach to NAME session'
    def attach name
      tmux_exec ['attach-session', '-t', name]
    end

    desc 'nuke NAME', 'Destroy a named session'
    def nuke name
      tmux_exec ['kill-session', '-t', name]
    end

    desc 'code NAME', 'opens up a new tmux session with split windows, in the project directory, with an $EDITOR pane'
    def code project
      name = project.split('/').last

      if project[0] == '/'
        directory = project
      else
        directory = "#{ENV['PROJECTS']}/#{project}"
      end

      args = ['new-session', '-A', '-s', name, "'cd #{directory} && #{ENV['EDITOR']}' \\; split-window -h -c #{directory}"]
      tmux_exec args
    end

    private
    def tmux_exec command
      tmux_command = ['tmux'] + command
      IO.popen(tmux_command, 'r') do |process|
        puts process.gets until process.eof?
      end
    end
  end
end
