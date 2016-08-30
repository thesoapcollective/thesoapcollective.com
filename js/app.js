var $body, $pageHeader, $slide, $slideNavList;
var slideCount, slideTimeout;
var isTouch = false;

$(document).ready(function() {
  $body = $('body');
  $pageHeader = $('.page-header');
  $slideNavList = $('.slide-nav-list');
  slideCount = $('.slide').length - 1;

  checkForTouch();
  setupMobileMenu();
  setupSlideNav();
  setupReelButton();
  setupProjectImages();
});

var checkForTouch = function() {
  isTouch = 'ontouchstart' in window || 'onmsgesturechange' in window;
  if (isTouch) {
    $body.addClass('is-touch');
  }
};

var setupMobileMenu = function() {
  $('.mobile-menu-arrow').click(function(event) {
    event.preventDefault();
    $pageHeader.toggleClass('mobile-menu-closed mobile-menu-opened');
  });
};

var setupReelButton = function() {
  if (!isTouch) {
    $('.watch-reel-btn').magnificPopup({
      type: "iframe"
    });
  }
};

var setupProjectImages = function() {
  $('.project-image img').unveil(100);

  if (!isTouch) {
    $('.project-image a').magnificPopup({
      type: 'image',
      gallery: { enabled: true },
      zoom: { enabled: true },
    });
  }
};

var setupSlideNav = function() {
  $('.slide-nav-link').click(function(event) {
    event.preventDefault();

    var currentIndex = $body.attr('data-active-slide');
    var newIndex = $(this).parent().index();

    if (newIndex < currentIndex || newIndex > currentIndex) {
      goToSlide(newIndex, currentIndex);
    }
  });

  startSlideTimer();
};

var startSlideTimer = function() {
  if (!$body.hasClass('is-home')) { return; }

  slideTimeout = setTimeout(function() {
    var currentIndex = $body.attr('data-active-slide');
    var newIndex = currentIndex == slideCount ? 0 : parseInt(currentIndex) + 1;
    goToSlide(newIndex, currentIndex);
  }, 10000);
};

var goToSlide = function(newIndex, currentIndex) {
  clearTimeout(slideTimeout);

  var currentSlideData = 'data-slide="' + currentIndex + '"'
  var $currentSlideBackground = $('.slide-background-container[' + currentSlideData + ']');
  var $currentSlideContent = $('.slide-content', '.slide[' + currentSlideData + ']');

  var newSlideData = 'data-slide="' + newIndex + '"'
  var $newSlideBackground = $('.slide-background-container[' + newSlideData + ']');
  var $newSlide = $('.slide[' + newSlideData + ']');
  var $newSlideContent = $('.slide-content', '.slide[' + newSlideData + ']');
  var $newSlideContentContainer = $('.slide-content-container', '.slide[' + newSlideData + ']');

  $newSlideBackground.addClass('is-opaque');
  $slideNavList.removeClass('is-opaque');

  // Wait times are based off css transition speeds.
  setTimeout(function() {
    $body.attr('data-active-slide', newIndex);

    $('.slide-background-container').removeClass('is-active is-previous is-next')
    $('.slide-background-container').each(function(index) {
      if (index < newIndex) {
        $(this).addClass('is-previous');
      } else if (index > newIndex) {
        $(this).addClass('is-next');
      } else {
        $(this).addClass('is-active');
      }
    });

    $('.slide').removeClass('is-active is-previous is-next')
    $('.slide').each(function(index) {
      if (index < newIndex) {
        $(this).addClass('is-previous');
      } else if (index > newIndex) {
        $(this).addClass('is-next');
      } else {
        $(this).addClass('is-active');
      }
    });

    $body.removeClass('theme-light theme-dark').addClass('theme-' + $newSlide.attr('data-theme'));
    $currentSlideContent.removeClass('is-opaque');

    setTimeout(function() {
      $newSlideContent.addClass('is-opaque');
      $slideNavList.appendTo($newSlideContentContainer);

      setTimeout(function() {
        $('.slide-nav-link.is-opaque').removeClass('is-opaque');
        $('.slide-nav-link:eq(' + newIndex + ')').addClass('is-opaque');
        $slideNavList.addClass('is-opaque');
        $currentSlideContent.removeClass('is-opaque');
        $currentSlideBackground.removeClass('is-opaque');
        startSlideTimer();
      }, 700); // wait for slide content to finish
    }, 300); // wait for slide background to start
  }, 250); // wait for slide nav
};
