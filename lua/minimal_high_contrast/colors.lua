local lush = require("lush")
local hsl = lush.hsl

-- palette
return {
	background = hsl("#111111"),
	foreground = hsl("#f0f0f0"),
	comment = hsl(0, 0, 35),

	bright_blue = hsl("#68a9eb"),
	blue = hsl("#3050f0"),
	dark_blue = hsl("#3030E0").darken(75),
	green = hsl(130, 75, 50).darken(20),
	neutral_red = hsl("#b04b2e"),

	light0_hard = hsl("#f0f0f0"),
	light0_soft = hsl("#fefefe"),
	light0 = hsl("#fbfbfb"),
	light1 = hsl("#ebebeb"),
	light2 = hsl("#d5d5d5"),
	light3 = hsl("#bdbdbd"),
	light4 = hsl("#a8a8a8"),

	dark0_hard = hsl("#111111"),
	dark0_soft = hsl("#252c31"),
	dark0 = hsl("#182227"),
	dark1 = hsl("#2a343a"),
	dark2 = hsl("#2e373b"),
	dark3 = hsl("#3f4b52"),
	dark4 = hsl("#555e61"),

	purple = hsl(277, 87, 53),
	bright_purple = hsl(277, 87, 73),
	dark_purple = hsl(277, 87, 33),
	neutral_purple = hsl(277, 77, 43),
	faded_purple = hsl(277, 47, 53),

	bright_red = hsl("#dda790"),
	bright_green = hsl("#8bb664"),
	bright_yellow = hsl("#e9c062"),
	bright_aqua = hsl("#b5d8f6"),
	bright_orange = hsl("#dad085"),
	neutral_green = hsl("#99cf50"),
	neutral_yellow = hsl("#c59820"),
	neutral_blue = hsl("#3c98d9"),
	neutral_aqua = hsl("#89bdff"),
	neutral_orange = hsl("#c98344"),
	error = hsl("#900708"),
	faded_red = hsl("#b83939"),
	faded_green = hsl("#babb63"),
	faded_yellow = hsl("#dad085"),
	faded_blue = hsl("#94aadb"),
	faded_aqua = hsl("#a9b5a7"),
	faded_orange = hsl("#c59820"),
	gray = hsl("#9a9a9a"),
}
