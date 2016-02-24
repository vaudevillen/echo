$(document).ready(function() {
  $("#search-form").on("submit", function(e){
    e.preventDefault();
    var search = $('#search-form').serialize();
    var request = $.ajax({
                      method: "GET",
                      url: '/users',
                      data: search
                      })
    console.log(request);
    request.done(function(response){
      $(".collection").replaceWith(response);
    });
  });
});