// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
    showPostDialogOnError();
});

function showPostDialogOnError() {
   if ($('#messages').length > 0) {
       $('#post-sale-div').modal('show');
    }
}