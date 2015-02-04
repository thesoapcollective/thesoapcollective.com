isHome = false
isSmall = false
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
  isSmall = $win.width() <= 767 # Should match respond-to mixin
  $pageNav = $('#page-nav')
  $pageFooter = $('#page-footer')
  $work = $('#work')
  $gotoWork = $('.goto-work')
  $about = $('#about')
  $gotoAbout = $('.goto-about')
  $contact = $('#contact')
  $gotoContact = $('.goto-contact')

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

    $('.project-image img').unveil 100

    if not isSmall
      $('.project-image a').magnificPopup
        type: 'image'
        gallery:
          enabled: true
        zoom:
          enabled: true

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
