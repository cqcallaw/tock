# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

timeline = Timeline.create()

Invite.create(timestamp: "2015-10-01 00:12:34 UTC", timeline: timeline)
Join.create(timestamp: "2015-10-01 00:15:00 UTC", timeline: timeline)
Checkin.create(timestamp: "2015-10-01 23:14:00 UTC", timeline: timeline)
Checkin.create(timestamp: "2015-10-02 22:00:53 UTC", timeline: timeline)
Checkin.create(timestamp: "2015-10-02 23:00:53 UTC", timeline: timeline)
Checkin.create(timestamp: "2015-10-03 22:10:00 UTC", timeline: timeline)
Reminder.create(timestamp: "2015-10-04 22:10:00 UTC", timeline: timeline)
Checkin.create(timestamp: "2015-10-04 22:15:00 UTC", timeline: timeline)
Reminder.create(timestamp: "2015-10-04 22:15:00 UTC", timeline: timeline)
Alert.create(timestamp: "2015-10-05 05:15:00 UTC", timeline: timeline)
Checkin.create(timestamp: "2015-10-04 09:01:24 UTC", timeline: timeline)
Optout.create(timestamp: "2015-10-04 09:05:00 UTC", timeline: timeline)
Optin.create(timestamp: "2015-10-07 12:00:00 UTC", timeline: timeline)
Checkin.create(timestamp: "2015-10-08 11:55:00 UTC", timeline: timeline)
Checkin.create(timestamp: "2015-10-09 11:55:00 UTC", timeline: timeline)
