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
        return <div key={key.id}>
         Comment: {key.comment} Name: {key.username}
        </div>;
      })}
    </div>)
  }
});
