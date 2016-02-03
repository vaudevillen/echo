$(function() {
  $('#left-menu-button').on('click', function() {
    event.preventDefault();
    $('#left-menu').toggle();
    $('#overlay').css('pointer-events', 'all');
  });
  $('#right-menu-button').on('click', function() {
    event.preventDefault();
    $('#right-menu').toggle();
    $('#overlay').css('pointer-events', 'all');
  });
  $('#overlay').on('mousedown', function(e) {
    if (e.target !== this) {
      return
    }
    $('#left-menu').hide();
    $('#right-menu').hide();
    $(this).css('pointer-events', 'none');
  })
})
