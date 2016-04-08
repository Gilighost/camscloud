$('#renameModal').on('show.bs.modal', function(e) {
    //get data-id attribute of the clicked element
    var filename = $(e.relatedTarget).data('file-name');

    //populate the textbox
    path = window.location.pathname;
    $(e.currentTarget).find('input[name="renamename"]').val(path + filename);
});
