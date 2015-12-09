# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  window.additional_event_classes = { "Reminder": "bg-warning", "Notification": "bg-danger" }

  window.event_update_handler = (event, container_id) ->
    console.log("Received Tock event")
    console.log(event)
    data = JSON.parse(event.data)
    time = data['time']
    type = data['type']
    additional_classes = window.additional_event_classes[type]
    $("##{container_id} p:last-child").remove()
    new_entry = $('<p>').attr('class', 'event')

    if additional_classes
      new_entry = new_entry.addClass(additional_classes)

    new_entry = new_entry.text("[" + time + "] " + type)
    $("##{container_id}").prepend(new_entry)
    console.log("Processed Tock event.")
