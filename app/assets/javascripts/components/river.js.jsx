var Friends = React.createClass({
  render() {
    var createItem = (friend) => <li>{friend.first_name}</li>;

    return <ul>{this.props.friends.map(createItem)}</ul>;
  }
});

var Comment = React.createClass({
  render() {
    // var createItem = ({comment}) => <Comment comment={comment} />;

    return <div>{this.props.comments}</div>;
  }
});

// var River = React.createClass({
//   render() {
//     var createItem = ({comment}) => <Comment comment={comment} />;

//     return <div>{this.props.comments.map(createItem)}</div>;
//   }
// });
