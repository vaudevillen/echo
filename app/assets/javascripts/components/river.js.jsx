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
    console.log(this.state.pins);
     return (<div>{this.state.pins.map(function (key, value){
        return <div className="river_div" key={key.id} data-lat={key.latitude} data-lng={key.longitude}>
         <p className='river'>{key.username} @ {key.location} {key.address} Click here Song: {key.artist} - {key.comment}</p>
        </div>;
      })}
    </div>)
  }
});
