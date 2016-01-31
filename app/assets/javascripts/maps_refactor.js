///////////////////////
// Global Variables  //
///////////////////////
var map, transformers;
var chiTown = {lat: 41.885311, lng: -87.62850019999999}

////////////////////////
// Map Initialization //
////////////////////////
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {zoom: 14, center: chiTown});

  var getAjax = $.get("/pins", "json");
  getAjax.done(function(response) {
    for (var i = 0; i < response.length; i ++) {
      var pinLatlng = new google.maps.LatLng(response[i].latitude, response[i].longitude);
      placeMarker(pinLatlng);
    }
  });

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
  google.maps.event.addListener(marker,'click',function(e) { infoWindow.open(map, marker); });
  // google.maps.event.addListener(marker,'click',function(e) { console.log(marker.position); });
  // google.maps.event.addListener(marker,'click',function(e) { console.log(infoWindow.position); });
}

////////////////////
// Document Ready //
////////////////////
$(function() {
  $(document).on("click", "#song_form", function(event){
    event.preventDefault();
    var spotify_id = $(this).find('input:first-child').val();
    var data = {lat: pin_data["lat"], lng: pin_data["lng"], authenticity_token: pin_data["authenticity_token"], song_id: spotify_id};
    $.post("/pins", data);
  });
})
