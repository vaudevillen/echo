var River = React.createClass({


  // getInitialState: function(){
  //   console.log(this.props);
  // },

  render: function(){
    return(
    <div>
    <h5> This is from React!</h5>
    </div>
    );
  }
});

ReactDOM.render(
  <River url='/maps' />,
  document.getElementById('river')
);
