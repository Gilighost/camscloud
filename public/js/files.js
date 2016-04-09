$('#renameModal').on('show.bs.modal', function(e) {
    //get data-id attribute of the clicked element
    var filename = $(e.relatedTarget).data('file-name');
    //populate the textbox
    path = window.location.pathname;
    // var input = $(e.currentTarget).find('input[name="newname"]');
    var input = $("#newname");
    input.val(path + filename);
    input[0].setSelectionRange(input.val().indexOf(filename), input.val().length)
    $(e.currentTarget).find('input[name="oldname"]').val(path + filename);
});

$(document).ready(function() {
    $("body").tooltip({ selector: '[data-toggle=tooltip]' });
});

$("#newname").on('keyup', function(e){
  if($("#newname").val())
    $("#submit_rename").prop('disabled', false)
  else
    $("#submit_rename").prop('disabled', true)
})

$("#fileSelect").change(function(e){
  $("#uploadBtn").prop('disabled', false)
})
