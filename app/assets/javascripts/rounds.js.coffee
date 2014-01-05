ready = ->
  $('.card').click ->
    $('#answer_id').val($(this).attr('id'))
    $('#responseform').submit()
    false

$(document).ready(ready)
$(document).on('page:load', ready)
