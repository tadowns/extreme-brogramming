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
        $push: [{ exercise_type_id: exerciseNode.value, sets: setsNode.value, reps: repsNode.value }]
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
    var _that = this;

    var ExerciseNodes = this.state.exercises.map(function(exercise, index) {
      var exerciseName = _that.props.exerciseTypes.filter(function(exerciseType) {
        return exerciseType[0] == exercise.exercise_type_id;
      })[0][1];

      return (
        <tr key={"exercise_" + index}>
          <td>{exerciseName}</td>
          <td>{exercise.sets}</td>
          <td>{exercise.reps}</td>
        </tr>
      )
    });

    var ExerciseTypeNodes = this.props.exerciseTypes.map(function(exerciseType) {
      return (
        <option value={exerciseType[0]}>{exerciseType[1]}</option>
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
                {ExerciseTypeNodes}
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
                  ExerciseNodes
                  :
                  <tr><td colSpan='3'>No Exercises have been added</td></tr>
                }
              </tbody>
            </table>
          </section>

          <br />

          <input onClick={this.createWorkoutType} type="submit" />
        </form>
      </article>
    );
  }
});
