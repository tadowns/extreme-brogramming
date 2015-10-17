window.LiftKit.components.AddWorkout = React.createClass({
  getInitialState: function() {
    return {
      exercises: []
    };
  },

  cancelEnter: function(event) {
    if (event.which == 13) event.preventDefault();
  },

  addExercise: function(event) {
    event.preventDefault();

    var setsNode = React.findDOMNode(this.refs.setsInput);
    var repsNode = React.findDOMNode(this.refs.repsInput);

    var newState = React.addons.update(this.state, {
      exercises: {
        $push: [{ exercise_type_id: 1, sets: setsNode.value, reps: repsNode.value }]
      }
    });

    this.setState(newState);

    setsNode.value = "";
    repsNode.value = "";
  },

  createWorkoutType: function(event) {
    event.preventDefault();

    var nameNode = React.findDOMNode(this.refs.nameInput);

    var postData = {
      workout_type: {
        name: nameNode.value,
        workout_exercises_attributes: this.state.exercises
      }
    };

    $.post(window.LiftKit.apiEndpoint + "workout_types", postData, function(data) {
      window.location = "/start";
    });
  },

  render: function() {
    var ExerciseNodes = this.state.exercises.map(function(exercise, index) {
      return (
        <tr key={"exercise_" + index}>
          <td>{"Deadlift"}</td>
          <td>{exercise.sets}</td>
          <td>{exercise.reps}</td>
        </tr>
      )
    });

    return (
      <div>
        <h1>Add a workout</h1>

        <p>
          Workouts group exercises together with a common name, so when you are
          ready to work out,
          <br />
          they provide a template to keep track of progress for a workout.
          <br />
          Exercises can be added and removed from workouts when tracking them.
        </p>

        <form>
          <input ref="nameInput" onKeyPress={this.cancelEnter} type="text" placeholder="name of workout" />

          <hr />

          <div className="exercises">
            <h3>Exercises</h3>

            <p>
              <select>
                <option>Deadlift</option>
              </select>
              <input ref="setsInput" onKeyPress={this.cancelEnter} type="text" placeholder="sets" />
              <input ref="repsInput" onKeyPress={this.cancelEnter} type="text" placeholder="reps" />
              <a href onClick={this.addExercise}>Add exercise</a>
            </p>

            <table>
              <thead>
                <tr>
                  <th>Exercise</th>
                  <th>Sets</th>
                  <th>Reps</th>
                </tr>
              </thead>

              <tbody>
                {ExerciseNodes}
              </tbody>
            </table>
          </div>

          <br />

          <input onClick={this.createWorkoutType} type="submit" />
        </form>
      </div>
    );
  }
});
