# Muxit

Muxit is a script to simplify tmux usage in solo development.  I tend to have the same setup for every single project:

* One session per project
* 2 vsplit panes per session
* Each session maps to a directory in the `$PROJECTS` folder

## Installation

Add this line to your application's Gemfile:

    gem 'muxit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install muxit

## Usage

`muxit start NAME` - starts a new tmux session named NAME 
`muxit attach NAME` - attaches to an existing tmux session
`muxit list` - list all sessions in tmux
`muxit nuke NAME` - kills off a tmux session
`muxit code NAME` - opens a named session, changes directory to `$PROJECTS/NAME`, creates a split window,
and opens the editor specified by `$EDITOR` in the left pane.

Thus, opening a muxit session to edit the muxit library would look like this:

```
export $PROJECTS=~/code
git clone cadwallion/muxit ~/code/muxit

muxit code muxit
```

If your project happens to be in a subdirectory, muxit will name it after the last folder specified.

```
export $PROJECTS=~/code
git clone cadwallion/muxit ~/code/oss/muxit

muxit code oss/muxit
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
