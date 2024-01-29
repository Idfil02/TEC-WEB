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
});

//Forse da mettere in un ipotetico scripts.js

function changeUsername() {
  var newUsername = $("#new-name").val();

  $.ajax({
    type: "POST",
    url: "set_user.php",
    data: { "new-name": newUsername },
    dataType: "json",
    success: function (response) {
      if (response.success) {
        // If the operation was successful, display a success message using alert
        alert(response.message);
      } else {
        // If the operation failed, display an error message using alert
        alert("Error: " + response.message);
      }
    },
    error: function () {
      // Handle AJAX errors (e.g., network issues) using alert
      alert("An error occurred.");
    },
  });
}

function changePassword() {
  var oldPassword = $("#old-password").val();
  var newPassword = $("#new-password").val();

  $.ajax({
    type: "POST",
    url: "set_password.php",
    data: { "old-password": oldPassword, "new-password": newPassword },
    dataType: "json",
    success: function (response) {
      if (response.success) {
        // If the operation was successful, display a success message using alert
        alert(response.message);
      } else {
        // If the operation failed, display an error message using alert
        alert("Error: " + response.message);
      }
    },
    error: function () {
      // Handle AJAX errors (e.g., network issues) using alert
      alert("An error occurred.");
    },
  });
}
