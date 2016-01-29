  function initMap() {
    var myLatLng = {lat: -25.363, lng: 131.044};

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 4,
      center: myLatLng
    });
    var marker = new google.maps.Marker({
    position: myLatLng,
    map: map,
    title: 'Hello World!'
    });

    google.maps.event.addListener(map, 'click', function(event) {

       console.log(event.latLng.lat());
       console.log(event.latLng.lng());
       placeMarker(event.latLng, map);
    });
    google.maps.event.addListener(map, 'rightclick', function(e) {

      placeMarker(event.latLng, map);
  });

    function placeMarker(position, map) {
      var marker = new google.maps.Marker({
        position: position,
        map: map
      });

    }

  }
