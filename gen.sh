#!/bin/sh

#destroy any existing
for ev in "invite" "join" "checkin" "reminder" "alert" "optout" "optin"; do
  rails d model $ev
done

rails d model event
rails d model timeline
rails d scaffold reporter

rake db:drop

#regen
rails g scaffold reporter email:string name:string interval:string user:references
rails g model timeline reporter:references
rails g model event timestamp:timestamp timeline:references

for ev in "invite" "join" "checkin" "reminder" "alert" "optout" "optin"; do
  rails g model $ev --parent event
done

rake db:migrate db:seed
