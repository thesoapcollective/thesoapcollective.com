$(document).ready(function() {
  var isTouch = 'ontouchstart' in window || 'onmsgesturechange' in window;
  // Are we on a touch device?
  if (isTouch) {
    $('body').addClass('is-touch');
  }
});
