$(document).ready(function() {
  $('.input').on('focus', function() {
    $('.login').addClass('clicked');
  });
  $('.login').on('submit', function(e) {
    $('.login').removeClass('clicked').addClass('loading');
  });
});
