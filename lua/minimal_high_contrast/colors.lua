local lush = require("lush")
local hsl = lush.hsl

-- palette
return {
	background = hsl("#0a0a0a"),
	foreground = hsl("#f7f7f7"),
	comment = hsl(0, 0, 40),
	cursor = hsl("#191970"),

	white = hsl("#FFFFFF"),

	gray = hsl(0, 0, 50),
	gray1 = hsl(0, 0, 60),
	gray2 = hsl(0, 0, 69),
	gray3 = hsl(0, 0, 77),
	gray4 = hsl(0, 0, 84),

	black = hsl("#000000"),
	black2 = hsl("#0A0A0A"),
	black3 = hsl("#0F0F0F"),
	black4 = hsl("#1A1A1A"),

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
	dark3 = hsl("#3f4542"),
	dark4 = hsl("#555e61"),

	purple = hsl(280, 87, 53),
	bright_purple = hsl(280, 87, 73),
	dark_purple = hsl(280, 87, 33),
	-- neutral_purple = hsl(280, 77, 43),
	neutral_purple = hsl("#E297FB"),
	faded_purple = hsl(280, 47, 53),

	yellow = hsl(60, 100, 50),
	bright_yellow = hsl(60, 100, 80),
	dark_yellow = hsl(60, 100, 30),
	neutral_yellow = hsl(60, 84, 50),
	faded_yellow = hsl(60, 52, 50),
	warm_yellow = hsl("#FFCF40"),

	orange = hsl(20, 100, 56),
	bright_orange = hsl(36, 100, 50),
	dark_orange = hsl(33, 75, 50),
	-- neutral_orange = hsl(25, 75, 51),
	neutral_orange = hsl("#CD7F48"),
	faded_orange = hsl(33, 50, 50),

	red = hsl(0, 100, 50),
	bright_red = hsl(0, 100, 70),
	dark_red = hsl(0, 100, 30),
	neutral_red = hsl(0, 90, 40),
	faded_red = hsl(0, 60, 50),

	blue = hsl("#0000FF"),
	bright_blue = hsl("#70A0FF"),
	light_blue = hsl("#1C9FDD"),
	dark_blue = hsl("#00008B"),
	-- neutral_blue = hsl("#0080FF"),
	-- neutral_blue = hsl("#8DBAE0"),
	neutral_blue = hsl("#2aa0Ff"),
	faded_blue = hsl("#6060A0"),

	green = hsl(120, 100, 25),
	bright_green = hsl(120, 100, 40),
	dark_green = hsl(120, 100, 11),
	-- neutral_green = hsl(120, 46, 25),
	neutral_green = hsl("#6FA43F"),
	faded_green = hsl(120, 46, 25),

	blue_green = hsl("#0D98BA"),
	brown = hsl("#964B00"),
}
