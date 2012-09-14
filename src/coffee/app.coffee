$ ->
  ((d, s, id) ->
    js = undefined
    fjs = d.getElementsByTagName(s)[0]
    return  if d.getElementById(id)
    js = d.createElement(s)
    js.id = id
    js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&appId=285710731543614"
    fjs.parentNode.insertBefore js, fjs
  ) document, "script", "facebook-jssdk"
  
  $(window).bind 'scroll', (e) ->
    cogRotation = (speed,clockwise) ->
      rot = ($(window).scrollTop()*speed) % 360
      if clockwise then rot else -rot
      
    $('.mod-effect.mod-effect-left > img:first-child').css({ rotate: "#{cogRotation(0.3,true)}deg" })
    $('.mod-effect.mod-effect-left > img:last-child').css({ rotate: "#{cogRotation(0.1,false)}deg" })
    $('.mod-effect.mod-effect-right > img:first-child').css({ rotate: "#{cogRotation(0.5,false)}deg" })
    $('.mod-effect.mod-effect-right > img:last-child').css({ rotate: "#{cogRotation(0.05,true)}deg" })
    
    