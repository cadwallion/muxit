module Muxit
  class CLI < Thor
    desc 'start NAME', 'Start a named tmux session'
    def start name
      `tmux new-session -s #{name}`
    end

    desc 'list', 'List all existing tmux sessions'
    def list
      `tmux list-sessions`
    end

    desc 'attach NAME', 'Attach to NAME session'
    def attach name
      `tmux attach-session -t #{name}`
    end

    desc 'nuke NAME', 'Destroy a named session'
    def nuke name
      `tmux kill-session -t #{name}`
    end

    desc 'code NAME', 'opens up a new tmux session with split windows, in the project directory, with an $EDITOR pane'
    def code project
      name = project.split('/').last
      directory = "#{ENV['PROJECTS']}/#{project}"
      `tmux new-session -A -s #{name} 'cd #{directory} && #{ENV['EDITOR']}' \\; split-window -h -c #{directory}`
    end
  end
end
