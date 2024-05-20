document.addEventListener('DOMContentLoaded', function() {
  const container = document.getElementById('exercises-container');
  const addButton = document.getElementById('add-exercise');

  addButton.addEventListener('click', function() {
    const newIndex = container.children.length;
    const newRow = document.createElement('div');
    newRow.innerHTML = `
      <label for="exercise_name${newIndex}">種目 ${newIndex + 1}</label>
      <select id="exercise_name${newIndex}" name="training_session[session_exercises_attributes][${newIndex}][name]">
        <option value="選択肢1">選択肢1</option>
        <option value="選択肢2">選択肢2</option>
      </select>
      <label for="weight${newIndex}">重量</label>
      <input type="number" id="weight${newIndex}" name="training_session[session_exercises_attributes][${newIndex}][weight]" placeholder="重量(kg)">
      <label for="reps${newIndex}">回数</label>
      <input type="number" id="reps${newIndex}" name="training_session[session_exercises_attributes][${newIndex}][reps]" placeholder="回数">
    `;
    newRow.classList.add('exercise-row');
    newRow.setAttribute('data-index', newIndex);
    container.appendChild(newRow);
  });
});