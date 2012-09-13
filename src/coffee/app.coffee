$ ->
  $(window).bind 'scroll', (e) ->
    cogRotation = (speed,clockwise) ->
      rot = ($(window).scrollTop()*speed) % 360
      if clockwise then rot else -rot
      
    $('.mod-effect.mod-effect-left > img:first-child').css({ rotate: "#{cogRotation(0.3,true)}deg" })
    $('.mod-effect.mod-effect-left > img:last-child').css({ rotate: "#{cogRotation(0.1,false)}deg" })
    $('.mod-effect.mod-effect-right > img:first-child').css({ rotate: "#{cogRotation(0.7,false)}deg" })
    $('.mod-effect.mod-effect-right > img:last-child').css({ rotate: "#{cogRotation(0.05,true)}deg" })