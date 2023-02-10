
$(document).ready(function(){

  // alert('Coucou');

  $('#form_inscription').submit(function (event) {
    event.preventDefault();// Pour éviter d'exectuer l'action et du coup de changer de page

    var formContent = $(this).serialize();

    $.ajax(
        {
        method: "POST",
        url : "/4DACTION/wForm_Inscription",
        data: formContent
        }
      )
      .done(
        function(response){
          if (response.error_code == 0) {
            // location.reload(true);
            window.location = '/home.shtml';
            // alert('OK');
          }
          else {
            alert(response.error_message);
          }
        }
      );
});

$('#form_moncompte').submit(function (event) {
  event.preventDefault();// Pour éviter d'exectuer l'action et du coup de changer de page

  var formContent = $(this).serialize();

  $.ajax(
      {
      method: "POST",
      url : "/4DACTION/wForm_MonCompte",
      data: formContent
      }
    )
    .done(
      function(response){
        if (response.error_code == 0) {
          // location.reload(true);
          window.location = '/home.shtml';
          // alert('OK');
        }
        else {
          alert(response.error_message);
        }
      }
    );
});


$('#form_connexion').submit(function (event) {
  event.preventDefault();// Pour éviter d'exectuer l'action et du coup de changer de page

  var formContent = $(this).serialize();

  $.ajax(
      {
      method: "POST",
      url : "/4DACTION/wForm_Connexion",
      data: formContent
      }
    )
    .done(
      function(response){
        if (response.error_code == 0) {
          // location.reload(true);
          window.location = '/home.shtml';
          // alert('OK');
        }
        else {
          alert(response.error_message);
        }
      }
    );
});


$('#form_inscription_evenement').submit(function (event) {
  event.preventDefault();// Pour éviter d'exectuer l'action et du coup de changer de page

  var formContent = $(this).serialize();

  $.ajax(
      {
      method: "POST",
      url : "/4DACTION/wForm_InscriptionEvenement",
      data: formContent
      }
    )
    .done(
      function(response){
          alert(response.error_message);
	  });
});

$('#form_crediter').submit(function (event) {
  event.preventDefault();// Pour éviter d'exectuer l'action et du coup de changer de page

  var formContent = $(this).serialize();

  $.ajax(
      {
      method: "POST",
      url : "/4DACTION/wForm_CrediterCompte",
      data: formContent
      }
    )
    .done(
      function(response){
        if (response.error_code == 0) {
          // location.reload(true);
          window.location = '/crediter.shtml';
          // alert('OK');
        }
        else {
          alert(response.error_message);
        }
      }
    );
});


});