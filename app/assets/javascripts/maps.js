// var map;
// var chiTown = {lat: 41.885311, lng: 87.62850019999999}
// function initMap() {
// var pin_data;

//   map = new google.maps.Map(document.getElementById('map'),
//   {
//     zoom: 14,
//     center: chiTown
//   });
//   var input = /** @type {!HTMLInputElement} */(
//       document.getElementById('loc-input'));

//   var autocomplete = new google.maps.places.Autocomplete(input);
//   autocomplete.bindTo('bounds', map);
//   var infowindow = new google.maps.InfoWindow();
//   var marker = new google.maps.Marker({
//     map: map,
//     anchorPoint: new google.maps.Point(0, -29)
//   });

//   autocomplete.addListener('place_changed', function() {
//     infowindow.close();
//     marker.setVisible(false);
//     var place = autocomplete.getPlace();
//     if (!place.geometry) {
//       window.alert("Autocomplete's returned place contains no geometry");
//       return;
//     }

//     // If the place has a geometry, then present it on a map.
//     if (place.geometry.viewport) {
//       map.fitBounds(place.geometry.viewport);
//     } else {
//       map.setCenter(place.geometry.location);
//       map.setZoom(17);  // Why 17? Because it looks good.
//     }
//     marker.setIcon(/** @type {google.maps.Icon} */({
//       url: "http://vignette3.wikia.nocookie.net/transformers-legends/images/6/64/Favicon.ico/revision/20121030153224",
//       size: new google.maps.Size(71, 71),
//       origin: new google.maps.Point(0, 0),
//       anchor: new google.maps.Point(17, 34),
//       scaledSize: new google.maps.Size(35, 35)
//     }));
//     marker.setPosition(place.geometry.location);
//     marker.setVisible(true);

//     var address = '';
//     if (place.address_components) {
//       address = [
//         (place.address_components[0] && place.address_components[0].short_name || ''),
//         (place.address_components[1] && place.address_components[1].short_name || ''),
//         (place.address_components[2] && place.address_components[2].short_name || '')
//       ].join(' ');
//     }

//     infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
//     infowindow.open(map, marker);
//   });

// //get user's pins from database
//   var getAjax = $.get("/pins", "json");
//   getAjax.done(function(response)
//   {
//     if (response.length > 0)
//     {
//       for (var i = 0; i < response.length; i ++)
//       {
//         var pinLatlng = new google.maps.LatLng(response[i].latitude, response[i].longitude);
//         initMarkers(pinLatlng, map);
//       }
//     }
//   });

//     //sets position of map to current location
//   var locWindow = new google.maps.InfoWindow({map: map});
//   if (navigator.geolocation)
//   {
//     navigator.geolocation.getCurrentPosition(function(position)
//     {
//       var pos =
//       {
//         lat: position.coords.latitude,
//         lng: position.coords.longitude
//       };
//       locWindow.setPosition(pos);
//       locWindow.setContent('You are here... I hope...');
//       map.setCenter(pos);
//     }, function()
//     {
//       handleLocationError(true, locWindow, map.getCenter());
//     });
//   }
//   else
//   {
//     // Browser doesn't support Geolocation
//     handleLocationError(false, locWindow, map.getCenter());
//   }

//   //add pins
//   google.maps.event.addListener(map, 'rightclick', function(event)
//   {
//     console.log(event.latLng);
//     placeMarker(event.latLng, map);
//     var token = $('meta[name=csrf-token]').attr('content');
//     pin_data = {lat: event.latLng.lat(), lng: event.latLng.lng(), authenticity_token: token}
//   });
//   //function to instantiate pins from database
//   function initMarkers(position, map)
//   {
//     var marker = new google.maps.Marker(
//     {
//       position: position,
//       map: map
//     });
//     marker.setIcon(/** @type {google.maps.Icon} */({
//       url: "http://vignette3.wikia.nocookie.net/transformers-legends/images/6/64/Favicon.ico/revision/20121030153224",
//       size: new google.maps.Size(71, 71),
//       origin: new google.maps.Point(0, 0),
//       anchor: new google.maps.Point(17, 34),
//       scaledSize: new google.maps.Size(35, 35)
//     }));
//     var infoWindowOptions =
//     {
//       content: loadPinBox()
//     };
//     var infoWindow = new google.maps.InfoWindow(infoWindowOptions);

//     google.maps.event.addListener(marker,'click',function(e)
//     {
//       infoWindow.open(map, marker);
//     });
//   }
//   function placeMarker(position, map)
//   {
//     var marker = new google.maps.Marker(
//     {
//       position: position,
//       map: map
//     });
//     marker.setIcon(/** @type {google.maps.Icon} */({
//       url: "http://vignette3.wikia.nocookie.net/transformers-legends/images/6/64/Favicon.ico/revision/20121030153224",
//       size: new google.maps.Size(71, 71),
//       origin: new google.maps.Point(0, 0),
//       anchor: new google.maps.Point(17, 34),
//       scaledSize: new google.maps.Size(35, 35)
//     }));
//     var infoWindowOptions =
//     {
//       content: loadPinBox()
//     };
//     var infoWindow = new google.maps.InfoWindow(infoWindowOptions);

//     google.maps.event.addListener(marker,'click',function(e)
//     {
//       infoWindow.open(map, marker);
//     });
//   }
//   //intercept data from song submit form
//   $(document).on("click", "#song_form", function(event){
//     event.preventDefault();
//     var spotify_id = $(this).find('input:first-child').val();
//     var data = {lat: pin_data["lat"], lng: pin_data["lng"], authenticity_token: pin_data["authenticity_token"], song_id: spotify_id};
//     $.post("/pins", data);
//   });
// };//closing of initMap function


// //
