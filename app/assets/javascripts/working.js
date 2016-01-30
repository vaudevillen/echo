  // Add input from the user into the search bar

// $(function() {
//   $('#search').keyup(function (e) {
//   searchWord = $('#search').val();
//     if (e.keyCode === 13) {
//       var query = $('#search').val();
//       console.log(query)
//       var request = {
//         location: chicago,
//         radius: '500',
//         query: [query]
//       }
//       service.textSearch(request);
//     }
//   });
// });

// function initMap() {
//   chicago = new google.maps.LatLng(41.885311, -87.62850019999999);
//   map = new google.maps.Map(document.getElementById('map'), {
//     zoom: 16,
//     center: chicago
//   });

//   service = new google.maps.places.PlacesService(map);

//   var input = /** @type {!HTMLInputElement} */(
//     document.getElementById('pac-input'));

//   var types = document.getElementById('pac-input');
//   map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
//   map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);

//   // creation on the auto complete bar
//   var autocomplete = new google.maps.places.Autocomplete(input);
//   autocomplete.bindTo('bounds', map);

//   var infowindow = new google.maps.InfoWindow();
//   var marker = new google.maps.Marker({
//   map: map,
//   anchorPoint: new google.maps.Point(0,-29)
//   });

//   autocomplete.addListener('place_changed', function() {
//     infowindow.close();
//     marker.setVisible(false);
//     var place = autocomplete.getPlace();
//     if (!place.geometry) {
//       window.alert("Pow Right in the Kisser!");
//       return;
//     }

//     if (place.geometry.viewport){
//       map.fitBounds(place.geometry.viewport);
//     } else {
//       map.setCenter(place.geometry.location);
//       map.setZoom(15);
//     }

//     marker.setPosition(place.geometry.location);
//     marker.setVisible(true);

//     var address = "";
//     if (place.address_components) {
//       address = [
//         (place.address_components[0] && place.address_components[0].short_name || ''),
//         (place.address_components[1] && place.address_components[1].short_name || ''),
//         (place.address_components[2] && place.address_components[2].short_name || '')
//       ].join(' ');
//     }


//   });



// };
// function callback(results, status){
//   if (status === google.maps.places.PlacesServiceStatus.OK) {
//     for(var i = 0; i < results.length; i++) {
//       createMarker(results[i]);
//     }
//   }
// };
