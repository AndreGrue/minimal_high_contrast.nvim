local lush = require("lush")
local hsl = lush.hsl

-- palette
return {
	background = hsl("#111111"),
	foreground = hsl("#f0f0f0"),
	comment = hsl(0, 0, 35),
	gray = hsl(0, 0, 50),

	xxx = hsl("#729db4"),

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

	purple = hsl(280, 87, 53),
	bright_purple = hsl(280, 87, 73),
	dark_purple = hsl(280, 87, 33),
	neutral_purple = hsl(280, 77, 43),
	faded_purple = hsl(280, 47, 53),

	yellow = hsl(60, 100, 50),
	bright_yellow = hsl(60, 100, 80),
	dark_yellow = hsl(60, 100, 30),
	neutral_yellow = hsl(60, 90, 40),
	faded_yellow = hsl(60, 55, 50),

	orange = hsl(20, 100, 56),
	bright_orange = hsl(20, 100, 76),
	dark_orange = hsl(20, 100, 36),
	neutral_orange = hsl(20, 90, 46),
	faded_orange = hsl(20, 55, 56),

	red = hsl(0, 100, 50),
	bright_red = hsl(0, 100, 70),
	dark_red = hsl(0, 100, 30),
	neutral_red = hsl(0, 90, 40),
	faded_red = hsl(0, 60, 50),

	blue = hsl(240, 100, 50),
	bright_blue = hsl(240, 100, 70),
	light_blue = hsl("#1C9FDD"),
	dark_blue = hsl(240, 100, 30),
	neutral_blue = hsl(240, 90, 40),
	faded_blue = hsl(240, 60, 50),

	green = hsl(120, 100, 25),
	bright_green = hsl(120, 100, 40),
	dark_green = hsl(120, 100, 11),
	neutral_green = hsl(120, 46, 25),
	faded_green = hsl(120, 46, 25),
}
