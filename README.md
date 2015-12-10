# tock
tock is a heartbeat app in which users checkin regularly, and alerts are sent out if a user fails to checkin. It is inspired by the desire of a capable and self-sufficient but older relative to have some assurance that an extended lack of activity will trigger an investigation. In this regard, it is a sort of reverse ping.

tock is implemented in Rails 4, and depends on the [rufus-scheduler](https://github.com/jmettraux/rufus-scheduler), and [chronic-duration](https://github.com/hpoydar/chronic_duration) gems. Email notifications are processed using [Mailgun](https://www.mailgun.com/). Live updates are implemented using [Server-Sent Events](http://tenderlovemaking.com/2012/07/30/is-it-live.html).

tock is free software, licensed under the [AGPLv3 license](http://www.gnu.org/licenses/agpl-3.0.en.html).
