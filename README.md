# Echo
Echo is a social media web-app that maps the intersection of songs, places, and memories. Users can select a location and add a song and comment to that location, sharing their songs, impressions, and echoes of their memories.

Visit the site here:
https://dbc-echo.herokuapp.com

## Team
The members of Echo are [Josh Shin](http://github.com/jjshin85), [Will Granger](https://github.com/wgranger), [Michael Jasinski](https://github.com/Michael-Jas), [Timothy Meixell](https://github.com/misternu), and [Ryan Zell](https://github.com/RedZulu).

##Technology/Tools
Echo was built using Ruby on Rails, Javascript, jQuery, React.js, as well as the Spotify and Google Maps APIs.

Capybara and Rspec were used for testing.

##Leaving Echoes
After registering, users can leave echoes in two ways:

The user can right click on any location on the map to leave an echo there.
![right-click](https://s3.amazonaws.com/dbc-echo/readme-images/right-click.png)

They can use the Google Search bar at the top of the page to search for a location to place an echo.
![echo-location](https://s3.amazonaws.com/dbc-echo/readme-images/echo_location.png)

Then the map will zoom to that location and a marker with the user's profile picture will appear. Connected to this marker will be an window with a Spotify search bar.
![spotify-search](https://s3.amazonaws.com/dbc-echo/readme-images/song-search.png)

After a user selects a song, they can add a comment, sharing their memories and experiences about the song.
![entering-comment](https://s3.amazonaws.com/dbc-echo/readme-images/song-comment.png)

After saving, a user can click on the marker, and the song title and location will appear in a window.
![post-save-echo](https://s3.amazonaws.com/dbc-echo/readme-images/after-pinned-infowindow.png)

From there, the user can select the song and it will open up and present the song as well as the user's comment. The user can also click on the song and it will play in the user's Spotify app.

##Viewing Friends' Echoes
In the upper right corner there is an icon that will open up a sidebar. There, users can select which echoes to view, whether it's their own, a friend's, multiple friends', or everyone's echoes.

Users can easily identify whose echoes are whose because each is represented by the individual user's profile picture.

![mult-users](https://s3.amazonaws.com/dbc-echo/readme-images/selecting-multiple-users-echoes.png)

In the upper right corner, the icon will open up the comments sidebar. There, a user can see all of their friends comments, locations and songs of their echoes.

![river-sidebar](https://s3.amazonaws.com/dbc-echo/readme-images/comment-river.png)

If they click on a comment, the map will automatically recenter onto that echo's location.
![river-redirect](https://s3.amazonaws.com/dbc-echo/readme-images/river-redirect.png)
