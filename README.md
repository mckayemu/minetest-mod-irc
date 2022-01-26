minetest mod irc
====================

A glue between IRC and Minetest. It provides two-way
 communication between the in-game chat, and an arbitrary IRC channel.

Information
------------

This mod provides a two-way communication between the in-game chat, 
and an arbitrary IRC channel. This is done by connecting 
a bot to the channel, that acts as a "proxy" for messages.

Tech information
----------------

If you intend to run this on a server where non-ASCII characters 
may be used (e.g. non-english-speaking servers), be sure your 
environment's language encoding is set to UTF-8. Otherwise, you 
may see errors about "character conversion failed" or "invalid wstring".

### Depends

* default

### Download

This fork mae many fixes rejected by some stupid developers, 
also try to fix and be more compatible with both 0.4 an 5.X engines.

This fork can be downloaded from https://codeberg.org/minenux/minetest-mod-irc
or also from https://github.com/minenux/minetest-mod-irc using `main` branch.

After download or cloned recursivelly, the directory must be named `irc`.

### Installing

First download the mod to the `irc` directory.

IF you use git for, mod's git repository uses submodules, therefore 
you will have to run `git submodule init` when first installing the 
mod (unless you used `--recursive` as above), 
and `git submodule update` every time that a submodule 
is updated. These steps can be combined into `git submodule update --init`.

You'll need to install LuaSocket. By example:

* debian `apt-get install lua-socket` (Also for olders get it at venenux)
* alpíne `apk add lua-socket` available since alpine 3.4
* or install using the luarocks manager

Next will need to add IRC to your trusted mods if you haven't disabled mod
security. `secure.trusted_mods = irc`

### Configuration

All settings are documented with [settingtypes.txt](settingtypes.txt) but 
can also be put/changed in `minetest.conf`. If any of these settings
are not set, the default value is used.

| config item   | type   | default | description |
| ------------- | ------ | ------- | ---------- |
| `irc.server`  | string | nil *   | The address of the IRC server to connect to. |
| `irc.channel` | string | nil *   | The IRC channel to join. |
| `irc.interval`| number | 2.0     | prevents the server from flooding. After four messages this much time must pass between folowing messages. |
| `irc.nick`    | string | nil *   | Nickname the server uses when it connects to IRC. |
| `irc.NSPass`  | string | nil     | NickServ password. Don't set this if you use SASL authentication. |
| `irc.password`| string | nil     | Password to use when connecting to the server. |
| `irc.sasl.user` | string | `irc.nick` | The SASL username. This should normaly be set to your   NickServ account name.|
| `irc.sasl.pass`| string | nil    | SASL password, same as nickserv password, should use this instead of NickServ authentication  if the server supports it. |
| `irc.debug`   | boolean | false  | Whether to output debug information. |
| `irc.disable_auto_connect` | boolean | false |  If false, the bot is connected by default. If true, a player with  the `irc_admin` privilege has to use the `/irc_connect` command to  connect to the IRC server. |
| `irc.disable_auto_join` | boolean | false | If false, players join the channel automatically upon entering the game. If true, each user must manually use the `/join` command to join the channel. In any case, the players may use the `/part` command to opt-out of being in the channel. |
| `irc.send_join_part` | boolean | true | Determines whether to send when player joins/leaves and part messages to the channel. |

The settings with `*` are mandatory. check [settingtypes.txt](settingtypes.txt) 
for better information.

Usage
-----

Once the game is connected to the IRC channel, chatting in-game will send
messages to the channel, and will be visible by anyone. Also, messages sent
to the channel will be visible in-game.

Messages that begin with `[off]` from in-game or IRC are not sent to the
other side.

### Chats commands

This mod also adds a few chat commands:

| command format   | privs  | description |
| ---------------- | ------ | ----------- |
| `/irc_msg <nick> <message>` |  | Send a private message to a IRC user. |
| `/join`          |        |  Join the IRC chat. |
| `/part`          |        |  Part the IRC chat. |
| `/irc_connect`   | irc_admin | Connect the bot manually to the IRC network. |
| `/irc_disconnect`| irc_admin | Disconnect the bot manually from the IRC network (this does not  shutdown the game). |
| `/irc_reconnect` | irc_admin | Equivalent to `/irc_disconnect` followed by `/irc_connect`. |

### Private messages

You can also send private messages from IRC to in-game players
by sending a private message to the bot (set with the `irc.nick`
option above), in the following format: `@playername message`

For example, if there's a player named `mtuser`, you can send him/her
a private message from IRC with if your bot is named `server_nick` as:

	/msg server_nick @mtuser Hello!

### Basic commands

The bot also supports some basic commands, which are invoked by saying
the bot name followed by either a colon or a comma and the command, or
sending a private message to it. For example: `ServerBot: help whereis`.

* `help [<command>]`:
  Prints help about a command, or a list of supported commands if no
  command is given.

* `uptime`:
  Prints the server's running time.

* `whereis <player>`:
  Prints the coordinates of the given player.

* `players`:
  Lists players currently in the server.


Contributions
------

0gb.us, ShadowNinja, Shaun/kizeren, RAPHAEL, DARGON, Calinou, Exio,
vortexlabs/mrtux, marveidemanis, marktraceur, jmf/john\_minetest,
sdzen/Muadtralk, VanessaE, PilzAdam, sfan5, celeron55, KikaRz,
OldCoder, RealBadAngel


License
-------

See `LICENSE.txt` for details.

The files in the `irc` directory are part of the LuaIRC project.
See `irc/LICENSE.txt` for details.
