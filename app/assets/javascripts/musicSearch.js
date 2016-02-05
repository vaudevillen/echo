$(function() {
  var lastSearch = "";
  var idleCounter = 0;
  window.setInterval(searchRefresh, 100);
  $('body').on('input', '#searchbar', function() { idleCounter = 0; })
  function searchRefresh() {
    idleCounter++;
    var query = $('#searchbar').val() || '';
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
    $('#player *').remove();
    var song_artist_title = $(this).parent()[0].innerText.split(" - ");
    var song_artist = song_artist_title[0];
    var song_title = song_artist_title[1];
    var song_uri = $(this).attr('id');
    var song_code = song_uri.replace(/spotify%3Atrack%3A/, ""); //REMOVED 'g' from REPLACE
    var format = {song_id: song_code};
    var template = Handlebars.compile($('#player-template').html());
    $('#player').append(template({spotify_uri: song_uri}))
    $('#form_type').attr("type", "submit");
    $('#form_comment').css('display', 'inherit');
    $('#form_song_id').val(song_code);
    $('#form_song_artist').val(song_artist);
    $('#form_song_title').val(song_title);
    $('#results').animate({height: 'hide'}, 100)
    $('#searchbar').animate({height: 'hide'}, 100)
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
  $('div#results').append('<ul class="song_results"></ul>');
  for (var i = 0; i < resultsToShow; i++) {
    song = {artist: json.tracks.items[i].artists[0].name,
            title: json.tracks.items[i].name,
            song_uri: encodeURIComponent(json.tracks.items[i].uri),
            song_id: json.tracks.items[i].id}
    $('.song_results').append(template(song));
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
    var address = pinData.address;
    var artist = pinData.song_artist;
    var song_title = pinData.song_title;
    var comment = pinData.comment;
    var pin_id = pinData.id;
    //after mvp, put in song data populated from database
    var playerTemplate = Handlebars.compile($('#db-player-template').html());
    return playerTemplate({pin_id: pin_id, comment: comment, song_uri: songUri, address: address, artist: artist, song_title: song_title });
  }
