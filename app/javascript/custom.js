document.addEventListener("DOMContentLoaded", function() {
    document.getElementById('add-exercise').addEventListener('click', function() {
      var container = document.getElementById('exercises-container');
      var newRowIndex = container.getElementsByClassName('exercise-row').length;
      var html = `
        <div class="exercise-row">
          <input type="text" name="training_session[exercises][][name]" placeholder="Exercise Name">
          <input type="number" name="training_session[exercises][][weight]" placeholder="Weight">
          <input type="number" name="training_session[exercises][][reps]" placeholder="Reps">
        </div>
      `;
      container.insertAdjacentHTML('beforeend', html);
    });
  });