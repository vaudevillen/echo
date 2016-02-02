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
      console.log(response)
      $(".collection").replaceWith(response);
    });
  });
});

 $(document).on("click", ".prof_div", function(event){
    var profileLat = $(this).children(".prof_lat").text();
    var profileLng = $(this).children(".prof_lng").text();

    map.setCenter({lat: parseFloat(profileLat), lng: parseFloat(profileLng)});
  });
