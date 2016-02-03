$(document).ready(function() {
  $("#search-form").on("submit", function(e){
    e.preventDefault();
    var search = $('#search-form').serialize();
    var request = $.ajax({
                      method: "GET",
                      url: '/users',
                      data: search
                      })
    request.done(function(response){
      $(".collection").replaceWith(response);
    });
  });
});