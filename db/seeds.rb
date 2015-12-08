# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create(
  [
    { email: 'cqcallaw@gmail.com', password: 'a', password_confirmation: 'a' },
    { email: 'b@b.com', password: 'b', password_confirmation: 'b' },
    { email: 'c@c.com', password: 'c', password_confirmation: 'c' },
    { email: 'd@d.com', password: 'd', password_confirmation: 'd' },
    { email: 'e@e.com', password: 'e', password_confirmation: 'e' },
    { email: 'f@f.com', password: 'f', password_confirmation: 'f' },
    { email: 'g@g.com', password: 'g', password_confirmation: 'g' },
    { email: 'h@h.com', password: 'h', password_confirmation: 'h' },
    { email: 'i@i.com', password: 'i', password_confirmation: 'i' },
    { email: 'j@j.com', password: 'j', password_confirmation: 'j' },
    { email: 'k@k.com', password: 'k', password_confirmation: 'k' },
    { email: 'l@l.com', password: 'l', password_confirmation: 'l' },
    { email: 'm@m.com', password: 'm', password_confirmation: 'm' },
    { email: 'n@n.com', password: 'n', password_confirmation: 'n' },
    { email: 'o@o.com', password: 'o', password_confirmation: 'o' },
    { email: 'p@p.com', password: 'p', password_confirmation: 'p' },
    { email: 'q@q.com', password: 'q', password_confirmation: 'q' },
    { email: 'r@r.com', password: 'r', password_confirmation: 'r' },
    { email: 's@s.com', password: 's', password_confirmation: 's' },
    { email: 't@t.com', password: 't', password_confirmation: 't' },
    { email: 'u@u.com', password: 'u', password_confirmation: 'u' },
    { email: 'v@v.com', password: 'v', password_confirmation: 'v' },
    { email: 'w@w.com', password: 'w', password_confirmation: 'w' },
    { email: 'x@x.com', password: 'x', password_confirmation: 'x' },
    { email: 'y@y.com', password: 'y', password_confirmation: 'y' },
    { email: 'z@z.com', password: 'z', password_confirmation: 'z' }
  ]
)

reporters = Reporter.create(
  [
    { email: "cqcallaw@gmail.com", name: "Nana", interval: 1, interval_units: "minutes", user: users[0] },
    { email: "duckie@example.com", name: "Duckie", interval: 24,  interval_units: "hours", user: users[0] }
  ]
)

Invite.create(created_at: '2015-10-01 00:12:34 UTC', reporter: reporters[0])
Join.create(created_at: '2015-10-01 00:15:00 UTC', reporter: reporters[0])
Checkin.create(created_at: '2015-10-01 23:14:00 UTC', reporter: reporters[0])
Checkin.create(created_at: '2015-10-02 22:00:53 UTC', reporter: reporters[0])
Checkin.create(created_at: '2015-10-02 23:00:53 UTC', reporter: reporters[0])
Checkin.create(created_at: '2015-10-03 22:10:00 UTC', reporter: reporters[0])
Reminder.create(created_at: '2015-10-04 22:10:00 UTC', reporter: reporters[0])
Checkin.create(created_at: '2015-10-04 22:15:00 UTC', reporter: reporters[0])
Reminder.create(created_at: '2015-10-04 22:15:00 UTC', reporter: reporters[0])
Notification.create(created_at: '2015-10-05 05:15:00 UTC', reporter: reporters[0])
Checkin.create(created_at: '2015-10-04 09:01:24 UTC', reporter: reporters[0])
Optout.create(created_at: '2015-10-04 09:05:00 UTC', reporter: reporters[0])
Optin.create(created_at: '2015-10-07 12:00:00 UTC', reporter: reporters[0])
Checkin.create(created_at: '2015-10-08 11:55:00 UTC', reporter: reporters[0])
Checkin.create(created_at: '2015-10-09 11:55:00 UTC', reporter: reporters[0])

Invite.create(created_at: '2015-11-01 00:12:34 UTC', reporter: reporters[1])
