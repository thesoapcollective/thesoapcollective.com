isHome = false
isPhone = false
isTablet = false
$win = null
$pageNav = null
$pageFooter = null
$work = null
$gotoWork = null
$about = null
$gotoAbout = null
$contact = null
$gotoContact = null

$(document).ready ->
  $win = $(window)
  isHome = $('body.index').length
  isTablet = $win.width() <= 767 # Should match respond-to mixin
  isPhone = $win.width() <= 459 # Should match respond-to mixin
  $pageNav = $('#page-nav')
  $pageFooter = $('#page-footer')
  $work = $('#work')
  $gotoWork = $('.goto-work')
  $about = $('#about')
  $gotoAbout = $('.goto-about')
  $contact = $('#contact')
  $gotoContact = $('.goto-contact')

  # If hitting a deep link, take us there
  if isHome
    if window.location.pathname == '/work' and $work.length
      $('html, body').animate
        scrollTop: Math.floor($work.offset().top)
      , 500
    else if window.location.pathname == '/about' and $about.length
      $('html, body').animate
        scrollTop: Math.floor($about.offset().top)
      , 500
    else if window.location.pathname == '/contact' and $contact.length
      $('html, body').animate
        scrollTop: Math.floor($contact.offset().top)
      , 500

  $win.scroll $.throttle(250, refreshNavbar)
  refreshNavbar()

  $('.logo').click (event) ->
    if isHome
      event.preventDefault()
      if window.history.pushState
        window.history.pushState null, '', '/'
      $('html, body').animate
        scrollTop: 0
      , 500

  $('.goto-work').click (event) ->
    if isHome
      event.preventDefault()
      if window.history.pushState
        window.history.pushState null, '', '/work'
      $('html, body').animate
        scrollTop: Math.floor($work.offset().top)
      , 500

  $('.goto-projects').click (event) ->
    if isHome
      event.preventDefault()
      if window.history.pushState
        window.history.pushState null, '', '/work'
      $('html, body').animate
        scrollTop: Math.floor($work.offset().top)
      , 500

  $('.goto-about').click (event) ->
    if isHome
      event.preventDefault()
      if window.history.pushState
        window.history.pushState null, '', '/about'
      $('html, body').animate
        scrollTop: Math.floor($about.offset().top)
      , 500

  $('.goto-contact').click (event) ->
    if isHome
      event.preventDefault()
      if window.history.pushState
        window.history.pushState null, '', '/contact'
      $('html, body').animate
        scrollTop: Math.floor($contact.offset().top)
      , 500

  if $('.role-list').length
    $pageNav.addClass 'not-fixed'

    if not isTablet and not isPhone
      $('.project-image a').magnificPopup
        type: 'image'
        gallery:
          enabled: true
        zoom:
          enabled: true

    if isPhone
      $('.project-image').each (i) ->
        $this = $(this)
        $a = $this.find('a')
        $img = $this.find('img')
        currentSrc = $a.attr 'href'
        newSrc = currentSrc.replace('/role/', '/role/plain/')
        newSrc = newSrc.replace('.png', '.jpg')

        $img.attr 'src', $img.attr('src').replace('phone_', 'plain_')
        $img.attr 'data-src', newSrc
        $a.attr 'href', newSrc

    $('.project-image img').unveil 100

refreshNavbar = ->
  $pageNav.toggleClass 'is-scrolling', $win.scrollTop() > 0

  if $work.length or $about.length or $contact.length
    isAtBottom = (window.innerHeight + window.scrollY) >= document.body.offsetHeight
    isAtWork = $win.scrollTop() >= Math.floor($work.offset().top) and $win.scrollTop() < Math.floor($about.offset().top)
    isAtAbout = $win.scrollTop() >= Math.floor($about.offset().top) and $win.scrollTop() < Math.floor($contact.offset().top) and not isAtBottom
    isAtContact = $win.scrollTop() >= Math.floor($contact.offset().top) or isAtBottom

    $gotoWork.toggleClass 'is-selected', isAtWork
    $gotoAbout.toggleClass 'is-selected', isAtAbout
    $gotoContact.toggleClass 'is-selected', isAtContact

  $('a').blur()
