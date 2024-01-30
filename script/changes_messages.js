import { showToast } from './DB_connection.js'

$(document).ready(function () {
  // Intercept form submission for changing username
  $("#changeUsernameForm").submit(function (e) {
    e.preventDefault(); // Prevent the default form submission
    changeUsername(); // Call the AJAX function for changing username
  });

  // Intercept form submission for changing password
  $("#changePasswordForm").submit(function (e) {
    e.preventDefault(); // Prevent the default form submission
    changePassword(); // Call the AJAX function for changing password
  });

  // Intercept form submission for changing password
  $("#deleteAccountForm").submit(function (e) {
    e.preventDefault(); // Prevent the default form submission
    deleteAccount(); // Call the AJAX function for changing password
  });
});


function changeUsername() {
  var newUsername = $("#new-name").val();

  $.ajax({
    type: "POST",
    url: "php/change_username.php",
    data: { "new-name": newUsername },
    dataType: "json",
    success: function (response) {
      if (response.success) {
        // If the operation was successful, display a success message using alert
        showToast(response.message, 'success');
      } else {
        // If the operation failed, display an error message using alert
        showToast("Errore: " + response.message);
      }
    },
    error: function () {
      // Handle AJAX errors (e.g., network issues) using alert
      showToast("Si è verificato un errore.");
    },
  });
}

function changePassword() {
  var oldPassword = $("#old-password").val();
  var newPassword = $("#new-password").val();

  $.ajax({
    type: "POST",
    url: "php/change_password.php",
    data: { "old-password": oldPassword, "new-password": newPassword },
    dataType: "json",
    success: function (response) {
      if (response.success) {
        // If the operation was successful, display a success message using alert
        showToast(response.message, 'success');
      } else {
        // If the operation failed, display an error message using alert
        showToast("Errore: " + response.message);
      }
    },
    error: function () {
      // Handle AJAX errors (e.g., network issues) using alert
      showToast("Si è verificato un errore.");
    },
  });
}


function deleteAccount() {
  var oldPassword = $("#username").val();
  var newPassword = $("#password").val();

  $.ajax({
    type: "POST",
    url: "php/delete_account.php",
    data: { "username": oldPassword, "password": newPassword },
    dataType: "json",
    success: function (response) {
      if (response.success) {
        sessionStorage.setItem('toastMessage', response.message);
        sessionStorage.setItem('toastType', 'success');
        window.location.href = "index.php";
      } else {
        // If the operation failed, display an error message using alert
        showToast("Errore: " + response.message);
      }
    },
    error: function () {
      // Handle AJAX errors (e.g., network issues) using alert
      showToast("Si è verificato un errore.");
    },
  });
}