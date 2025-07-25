class_name DateTime extends Resource

const END_OF_YEAR: int = 11
@export_range(0,59) var seconds = 0
@export_range(0,59) var minutes = 0
@export_range(0,23) var hours = 0
@export_range(0,366) var days = 0
var vis_day: int = 0
var vis_month: int = 0
var month_names: Array = ["January", "February", "March", 
							 "April", "May", "June", "July", 
							 "August", "September", "October", 
							 "November", "December"]
var days_month: Array = [31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365]
var vis_days_month: Array = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
var days_month_leap: Array = [31, 60, 91, 121, 151, 181, 213, 244, 274, 305, 335, 366]
var vis_days_month_leap: Array = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
var seasons: Array = ["Winter", "Spring", "Summer", "Fall"]
var vis_season: String = ""
@export var years = 0

var delta_time: float = 0
var leap_year: bool = false
var cur_time: int = 0

#increases seconds based ticks that have passed.
func increase_by_sec(delta_seconds: float) -> void:
	#Checks to see how much time has passed, then creates an integer if it passes enough.
	delta_time += delta_seconds
	if delta_time < 1: return
	var delta_int_secs: int = delta_time
	#Used to reset delta_time so that each second is accounted for in the same number of game ticks.
	#If this isn't done, time passes by in increasing speed.
	delta_time -= delta_int_secs
	
	#incriments time values
	seconds += delta_int_secs
	minutes += seconds/60
	hours += minutes/60
	days += hours/24
	
	#Handles leap years
	if (years%4 == 0):
		leap_year = true
		years += days /days_month_leap[END_OF_YEAR]
		days = days %days_month_leap[END_OF_YEAR]
		
		#assigns visible day, month, and season, like 20, December instead of 355, 11
		for month in range(12):
			if days <= days_month_leap[month] && month-1 == -1:
				vis_month = month
				vis_day = days
				handle_season(month)
				break
			if days > days_month_leap[month-1] && days <= days_month_leap[month]:
				vis_month = month
				vis_day = days-days_month_leap[month-1]
				handle_season(month)
				break
	#Handles normal years
	else:
		leap_year = false
		years += days /days_month[END_OF_YEAR]
		days = days %days_month[END_OF_YEAR]
		
		#assigns visible day, month, and season, like 20, December instead of 355, 11
		for month in range(12):
			if days <= days_month[month] && month-1 == -1:
				vis_month = month
				vis_day = days
				handle_season(month)
				break
			if days > days_month[month-1] && days <= days_month[month]:
				vis_month = month
				vis_day = days-days_month[month-1]
				handle_season(month)
				break
	
	#resets time for next calculation
	seconds = seconds % 60
	minutes = minutes % 60
	hours = hours % 24
	if cur_time != hours:
		cur_time = hours
		print(cur_time)
	print_date()

#Handles assigning a visable season based on the month.
func handle_season(month: int):
	if month <= 1 || month == 11:
		vis_season = seasons[0]
	if month >= 2 && month <= 4:
		vis_season = seasons[1]
	if month >= 5 && month <= 7:
		vis_season = seasons[2]
	if month >= 8 && month <= 10:
		vis_season = seasons[3]

#Prints current date, season, and time.
func print_date():
	var p_seconds = seconds
	var p_minutes = minutes
	var p_hours = hours
	var p_month = month_names[vis_month]
	var p_season = vis_season
	
	#Casts all hours, minutes, and seconds as strings, then adds a 0 in front of them for more uniform time posting.
	if p_seconds < 10:
		p_seconds = "0"+str(p_seconds)
	else:
		p_seconds = str(p_seconds)
	
	if p_minutes < 10:
		p_minutes = "0"+str(p_minutes)
	else:
		p_minutes = str(p_minutes)
		
	if p_hours < 10:
		p_hours = "0"+str(p_hours)
	else:
		p_hours = str(p_hours)
	
	print(str(vis_day) + " " + p_month + " " + str(years))
	print("The season of " + p_season)
	print(p_hours + ":" + p_minutes + ":" + p_seconds)
