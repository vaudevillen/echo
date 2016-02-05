var SetIntervalMixin = {
  componentWillMount: function() {
    this.intervals = [];
  },
  setInterval: function() {
    this.intervals.push(setInterval.apply(null, arguments));
  },
  componentWillUnmount: function() {
    this.intervals.forEach(clearInterval);
  }
};

// React Comp called in _navbar
var Comment = React.createClass({

  mixins: [SetIntervalMixin],
  getInitialState: function(){
    return {seconds: 0,  pins: this.props.pins};
  },

  componentDidMount: function(){
    this.setInterval(this.comment, 5000);
  },

  comment: function(){
    $.ajax({
      url: "/maps",
      dataType: 'json',
      type: 'GET',
      cache: false,
      success: function(data){
        this.setState({pins: data});
      }.bind(this)
    });

  },
  render: function() {
     return (<div>{this.state.pins.map(function (key, value){
        return <div className="river_div" key={key.id} data-lat={key.latitude} data-lng={key.longitude} data-user-id={key.user_id}>
          <p className='river'><span className="river-user">{key.username}</span> @ <span class="river-loc">{key.address}</span></p>
          <p className='river'><span className="river-song-info">{key.song_artist} - {key.song_title}</span></p>
          <p className='river'><span className="river-comment">{key.comment}</span></p>
        </div>;
      })}
    </div>)
  }
});
