#  ____  __  __         _   ___
# / ___||  \/  | __   _/ | / _ \
# \___ \| |\/| | \ \ / / || | | |
#  ___) | |  | |  \ V /| || |_| |
# |____/|_|  |_|   \_/ |_(_)___/
#

import os
import re
import socket
import subprocess
import random
import platform
from typing import List  # noqa: F401
from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from typing import List  # noqa: F401

mod = "mod4"
terminal = "alacritty"
browser = "brave"
file_manager = "nautilus"

keys = [
	# Window Controls
	Key([mod], "q",
		lazy.window.kill(),
		desc="Kill focused window"),
	Key([mod], "x",
		lazy.spawn(terminal),
		desc="Launch my Terminal"),
	Key([mod], "b",
		lazy.spawn(browser),
		desc="Launch my Browser"),
	Key([mod], "e",
		lazy.spawn(file_manager),
		desc="Launch my File Manager"),
	Key([mod], "r",
		lazy.spawn("dmenu_run -c -g 1 -l 25 -bw 3 -p 'Run: '"),
		desc="Dmenu Run Menu"),
	Key([mod], "d",
		lazy.spawn("discord"),
		desc="Launch Discord"),
	Key([mod], "a",
		lazy.spawn("anaconda-navigator"),
		desc="Launch Anaconda Navigator"),
	Key([mod], "p",
		lazy.spawn("code ~/projects/python"),
		desc="Work on my Python Projects"),

	# Volume Controls
	Key([], "XF86AudioRaiseVolume",
		lazy.spawn("amixer -c 0 -q set Master 1dB+")),
	Key([], "XF86AudioLowerVolume",
		lazy.spawn("amixer -c 0 -q set Master 1dB-")),
	Key([], "XF86AudioMute",
		lazy.spawn("amixer -c 0 -q set Master toggle")),

	# Switch between windows in current stack pane
	Key([mod], "k",
		lazy.layout.down(),
		desc="Move focus down in stack pane"),
	Key([mod], "j",
		lazy.layout.up(),
		desc="Move focus up in stack pane"),

	# Stack Controls

	Key([mod], "h",
		lazy.layout.grow(),
		desc="Increase Size of Window"),
	Key([mod], "l",
		lazy.layout.shrink(),
		desc="Decrease Size of Window"),
	Key([mod], "n",
		lazy.layout.normalize(),
		desc="Restore Size of Window"),

	# Move windows up or down in current stack
	Key([mod, "shift"], "k",
		lazy.layout.shuffle_down(),
		desc="Move window down in current stack "),
	Key([mod, "shift"], "j",
		lazy.layout.shuffle_up(),
		desc="Move window up in current stack "),

	# Switch window focus to other pane(s) of stack
	Key([mod], "space",
		lazy.layout.next(),
		desc="Switch window focus to other pane(s) of stack"),

	# Swap panes of split stack
	Key([mod, "shift"], "space",
		lazy.layout.flip(),
		desc="Swap panes of split stack"),

	# Toggle between split and unsplit sides of stack.
	# Split = all windows displayed
	# Unsplit = 1 window displayed, like Max layout, but still with
	# multiple stack panes
	Key([mod, "shift"], "Return",
		lazy.layout.toggle_split(),
		desc="Toggle between split and unsplit sides of stack"),

	# Toggle between different layouts as defined below
	Key([mod], "Tab",
		lazy.next_layout(),
		desc="Toggle between layouts"),

	Key([mod, "shift"], "r",
		lazy.restart(),
		desc="Restart qtile"),
	Key([mod, "shift"], "q",
		lazy.shutdown(),
		desc="Shutdown qtile"),
	Key([mod, "control"], "r",
		lazy.spawncmd(),
		desc="Spawn a command using a prompt widget"),
]


# Changing a group names
group_names = [("WEB", {'layout': 'monadtall'}),
			   ("DEV", {'layout': 'monadtall'}),
			   ("VIRMAN", {'layout': 'floating'}),
			   ("CLASS", {'layout': 'max'}),
			   ("CHAT", {'layout': 'monadtall'}),
			   ("MUS", {'layout': 'monadtall'}),
			   ("SYS", {'layout': 'max'})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
	# Switch to Another Group
	keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
	# Move Window to Another Group
	keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))

layout_theme = {"border_width": 0,
				"margin": 4,
				"border_focus": "e1acff",
				"border_normal": "1D2330"
				}

layouts = [
	layout.MonadTall(**layout_theme),
	layout.Max(**layout_theme),
	layout.Floating(**layout_theme),
	layout.MonadWide(**layout_theme),
	#layout.Zoomy(**layout_theme)
	# layout.Stack(num_stacks=2),
	# Try more layouts by unleashing below layouts.
	# layout.Bsp(),
	# layout.Columns(),
	# layout.Matrix(),
	# layout.RatioTile(),
	# layout.Tile(),
	# layout.TreeTab(),
	# layout.VerticalTile(),
]

colors = [["#292d3e", "#292d3e"],  # panel background
		  ["#434758", "#434758"],  # background for current screen tab
		  ["#ffffff", "#ffffff"],  # font color for group names
		  ["#ff5555", "#ff5555"],  # border line color for current tab
		  ["#e1acff", "#e1acff"],  # window name
		  ["#bfbfbf", "#bfbfbf"],   # white
		  ["#ff5555", "#ff5555"],   # red
		  ["#50fa7b", "#50fa7b"],   # green
		  ["#f1fa8c", "#f1fa8c"],    # yellow
		  ["#6790eb", "#6790eb"],   # blue
		  ["#ff79c6", "#ff79c6"],   # magenta
		  ["#8be8fd", "#8be9fd"]]   # cyan

