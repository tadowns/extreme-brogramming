window.LiftKit.components.Lift = React.createClass({
  getInitialState: function() {
    return {};
  },

  render: function() {
    return (
      <h1>{ this.props.lift }</h1>
    );
  }
});
