jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 308
        $('.pagination').text(" ")
        $.getScript(url)
    $(window).scroll()
