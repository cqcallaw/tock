# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
  window.tock_event_sources = []

  additional_event_classes = { "Reminder": "bg-warning", "Notification": "bg-danger" }

  for element in $(".event_stream")
    container_id_pattern = /user([0-9]+)reporter([0-9]+)/g
    container_id = element.id
    results = container_id_pattern.exec(container_id)
    user_id = results[1]
    reporter_id = results[2]
    source = new EventSource("#{BASE_URL}users/#{user_id}/reporters/#{reporter_id}/events");
    source.addEventListener 'event', do (container_id) -> (event) ->
      console.log("Received Tock event")
      console.log(event)
      data = JSON.parse(event.data)
      time = data['time']
      type = data['type']

      container_child_count = $("##{container_id} p").length
      if container_child_count >= 3
        $("##{container_id} p:last-child").remove()

      new_entry = $('<p>').attr('class', 'event')
      additional_classes = additional_event_classes[type]
      if additional_classes
        new_entry = new_entry.addClass(additional_classes)
      new_entry = new_entry.text("[" + time + "] " + type)

      $("##{container_id}").prepend(new_entry)
      console.log("Processed Tock event.")

    window.tock_event_sources.push(source)
    console.log("Registered handler for " + container_id);

$(document).on "page:before-unload", ->
  source.close() for source in window.tock_event_sources
