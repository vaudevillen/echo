$(function() {
  $('#left-menu-button').on('click', function(event) {
    event.preventDefault();
    $('#left-menu').animate({width: 'show'}, 300);
    $('#right-menu').animate({width: 'hide'}, 200);
    $('#overlay').css('pointer-events', 'all');
  });
  $('#right-menu-button').on('click', function(event) {
    event.preventDefault();
    $('#right-menu').animate({width: 'show'}, 300);
    $('#left-menu').animate({width: 'hide'}, 200);
    $('#overlay').css('pointer-events', 'all');
  });
  $('#overlay').on('mousedown', function(event) {
    if (event.target !== this) {
      return
    }
    $('#left-menu').animate({width: 'hide'}, 200);
    $('#right-menu').animate({width: 'hide'}, 200);
    $(this).css('pointer-events', 'none');
  })
})
