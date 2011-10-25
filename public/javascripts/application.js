// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
    showPostDialogOnError();
    addListenerToUploadBtn();

});

function showPostDialogOnError() {
   if ($('#messages').length > 0) {
       $('#post-sale-div').modal('show');
    }
}

/**
 * Will add another row to upload after someone has click the upload btn.
 */
function addListenerToUploadBtn() {
    $('.input-file').live('click', function() {
        $('.file-upload-div').append(createUploadLine(this));
    });
}

function createUploadLine(elem) {
    var input_seq = parseInt($(elem).attr('seq')) + 1;

    var upload_div = '<div class="clearfix">' +
                        '<label for="fileInput">File Input:</label>' +
                        '<div class="input">' +
                            '<input id="image_' + input_seq + '"' + 'seq="' + input_seq + '" class="input-file" type="file" name="image[' + input_seq + ']">' +
                            '<span class="help-inline">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Provide an image of the sale items.</span>' +
                        '</div>' +
                    '</div>';

    return upload_div;
}