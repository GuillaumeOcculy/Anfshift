$(document).ready ->
  $('#new_comment').submit (event) ->
    event.preventDefault()

    url = $(this).attr('action')
    comment = $('#new_comment').serialize()
    console.log "HELLOOOO"
    console.log comment
    $.ajax
      type: 'POST'
      url: url
      data: comment
      dataType: 'json'
      success: (comment) ->
        console.log "HOHOH"
        console.log comment
        $('#comments').append(comment.content)
        # $("p").text(comment.content).appendTo("comments");

        # $(comment.content).appendTo('#comments')

        $('#new_comment').trigger('reset')  #Clear all fields

      error: (json) ->
        console.log 'error'
        console.log json
