window.LiftKit.components.AddWorkoutExercise = React.createClass({
  getInitialState: function() {
    return {
      setsInput: '',
      repsInput: ''
    };
  },

  render: function() {
    var options = ["Deadlift"].map(function(opt) {
      return (<option>{opt}</option>);
    });

    return (
      <p>
        <select>
          {options}
        </select>

        <input type="text" placeholder="sets" val={this.state.setsInput} />
        <input type="text" placeholder="reps" val={this.state.repsInput} />

        <a href onClick={this.addExercise}>Add exercise</a>
      </p>
    );
  }
});
