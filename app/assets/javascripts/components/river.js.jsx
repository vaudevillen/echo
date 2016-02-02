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
  render() {
    console.log(this.state.pins);
     return (<div>{this.state.pins.map(function (key, value){
        return <div className="river_div" key={key.id}>
         <p className='river'>{key.username} @ {key.location} {key.address} Click here Song: {key.artist} - {key.comment}</p>
         <p className="river_lat" display="none">{key.latitude}</p>
         <p className="river_lng" display="none">{key.longitude}</p>
        </div>;
      })}
    </div>)
  }
});
