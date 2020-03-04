const initflatpicker = () => {

  const startDateInput = document.getElementById('rental_start_date');
  const endDateInput = document.getElementById('rental_end_date');

  if (startDateInput) {
  const unavailableDates = JSON.parse(document.querySelector('#item-rent-dates').dataset.unavailable)
  endDateInput.disabled = true

  flatpickr(startDateInput, {
   minDate: "today",
    disable: unavailableDates,
    dateFormat: "Y-m-d",
  });

  console.log('im in the file')

  startDateInput.addEventListener("change", (e) => {
    if (startDateInput != "") {
      endDateInput.disabled = false
    }
    flatpickr(endDateInput, {
      minDate: e.target.value,
      disable: unavailableDates,
      dateFormat: "Y-m-d"
      });
    })
};

export { initflatpicker };
