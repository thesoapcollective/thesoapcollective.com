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
    event.preventDefault()
    $('html, body').animate
      scrollTop: 0
    , 500

  $('.goto-work').click (event) ->
    event.preventDefault()
    $('html, body').animate
      scrollTop: Math.floor($work.offset().top)
    , 500

  $('.goto-projects').click (event) ->
    event.preventDefault()
    $('html, body').animate
      scrollTop: Math.floor($work.offset().top)
    , 500

  $('.goto-about').click (event) ->
    event.preventDefault()
    $('html, body').animate
      scrollTop: Math.floor($about.offset().top)
    , 500

  $('.goto-contact').click (event) ->
    event.preventDefault()
    $('html, body').animate
      scrollTop: Math.floor($contact.offset().top)
    , 500

refreshNavbar = ->
  $pageNav.toggleClass 'is-scrolling', $win.scrollTop() > 0

  isAtBottom = (window.innerHeight + window.scrollY) >= document.body.offsetHeight
  isAtWork = $win.scrollTop() >= Math.floor($work.offset().top) and $win.scrollTop() < Math.floor($about.offset().top)
  isAtAbout = $win.scrollTop() >= Math.floor($about.offset().top) and $win.scrollTop() < Math.floor($contact.offset().top) and not isAtBottom
  isAtContact = $win.scrollTop() >= Math.floor($contact.offset().top) or isAtBottom

  $gotoWork.toggleClass 'is-selected', isAtWork
  $gotoAbout.toggleClass 'is-selected', isAtAbout
  $gotoContact.toggleClass 'is-selected', isAtContact

  $('a').blur()
