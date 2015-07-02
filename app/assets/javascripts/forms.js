$(document).ready(function() {
  $('.tooltipped').tooltip({delay: 50});
  $('select').material_select();
  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });
  $(".button-collapse").sideNav();
});

$(document).on('click', '.add_fields', function(){
  $('select').material_select();
});
