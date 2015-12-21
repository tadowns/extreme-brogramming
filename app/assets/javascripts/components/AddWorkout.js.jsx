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

    var exerciseNode = React.findDOMNode(this.refs.exerciseInput);
    var setsNode = React.findDOMNode(this.refs.setsInput);
    var repsNode = React.findDOMNode(this.refs.repsInput);

    var newState = React.addons.update(this.state, {
      exercises: {
        $push: [{ name: exerciseNode.value, target_sets: setsNode.value, target_reps: repsNode.value }]
      }
    });

    this.setState(newState);

    setsNode.value = "";
    repsNode.value = "";
  },

  createWorkout: function(event) {
    event.preventDefault();

    var nameNode = React.findDOMNode(this.refs.nameInput);

    var postData = {
      workout: {
        name: nameNode.value,
        workout_exercises_attributes: this.state.exercises
      }
    };

    $.post(window.LiftKit.apiEndpoint + "workouts", postData, function(data) {
      window.location = "/start";
    });
  },

  render: function() {
    var _that = this;

    var WorkoutExerciseNodes = this.state.exercises.map(function(exercise, index) {
      var exerciseName = exercise;

      return (
        <tr key={"exercise_" + index}>
          <td>{exerciseName.name}</td>
          <td>{exercise.target_sets}</td>
          <td>{exercise.target_reps}</td>
        </tr>
      )
    });

    var ExerciseNodes = this.props.exercises.map(function(exercise) {
      return (
        <option value={exercise}>{exercise}</option>
      )
    });

    return (
      <article>
        <h1>Add a workout</h1>

        <small>
          Workouts group exercises together with a common name, so when you are
          ready to work out,
          <br />
          they provide a template to keep track of progress for a workout.
          <br />
          Exercises can be added and removed from workouts when tracking them.
        </small>

        <form>
          <label>Workout Name</label>
          <input ref="nameInput" onKeyPress={this.cancelEnter} type="text" />

          <section className="exercises">
            <h3>Exercises</h3>

            <fieldset>
              <select ref="exerciseInput" name="exercise">
                <option selected disabled value="">Choose Exercise</option>
                {ExerciseNodes}
              </select>
              <input ref="setsInput" onKeyPress={this.cancelEnter} type="text" placeholder="sets" />
              <input ref="repsInput" onKeyPress={this.cancelEnter} type="text" placeholder="reps" />
              <a href onClick={this.addExercise}>Add exercise</a>
            </fieldset>

            <table>
              <thead>
                <tr>
                  <th>Exercise</th>
                  <th>Sets</th>
                  <th>Reps</th>
                </tr>
              </thead>

              <tbody>
                { this.state.exercises.length > 0 ?
                  WorkoutExerciseNodes
                  :
                  <tr><td colSpan='3'>No Exercises have been added</td></tr>
                }
              </tbody>
            </table>
          </section>

          <br />

          <input onClick={this.createWorkout} type="submit" />
        </form>
      </article>
    );
  }
});
