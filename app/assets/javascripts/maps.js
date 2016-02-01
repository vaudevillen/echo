///////////////////////
// Global Variables  //
///////////////////////
var map, transformers;
var chiTown = {lat: 41.885311, lng: -87.62850019999999}
var markers = [];
var infowindows = [];
////////////////////////
// Map Initialization //
////////////////////////
function initMap(){
  map = new google.maps.Map(document.getElementById('map'), {zoom: 14, center: chiTown, zoomControl: true});

  var getAjax = $.get("/pins", "json");
  getAjax.done(function(response) {
    for (var i = 0; i < response.length; i ++) {
      placeDBMarker(response[i]);
    }
  });

//This centers map go user's browser provided current geolocation
  var locWindow = new google.maps.InfoWindow({map: map});
  if (navigator.geolocation){
    navigator.geolocation.getCurrentPosition(function(position){
      var pos = { lat: position.coords.latitude, lng: position.coords.longitude };
      locWindow.setPosition(pos);
      locWindow.setContent('You are here... I hope...');
      map.setCenter(pos);
    }, function(){
      handleLocationError(true, locWindow, map.getCenter());
    });
  }
  else { handleLocationError(false, locWindow, map.getCenter());}
//////////////////////////////////////////
//Autocomplete for search/////////////////
//////////////////////////////////////////
  var input = /** @type {!HTMLInputElement} */(document.getElementById('loc-input'));

  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.bindTo('bounds', map);
  var marker = new google.maps.Marker({
    map: map,
    anchorPoint: new google.maps.Point(0, -29)
  });

  var infowindow = new google.maps.InfoWindow();

  autocomplete.addListener('place_changed', function() {
    infowindow.close();
    marker.setVisible(false);
    var place = autocomplete.getPlace();
    if (!place.geometry) {
      window.alert("Autocomplete's returned place contains no geometry");
      return;
    }

    // If the place has a geometry, then present it on a map.
    if (place.geometry.viewport) {
      map.fitBounds(place.geometry.viewport);
    } else {
      map.setCenter(place.geometry.location);
      map.setZoom(17);  // Why 17? Because it looks good.
    }
    marker.setIcon(transformers);
    marker.setPosition(place.geometry.location);
    marker.setVisible(true);

    var address = '';
    if (place.address_components) {
      address = [
        (place.address_components[0] && place.address_components[0].short_name || ''),
        (place.address_components[1] && place.address_components[1].short_name || ''),
        (place.address_components[2] && place.address_components[2].short_name || '')
      ].join(' ');
    }
    infowindow.setContent(loadPinBox(marker));
    infowindow.setContent('<div><strong>Location: ' + place.name + '</strong><br>' + address + '</div>' + loadPinBox(marker));
    infowindow.open(map, marker);
  });

////////////////////////
///End of autocomplete//
////////////////////////

  //////////////////////
  // Event Responders //
  //////////////////////
  /// This is happening inside of initMap because this function serves almost as the
  /// "document ready" for the map.
  google.maps.event.addListener(map, 'rightclick', function(event) {
    placeMarker(event.latLng);
  });

  // This is also inside initMap because it requires that google maps has been loaded
  transformers = /** @type {google.maps.Icon} */({
    url: "http://vignette3.wikia.nocookie.net/transformers-legends/images/6/64/Favicon.ico/revision/20121030153224",
    size: new google.maps.Size(71, 71),
    origin: new google.maps.Point(0, 0),
    anchor: new google.maps.Point(17, 34),
    scaledSize: new google.maps.Size(35, 35)
  })
}

