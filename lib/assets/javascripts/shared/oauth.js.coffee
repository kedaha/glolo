# window.heyo = true

# $ ->
#   $.ajax
#     url: window.location.protocol + '//apis.google.com/js/client:plus.js?onload=gpAsyncInit'
#     dataType: 'script'
#     cache: true

# window.gpAsyncInit = ->
#   $('.googleplus-signin').click (e) ->
#     e.preventDefault()
#     gapi.auth.authorize({
#       immediate: true
#       response_type: 'code'
#       cookie_policy: 'single_host_origin'
#       client_id: '743138004099-pniorr0gne879hgg9h7qpgqlkac10pca.apps.googleusercontent.com'
#       scope: 'email profile'
#     }, (response) ->
#       if (response && !response.error)
#         # google authentication succeed, now post data to server and handle data securely
#         $.ajax
#           type: 'POST'
#           url: "/auth/google_oauth2/callback"
#           dataType: 'json'
#           data: response
#           success: ->
#             console.log('successfully posted to google_oauth/callback')
#             # response from server
#       else
#         console.log('auth failed')
#     )
