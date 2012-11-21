jQuery ->
  $('a.fancybox').live 'hover', ->
    $(this).fancybox({ width:850, height: 480 })
