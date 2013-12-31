$ ->
  window.location = $('#sign_out').attr("href") if (forceFacebookLogout == true)

  $('#newgame').click ->
    $('#gameform').show()
    $('#newgame').hide()
    $(".chosen").chosen ->
      width: "100%"

    false

  $('#creategame').click ->
    $('#users').val(JSON.stringify($('#userlist').val()))
    $('#gameform').submit()
    false
