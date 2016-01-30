 function initMap() {
    var myLatLng = {lat: 41.88493208586154, lng: -87.63472080230713};

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 14,
      center: myLatLng
    });


    var getAjax = $.get("/pins", "json");

    getAjax.done(function(response){
      if (response.length > 0){
        for (var i = 0; i < response.length; i ++){
          var pinLatlng = new google.maps.LatLng(response[i].latitude, response[i].longitude);
          placeMarker(pinLatlng, map);
        }
      }
    });

    google.maps.event.addListener(map, 'rightclick', function(event) {
      placeMarker(event.latLng, map);
      var token = $('meta[name=csrf-token]').attr('content');
      var data = {lat: event.latLng.lat(), lng: event.latLng.lng(), authenticity_token: token}
      $.post("/pins", data);
    });

    function placeMarker(position, map) {
      var marker = new google.maps.Marker({
        position: position,
        map: map
      });
    }
  }
