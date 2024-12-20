'''
This script is a singleton and runs on autoload. It's purpose is to provide a 
format for logs, as well as store those logs in memory.
The intended case-use is to call Logger.log() whenever a change on the front-end
is made, such as a Device status changing, or a Waddles spawning.
'''

extends Node

signal new_log(log_entry: Dictionary)

var logs: Array = [] 

func log(message: String, category: String = "info", device_name: String = ""):
	var timestamp = Time.get_time_string_from_system()
	var log_entry = {
		"timestamp": timestamp,
		"category": category,
		"message": message,
		"device": device_name
	}
	logs.append(log_entry)
	emit_signal("new_log", log_entry)
	#print("[%s][%s][%s]: %s" % [category.capitalize(), device_name, timestamp, message])  # Optional: Print log in console

func get_logs(_filter_category: String = "") -> Array:
	return logs
