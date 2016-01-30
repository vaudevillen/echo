
var map;
var service;
var infowindow;
var searchWord;
var chicago;


$(function() {
  $('#search').keyup(function (e) {
  searchWord = $('#search').val();
    if (e.keyCode === 13) {
      var query = $('#search').val();
      console.log(query)
      var request = {
        location: chicago,
        radius: '500',
        keyword: [query]
      }
      service.nearbySearch(request, callback);
    }
  });
});

  function initMap() {
    chicago = new google.maps.LatLng(41.885311, -87.62850019999999);
    map = new google.maps.Map(document.getElementById('map'), {
      zoom: 16,
      center: chicago
    });
    service = new google.maps.places.PlacesService(map);
  };


  function callback(results, status){
    if (status === google.maps.places.PlacesServiceStatus.OK) {
      for(var i = 0; i < results.length; i++) {
        createMarker(results[i]);
      }
    }
  };


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
  };

// Below is a function that should open a pop up windo with info we can add to it!

//   function infoWindowOptions() {
//     content: "Why did we not look for more info";
//   };

//  var infoWindow = new google.maps.InfoWindow(infoWindowOptions);
//   google.maps.event.addListener(createMarker, 'click', function(e){
//     infoWindow.open(map, marker);
//   });
