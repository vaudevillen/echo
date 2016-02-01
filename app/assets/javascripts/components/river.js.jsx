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
    console.log(this.props.pins);

    return {seconds: 0,  pins: this.props.pins};
  },

  componentDidMount: function(){
    this.setInterval(this.comment, 5000);
  },

  comment: function(){
    this.props.pins.push({comment: "willy nilly"})
    this.setState({pins: this.props.pins});
  },

  render() {
    console.log(this.state.pins);
     return (<div>{this.state.pins.map(function (key, value){
        return <div key={key.id}>
         Name: {key.comment}
        </div>;
      })}
    </div>)
  }
});
