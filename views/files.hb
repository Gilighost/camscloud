<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Cam">
    <title>Cam's Cloud - Files</title>
    <link rel="icon" type="image/png" href="/img/cloud.png">
    <!-- Bootstrap Core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/css/sb-admin.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div id="wrapper">
        <!-- Navigation -->
        {{>filesnav}}
        <div id="page-wrapper">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            <i class="fa fa-folder"></i> My Files
                        </h1>
                    </div>
                </div>
                <p class="breadcrumb">
                  {{#each dirPath}}
                    <a href="{{this.href}}">> {{this.name}}</a>
                  {{/each}}
                </p>
                {{#if alert}}
                  <div class="alert alert-{{alert.type}}" role="alert">{{alert.message}}</div>
                {{/if}}
                <!-- /.row -->
                {{#if files}}
                  <p><kbd>Files:</kbd></p>
                {{else}}
                  <p>
                    <kbd>There are no files.</kbd>
                  </p>
                {{/if}}
                <div class="row">
                  {{#each files}}
                    <div class="col-lg-2 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div>
                                         <h3 style="padding: 6px 12px;"class="panel-title"><i class="glyphicon glyphicon-file"></i>&nbsp;{{this}}</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <a href='{{this}}?action=view'><span data-toggle="tooltip" title="View" data-placement="top" class="pull-left"><i class="glyphicon glyphicon-eye-open"></i></span>
                                <span class="pull-left">&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
                                <a href='{{this}}?action=download'><span data-toggle="tooltip" title="Download" data-placement="top" class="pull-left"><i class="glyphicon glyphicon-download"></i></span></a>
                                <span class="pull-left">&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
                                <a href="" data-toggle="modal" data-target="#renameModal" data-file-name="{{this}}"><span data-toggle="tooltip" title="Rename" data-placement="top" class="pull-left"><i class="glyphicon glyphicon-pencil"></i></span></a>
                                <span class="pull-left">&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
                                <a href='{{this}}?action=delete'><span data-toggle="tooltip" title="Delete" data-placement="top" class="pull-left"><i class="glyphicon glyphicon-trash"></i></span></a>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                  {{/each}}
                </div>
                {{#if directories}}
                  <p><kbd>Directories:</kbd></p>
                {{else}}
                  <p>
                    <kbd>There are no directories.</kbd>
                  </p>
                {{/if}}
                <div class="row">
                  {{#each directories}}
                    <div class="col-lg-2 col-md-6">
                      <div class="panel panel-yellow">
                          <div class="panel-heading">
                            <a class="btn" href='{{this.href}}'>
                              <div class="row">
                                <h3 class="panel-title"><i class="glyphicon glyphicon-folder-open"></i>&nbsp;&nbsp;{{this.dirName}}</h3>
                              </div>
                            </a>
                          </div>
                          <div class="panel-footer">
                              <a href="" data-toggle="modal" data-target="#renameModal" data-file-name="{{this.dirName}}"><span data-toggle="tooltip" title="Rename" data-placement="top" class="pull-left"><i class="glyphicon glyphicon-pencil"></i></span></a>
                              <span class="pull-left">&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
                              <a href='{{this.deletehref}}?action=delete'><span data-toggle="tooltip" title="Delete" data-placement="top" class="pull-left"><i class="glyphicon glyphicon-trash"></i></span></a>
                              <div class="clearfix"></div>
                          </div>
                      </div>
                    </div>
                  {{/each}}
              </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
      </div>
    <!-- /#wrapper -->
    </div>

    <!-- Modals -->
    <!-- Rename Modal -->
    <div id="renameModal" class="modal fade" role="dialog">
      <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title"><i class="glyphicon glyphicon-pencil"></i>&nbsp;&nbsp;Rename</h4>
          </div>
          <form method="post">
            <div class="modal-body">
              <input  id="newname" type="text" name="newname" autofocus/>
              <input type="text" name="oldname" hidden/>
            </div>
            <div class="modal-footer">
              <button id="submit_rename" type="submit" class="btn btn-primary">Submit</button>
              <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
            </div>
          </form>
        </div>

      </div>
    </div>
    <!-- upload Modal -->
    <div id="uploadModal" class="modal fade" role="dialog">
      <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title"><i class="glyphicon glyphicon-open"></i>&nbsp;&nbsp;Upload File</h4>
          </div>
          <form action="/upload" method="post" enctype="multipart/form-data">
            <div class="modal-body">
                <input id="fileSelect" type="file" class="file" name="myfile" multiple/>
            </div>
            <div class="modal-footer">
                <input id="uploadBtn" type="submit" value="Upload" class="btn btn-success" disabled/>
              <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
            </div>
          </form>
        </div>

      </div>
    </div>
    <!-- new directory Modal -->
    <div id="createDirectoryModal" class="modal fade" role="dialog">
      <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title"><i class="glyphicon glyphicon-plus"></i> &nbsp;&nbsp;Create Directory</h4>
          </div>
          <form action="upload" method="post" enctype="multipart/form-data">
            <div class="modal-body">
                <input id="fileSelect" type="file" class="file" name="myfile" multiple/>
            </div>
            <div class="modal-footer">
                <input id="uploadBtn" type="submit" value="Upload" class="btn btn-success btn-lg" disabled/>
              <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
            </div>
          </form>
        </div>

      </div>
    </div>

    <!-- jQuery -->
    <script src="/js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/files.js"></script>
</body>

</html>