///////////////////////////
// Marker Initialization //
///////////////////////////
function placeMarker(position) {
  var marker = new google.maps.Marker({position: position, map: map});
  marker.setIcon(transformers);
  var infoWindowOptions = { content: loadPinBox(marker) };
  var infoWindow = new google.maps.InfoWindow(infoWindowOptions);
  // This is where individual click event handlers are created for each pin,
  // notice that functions defined here can see 'marker' in their scope.
  google.maps.event.addListener(marker,'click',function(e)
    {
      closeWindows();
      infoWindow.open(map, marker);
      getAddress(marker);
      infowindows.push(infoWindow);
      // console.log(marker.position);
      // console.log(infoWindow.position);
    });
  markers.push(marker);
}
function placeDBMarker(pinData) {
  var pinLatlng = new google.maps.LatLng(pinData.latitude, pinData.longitude);
  var marker = new google.maps.Marker({position: pinLatlng, map: map});
  marker.setIcon(transformers);
  var infoWindowOptions = { content: loadDBPinBox(pinData) };
  var infoWindow = new google.maps.InfoWindow(infoWindowOptions);
  // This is where individual click event handlers are created for each pin,
  // notice that functions defined here can see 'marker' in their scope.
  google.maps.event.addListener(marker,'click',function(e)
    {
      closeWindows();
      infoWindow.open(map, marker);
      infowindows.push(infoWindow);
      // console.log(marker.position);
    });
  markers.push(marker);
}
function placeFriendMarker(pinData) {
  var pinLatlng = new google.maps.LatLng(pinData.latitude, pinData.longitude);
  var marker = new google.maps.Marker({position: pinLatlng, map: map});
  marker.setIcon(transformers);
  var infoWindowOptions = { content: loadDBPinBox(pinData) };
  var infoWindow = new google.maps.InfoWindow(infoWindowOptions);
  // This is where individual click event handlers are created for each pin,
  // notice that functions defined here can see 'marker' in their scope.
  google.maps.event.addListener(marker,'click',function(e)
    {
      closeWindows();
      infoWindow.open(map, marker);
      infowindows.push(infoWindow);
    });
  markers.push(marker);
}

////////////////////
// Document Ready //
////////////////////
$(function() {

  $(document).on("submit", "#song_form", function(event)
  {
    event.preventDefault();
    var token = $('meta[name=csrf-token]').attr('content');
    var song_data = {};
    $.each($(this).serializeArray(), function(i, field)
    {
        song_data[field.name] = field.value;
    });
    var data = { lat: song_data["lat"], lng: song_data["lng"], authenticity_token: token, song_id: song_data["song_id"], comment: song_data['comment'], address: song_data['address'] };
    $.post("/pins", data);
    closeWindows();
  });

  $(".friend_pin_form").on("submit", function(event)
  {
    event.preventDefault();
    clearMarkers();
    $(this).serialize();
    var friend_id = $(this).serialize().slice(10);
    var url = "/pins/" + friend_id;
    var getAjax = $.get(url, "json");
    getAjax.done(function(response)
    {
      for (var i = 0; i < response.length; i ++)
      {
        placeFriendMarker(response[i]);
      }
    });
  });
  $(document).on("click", "#my_pins", function(event)
  {
    clearMarkers();
    var getAjax = $.get("/pins", "json");
    getAjax.done(function(response)
    {
      for (var i = 0; i < response.length; i ++)
      {
        placeDBMarker(response[i]);
      }
    });
  });
})

///////////////////////////
///Helper functions////////
///////////////////////////
//sets the map for markers in marker array. comes in handy when removing markers
function setMapOnAll(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }
}

function clearMarkers() {
  setMapOnAll(null);
}
function deleteMarkers() {
  clearMarkers();
  markers = [];
}
function closeWindows(){
  infowindows.forEach(function(window){
    window.close();
  });
  deleteWindows();
}
function deleteWindows(){
  infowindows = [];
}
function getAddress(){
  var lat = $('#song_form #latitude').val();
  var lng = $('#song_form #longitude').val();
  var url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=" + lat + "," + lng
  var getAjax = $.get(url);
  getAjax.done(function(response) {
    console.log(response.results[0])
    $('#song_form #address').val(response.results[0].formatted_address)
  })
}
