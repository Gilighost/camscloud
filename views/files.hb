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
                    <div class="col-lg-2 col-md-5">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-lg-1">
                                         <h3 class="panel-title"><i class="fa fa-file fa-2x"></i>&nbsp;{{this}}</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <a href='{{this}}?action=view'><span class="pull-left"><i class="glyphicon glyphicon-eye-open"></i> View</span>
                                <span class="pull-left">&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
                                <a href='{{this}}?action=download'><span class="pull-left"><i class="glyphicon glyphicon-download"></i> Download</span></a>
                                <span class="pull-left">&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
                                <a href='{{this}}?action=delete'><span class="pull-left"><i class="glyphicon glyphicon-trash"></i> Delete</span></a>
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
                                <h3><i class="glyphicon glyphicon-folder-open"></i>&nbsp;&nbsp;{{this.dirName}}</h3>
                              </div>
                            </a>
                          </div>
                          <div class="panel-footer">
                              <a href='{{this.deletehref}}?action=delete'><span class="pull-left"><i class="glyphicon glyphicon-trash"></i> Delete</span></a>
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
    <!-- jQuery -->
    <script src="/js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="/js/bootstrap.min.js"></script>
</body>

</html>
