var myLatLng;
var map;
var service;
var infowindow;
var searchWord;
//search bar execution
$(function()
{
  $('#search').keyup(function (e)
  {
    searchWord = $('#search').val();
      if (e.keyCode === 13)
      {
        var query = $('#search').val();
        console.log(query)
        var request =
        {
          location: myLatLng,
          radius: '500',
          query: [query]
        }
        service.textSearch(request, callback);
      }
  });
});

//Initialize map
function initMap()
{


  myLatLng = {lat: 41.885311, lng: 87.62850019999999};

  map = new google.maps.Map(document.getElementById('map'),
  {
    zoom: 14,
    center: myLatLng
  });
  //service necessary for search function
  service = new google.maps.places.PlacesService(map);

  //get user's pins from database
  var getAjax = $.get("/pins", "json");
  getAjax.done(function(response)
  {
    if (response.length > 0)
    {
      for (var i = 0; i < response.length; i ++)
      {
        var pinLatlng = new google.maps.LatLng(response[i].latitude, response[i].longitude);
        placeMarker(pinLatlng, map);
      }
    }
  });

  //add pins
  google.maps.event.addListener(map, 'rightclick', function(event)
  {
    console.log(event.latLng);
    placeMarker(event.latLng, map);
    var token = $('meta[name=csrf-token]').attr('content');
    var data = {lat: event.latLng.lat(), lng: event.latLng.lng(), authenticity_token: token}
    $.post("/pins", data);
  });
  //function for users to add pins. called in above listener
  function placeMarker(position, map)
  {
    var marker = new google.maps.Marker(
    {
      position: position,
      map: map
    });
    var infoWindowOptions =
    {
      content: 'https://www.google.com'
    };
    var infoWindow = new google.maps.InfoWindow(infoWindowOptions);

    google.maps.event.addListener(marker,'click',function(e)
    {
      infoWindow.open(map, marker);
    });
  }
  //sets position of map to current location
  var locWindow = new google.maps.InfoWindow({map: map});
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      locWindow.setPosition(pos);
      locWindow.setContent('Location found.');
      map.setCenter(pos);
    }, function() {
      handleLocationError(true, locWindow, map.getCenter());
    });
  } else {
    // Browser doesn't support Geolocation
    handleLocationError(false, locWindow, map.getCenter());
  }

};//closing of initMap function

function callback(results, status)
{
  if (status === google.maps.places.PlacesServiceStatus.OK)
  {
    for(var i = 0; i < results.length; i++)
    {
      createSearchMarker(results[i]);
    }
  }
};

// Create the marker that has the info box that pops up!
function createSearchMarker(place) {
  var marker = new google.maps.Marker(
  {
    map: map,
    position: place.geometry.location
  });
  var infoWindowOptions =
  {
    content: 'https://www.youtube.com/watch?v=9f16Fw_K45s'
  };
  var infoWindow = new google.maps.InfoWindow(infoWindowOptions);

  google.maps.event.addListener(marker,'click',function(e)
  {
    infoWindow.open(map, marker);
  });

};


