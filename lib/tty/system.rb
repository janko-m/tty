# encoding: utf-8

require 'rbconfig'

module TTY
  class System
    # Check if windows platform.
    #
    # @return [Boolean]
    #
    # @api public
    def self.windows?
      match_os?(/msdos|mswin|djgpp|mingw|windows/i)
    end

    # Check if unix platform
    #
    # @return [Boolean]
    #
    # @api public
    def self.unix?
      match_os?(/(aix|darwin|linux|(net|free|open)bsd|cygwin|solaris|irix|hpux)/i)
    end

    # Check if platform matches given systems
    #
    # @return [Boolean]
    #
    # @api public
    def self.match_os?(matcher)
      !!(RbConfig::CONFIG['host_os'] =~ matcher)
    end

    # Find an executable in the PATH
    #
    # @see TTY::System::Which
    #
    # @api public
    def self.which(command)
      Which.new(command).which
    end

    # Check if command is available
    #
    # @param [String] name
    #   the command name
    #
    # @api public
    def self.exists?(name)
      !!which(name)
    end

    # Proxy to editor object
    #
    # @return [TTY::System::Editor]
    #
    # @api public
    def self.editor
      TTY::System::Editor
    end
  end # System
end # TTY
