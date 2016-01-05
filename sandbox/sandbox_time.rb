require 'time'

str = '2015-11-09 04:13:53 UTC'
puts Time.parse(str)

event_time = Time.now.strftime('%Y-%m-%d %H:%M:%S')
puts event_time

#row['start_time'].iso8601