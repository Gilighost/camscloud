$("#dirName").on('keyup', function(e){
  if($("#dirName").val())
    $("#createBtn").prop('disabled', false)
  else
    $("#createBtn").prop('disabled', true)
})
