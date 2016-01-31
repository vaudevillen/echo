$(function() {
  var lastSearch = "";
  var idleCounter = 0;
  window.setInterval(searchRefresh, 100);
  $('body').on('input', '#searchbar', function() { idleCounter = 0; })
  function searchRefresh() {
    idleCounter++;
    var query = $('#searchbar').val();
    if (query == '') {
      $('#results *').remove();
    } else if (idleCounter > 2 && query != lastSearch) {
      lastSearch = query;
      trackSearch(query)
        .done(showFirstTwentySongs);
    }
  }


  $('body').on('click', '#search-box li a', function(event) {
    event.preventDefault();
    console.log("link clicked");
    $('#player *').remove();
    var song_uri = $(this).attr('id');
    var song_code = song_uri.replace(/spotify%3Atrack%3A/, ""); //REMOVED 'g' from REPLACE
    var format = {song_id: song_code};
    var template = Handlebars.compile($('#player-template').html());
    $('#player').append(template({spotify_uri: song_uri}))
    $('#form_type').attr("type", "submit");
    $('#form_song_id').val(song_code);
  })
}) //end of document ready

function trackSearch(query) {
  return $.ajax({url: "https://api.spotify.com/v1/search",
                 method: 'GET',
                 data: {q: query,
                 type: 'track'}})
}

function showFirstTwentySongs(json) {
  $('#results *').remove();
  var resultsToShow = Math.min(json.tracks.items.length, 20);
  var template = Handlebars.compile($('#song-template').html());
  $('div#results').append('<ul></ul>');
  for (var i = 0; i < resultsToShow; i++) {
    song = {artist: json.tracks.items[i].artists[0].name,
            title: json.tracks.items[i].name,
            song_uri: encodeURIComponent(json.tracks.items[i].uri),
            song_id: json.tracks.items[i].id}
    $('ul').append(template(song));
  }
}

function loadPinBox(marker) {
  var latLng = marker.position;
  var lat = latLng.lat();
  var lng = latLng.lng();
  var searchTemplate = Handlebars.compile($('#search-bar-template').html())
  return searchTemplate({lat: lat, lng: lng});
}

function loadDBPinBox(pinData) {
    var songUri = "spotify%3Atrack%3A" + pinData.song_id;
    //after mvp, put in song data populated from database
    var playerTemplate = Handlebars.compile($('#db-player-template').html());
    return playerTemplate({song_uri: songUri, });
  }
