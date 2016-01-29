  // function initMap() {
  //   var myLatLng = {lat: -25.363, lng: 131.044};

  //   var map = new google.maps.Map(document.getElementById('map'), {
  //     zoom: 4,
  //     center: myLatLng
  //   });
  //   var marker = new google.maps.Marker({
  //   position: myLatLng,
  //   map: map,
  //   title: 'Hello World!'
  //   });

  //   google.maps.event.addListener(map, 'click', function(event) {

  //      console.log(event.latLng.lat());
  //      console.log(event.latLng.lng());
  //      placeMarker(event.latLng, map);
  //   });
  //   google.maps.event.addListener(map, 'rightclick', function(e) {

  //     placeMarker(event.latLng, map);
  // });

  //   function placeMarker(position, map) {
  //     var marker = new google.maps.Marker({
  //       position: position,
  //       map: map
  //     });

  //   }

  // }


  var map;
  var service;
  var infowindow;

  function initMap() {
    var chicago = new google.maps.LatLng(41.885311, -87.62850019999999);

    map = new google.maps.Map(document.getElementById('map'), {
      zoom: 16,
      center: chicago
    });

    var request = {
      location: chicago,
      radius: '500',
      keyword: ['pizza']
    };

    service = new google.maps.places.PlacesService(map);
    service.nearbySearch(request, callback);
  }


  function callback(results, status){
    if (status === google.maps.places.PlacesServiceStatus.OK) {
      for(var i = 0; i < results.length; i++) {
        createMarker(results[i]);
      }
    }
  }

  function createMarker(place) {
    var placeLoc = place.geometry.location;
    var marker = new google.maps.Marker({
      map: map,
      position: place.geometry.location
    });

    google.maps.event.addListener(marker, 'click', function() {
      infowindow.setContent(place.name);
      infowindow.open(map, this);
    });
  }



  //   var marker = new google.maps.Marker({
  //   position: chicago,
  //   map: map,
  //   title: 'Hello World!'
  //   });

  //   google.maps.event.addListener(map, 'click', function(event) {

  //      console.log(event.latLng.lat());
  //      console.log(event.latLng.lng());
  //      placeMarker(event.latLng, map);
  //   });

  //   function placeMarker(position, map) {
  //     var marker = new google.maps.Marker({
  //       position: position,
  //       map: map
  //     });
  //   }

  // }