widget_defaults = dict(
	font="Hack Bold",
	fontsize=12,
	padding=2,
	background=colors[2]
)

extension_defaults = widget_defaults.copy()

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())


def kernel_name():
	c = platform.release()
	return c


def init_widgets_list():
	widgets_list = [
		widget.Sep(
			linewidth=0,
			padding=6,
			foreground=colors[2],
			background=colors[0]
		),
		widget.Image(
			filename="~/.config/qtile/icons/python.png",
			mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn(
				"dmenu_run -c -g 4 -l 25 -bw 3 -p 'Run: '")}
		),
		widget.GroupBox(
			font="Hack Bold",
			fontsize=11,
			margin_y=3,
			margin_x=0,
			padding_y=5,
			padding_x=3,
			borderwidth=3,
			active=colors[9],
			block_highlight_text_color=colors[0],
			inactive=colors[9],
			rounded=False,
			highlight_method="block",
			this_current_screen_border=colors[9],
			this_screen_border=colors[4],
			foreground=colors[2],
			background=colors[0],
			disable_drag=True
		),
		widget.Prompt(
			prompt=prompt,
			font="Ubuntu Mono",
			padding=10,
			foreground=colors[3],
			background=colors[1]
		),
		widget.Sep(
			linewidth=0,
			padding=40,
			foreground=colors[2],
			background=colors[0]
		),
		widget.WindowName(
			foreground=colors[2],
			background=colors[0],
			padding=0
		),
		widget.TextBox(
			text='|',
			background=colors[0],
			foreground=colors[2],
			padding_x=4,
			fontsize=20
		),
		widget.TextBox(
			text="⟳",
			padding=2,
			foreground=colors[6],
			background=colors[0],
			fontsize=14
		),
		widget.CheckUpdates(
			update_interval=30,
			colour_have_updates=colors[6],
			colour_no_updates=colors[6],
			foreground=colors[6],
			mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn(
				terminal + ' -e sudo pacman -Syu')},
			background=colors[0]
		),
		widget.TextBox(
			text="Updates",
			padding=5,
			mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn(
				terminal + ' -e sudo pacman -Syu')},
			foreground=colors[6],
			background=colors[0]
		),
		widget.TextBox(
			text='|',
			background=colors[0],
			foreground=colors[2],
			padding_x=4,
			fontsize=20
		),
		widget.TextBox(
			text="💾",
			foreground=colors[7],
			background=colors[0],
			padding=0,
			fontsize=14
		),
		widget.Memory(
			foreground=colors[7],
			background=colors[0],
			mouse_callbacks={'Button1': lambda qtile: qtile.cmd_spawn(
				terminal + ' -e htop')},
			padding=5
		),
		widget.TextBox(
			text='|',
			background=colors[0],
			foreground=colors[2],
			padding_x=4,
			fontsize=20
		),
		widget.TextBox(
			text="🌡",
			padding=2,
			foreground=colors[8],
			background=colors[0],
			fontsize=11
		),
		widget.ThermalSensor(
			foreground=colors[8],
			background=colors[0],
			threshold=90,
			padding=5
		),

		widget.TextBox(
			text='|',
			background=colors[0],
			foreground=colors[2],
			padding_x=4,
			fontsize=20
		),
		widget.TextBox(
			text=" Vol:",
			foreground=colors[9],
			background=colors[0],
			padding=0
		),
		widget.Volume(
			foreground=colors[9],
			background=colors[0],
			padding=5
		),
		widget.TextBox(
			text='|',
			background=colors[0],
			foreground=colors[2],
			padding_x=4,
			fontsize=20
		),
		widget.CurrentLayoutIcon(
			custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
			foreground=colors[0],
			background=colors[0],
			padding=0,
			scale=0.7
		),
		widget.CurrentLayout(
			foreground=colors[10],
			background=colors[0],
			padding=5
		),
		widget.TextBox(
			text='|',
			background=colors[0],
			foreground=colors[2],
			padding_x=4,
			fontsize=20
		),
		widget.Clock(
			foreground=colors[11],
			background=colors[0],
			format="%A, %B %d  [ %I:%M %p ]"
		),
		widget.TextBox(
			text='|',
			background=colors[0],
			foreground=colors[2],
			padding_x=4,
			fontsize=20
		),
		widget.Systray(
			background=colors[0],
			padding=5
		),
		widget.Sep(
			linewidth=0,
			padding=6,
			foreground=colors[2],
			background=colors[0]
		),
	]
	return widgets_list


screens = [
	Screen(top=bar.Bar(widgets=init_widgets_list(), opacity=1.0, size=20))]

# Drag floating layouts.
mouse = [
	Drag([mod], "Button1", lazy.window.set_position_floating(),
		 start=lazy.window.get_position()),
	Drag([mod], "Button3", lazy.window.set_size_floating(),
		 start=lazy.window.get_size()),
	Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
	# Run the utility of `xprop` to see the wm class and name of an X client.
	{'wmclass': 'confirm'},
	{'wmclass': 'dialog'},
	{'wmclass': 'download'},
	{'wmclass': 'error'},
	{'wmclass': 'file_progress'},
	{'wmclass': 'notification'},
	{'wmclass': 'splash'},
	{'wmclass': 'toolbar'},
	{'wmclass': 'confirmreset'},  # gitk
	{'wmclass': 'makebranch'},  # gitk
	{'wmclass': 'maketag'},  # gitk
	{'wname': 'branchdialog'},  # gitk
	{'wname': 'pinentry'},  # GPG key password entry
	{'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"


@hook.subscribe.startup_once
def start_once():
	home = os.path.expanduser('~')
	subprocess.call([home + '/.config/qtile/autostart.sh'])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
