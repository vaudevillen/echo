$(function() {
  $('input').focus();
  $('input').keyup(function (e) {
    var query = $('input').val()
    if (e.keyCode == 13 && query != '') {
      trackSearch(query) //Search for the track
        // .done(showFirstAlbumCover);
        .done(showFirstTwentySongs);
    } else if (e.keyCode == 27) {
      $('input').val(''); //Clear the input on escape
    }
  })



  var lastSearch = "";
  var idleCounter = 0;
  window.setInterval(CheckIdleTime, 100);
  $('input').on('input', function() {
    idleCounter = 0;
  })
  function CheckIdleTime() {
    idleCounter++;
    var query = $('input').val();
    if (query == '') {
      removeResults();
    } else if (idleCounter > 2 && query != lastSearch) {
      lastSearch = query;
      trackSearch(query)
        .done(showFirstTwentySongs);
    }
  }


  $('body').on('click', 'li a', function(event) {
    event.preventDefault();
    $('#player *').remove();
    var song_uri = $(this).attr('id');
    var song_code = song_uri.replace(/spotify%3Atrack%3A/, "");
    var format = {song_id: song_code};
    var template = Handlebars.compile($('#player-template').html());
    $('#player').append(template({spotify_uri: song_uri}))

   // $.ajax({
   //      url : "/pinss",
   //      type : "post",
   //      data :  format
   //  });
   // $('#results *').remove();
  })
})

function trackSearch(query) {
  return $.ajax({url: "https://api.spotify.com/v1/search",
                 method: 'GET',
                 data: {q: query,
                 type: 'track'}})
}

function showFirstAlbumCover(json) {
  removeResults();
  $('div#results').append("<img src='" + json.tracks.items[0].album.images[1].url + "'>")
}

function showFirstTwentySongs(json) {
  removeResults();
  var resultsToShow = Math.min(json.tracks.items.length, 20);
  var template = Handlebars.compile($('#song-template').html());
  var i
  $('div#results').append('<ul></ul>');
  for (i = 0; i < resultsToShow; i++) {
    song = {artist: json.tracks.items[i].artists[0].name,
            title: json.tracks.items[i].name,
            song_uri: encodeURIComponent(json.tracks.items[i].uri),
            song_id: json.tracks.items[i].id}
    $('ul').append(template(song));
  }
}

function removeResults() {
  $('#results *').remove();
}

function Song(artist, name, spotify_id) {
  this.artist = artist;
  this.name = name;
  this.spotify_id = spotify_id;
}