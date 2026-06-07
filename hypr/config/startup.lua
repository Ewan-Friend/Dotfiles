-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

local startup = {
	"alacritty",
	-- "nm-applet"
	"brave",
	"hyprpaper",
	"quickshell",
}

hl.on("hyprland.start", function()
	for i = 1, #startup do
		hl.exec_cmd(startup[i])
	end
end)
