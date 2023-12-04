# vim: set comments=s3b\:\*,mb\:-\,ex-3\:\*,\:>:
# vim: set comments=sb\:\ \ \ \*,mb\:\ \ \ \ \ \ -\,ex-6\:\*,\:>:
# vim: set comments=sfb3\:\ \ \ \*,mb\:\ \ \ \ \ \ -\,ex-6\:\*,\:>:
# vim: set comments=sb\:\ \ \ \*,mb\:\ \ \ -\,exl-6\:\*,\:>:
# vim: set fo=tcq1ropn:
# vim: set fo=1tcroqpanvbw:

# Clink
Bash's powerful command line editing in cmd.exe
[Clink - Github Repository](https://chrisant996.github.io/clink/)
> Download v1.5.15
   - [ZIP
   (portable)](https://github.com/chrisant996/clink/releases/download/v1.5.15/clink.1.5.15.08c7e3.zip)
   - [EXE
   (installer)](https://github.com/chrisant996/clink/releases/download/v1.5.15/clink.1.5.15.08c7e3_setup.exe)

## Overview
Clink combines the native Windows shell.exe with powerful command lin editing
features of the GNU Readline library, providing rich completion, history, and
line editing capabilities.
**Note** Readline is best known for its use in the Unix shell Bash, the
standard shell for MacOSx and many Linux distributions.
For details, refer to the [Clink
documentation](https://chrisant996.github.io/clink/clink.html)
## Download
Downloads are available from the [releases
page](https://github.com/chrisant996/clink/releases).
For help with or filing issues, refer to the [issues
page](https://github.com/chrisant996/clink/issues)
## Features
   * Auto Suggestions
      - Clink offers suggestions as you type based on history, files, and completions
      - Press `right`  or `End` to accept a suggestion (shown in a muted color).
   * Completions
      - Clink can complete words when you press `Tab` or `Ctrl`-`Space`.
      - Built-in completions are available for executables, aliases, comand names, directory commands and environment variables.
      - Use **Lua** scripts to add custom completions.
   * Persistent History
      - Clink stores persistent history between sessions.
      - `Up` and `Down` cycle through history sessions.
      - `PgUp` and `PgDn` cycle through history entries matching the typed
         prefix.
      - `F7` show a popup list of selectable history entries.
      - `Ctrl`-`R` and `Ctrl`-`S` search history incrementally.
   * Scriptable Prompt and Colored Input
      - You can customize the prompt dynamically with Lua scripts -- like in
        other shells -- but never before possible in cmd.exe!
      - Your input is colored by context sensitive completion scripts.
   * Command Line Editing Improvements
      - Clink supercharges the command line with new input editing commands
        and configurable key bindings.
      - `Alt`-`H` to display all key bindings.
      - `Tab` for completion
      - `Ctrl`-`Space` for an interactive completion list.
      - `Ctrl`-`Z` to undo input.
      - `Shift`-`Arrpws` to select text, and type to replace selected text.
   * Convenience
      - Optional auto-answering of the "Terminate batch job?" prompt.
      * Directory shortcuts:
         - `dirname\` is a shortcut for `cd /d` to that directory.
         - `..` or `...` are shortcuts for `cd ..` or `cd ..\..` (etc)
         - `-` or `cd `` changes to previous current working directory.
## Usage
There are several ways to start Clink.
   1. If you Installed the autorun, just start `cmd.exe`. Run `clink autorun
      --help` for more info.
   2. To manually start, run the Clink shortcut from the Start menu (or the
      clink.bat located in the install directory).
   3. To establish Clink to an existing `cmd.exe` process, Use
      `<install_dir>\clink.exe inject`.
You can use Clink right away without configuring anything:
   - Searchable command history will be saved between session.
   - `Tab` and `Ctrl`+`Space` will do match completion in 2 different ways.
   - Press `Alt`+`H` to see a list of current key bindings.
   - Press `Alt`+`Shift`+`/` followed by another key to see what command is
     bound to the key.
See [Getting
Started](https://chrisant996.github.io/clink/clink.html#getting-started) for
more information on getting started with Clink.
## Upgrading from Clink v0.4.9
The new Clink tries to be backwards compatible with Clink v0.4.9 as
possible. However, in some cases upgrading may require a little bit of
configuration work. See [Clink
documentation](https://chrisant996.github.io/clink/clink.html) for more
details.
## Extending Clink
Clink can be extended through its Lua API which allows easy creation of
context sensitive match generators, prompt filtering, and more. See [Clink
documentation](https://chrisant996.github.io/clink/clink.html) for more
details.
