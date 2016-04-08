<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Cam's Cloud - Upload</title>
    <link rel="icon" type="image/png" href="img/cloud.png">
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
        {{>uploadnav}}
        <div id="page-wrapper">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            <i class="glyphicon glyphicon-open"></i> Upload File
                        </h1>
                    </div>
                </div>
                {{#if savepath}}
                <p class="breadcrumb">
                  Upload to {{savepath}}
                </p>
                {{/if}}
                <!-- /.row -->
                <form method="POST" enctype="multipart/form-data">
                  <input id="fileSelect" type="file" class="file" name="myfile" multiple/>
                  <br/>
                  <input id="uploadBtn" type="submit" value="Upload" class="btn btn-success btn-lg" disabled/>
                </form>
                {{#if uploads}}
                  <br/><p>Uploaded:
                    {{#each uploads}}
                       <kbd>{{this}}</kbd>
                    {{/each}}
                  </p>
                {{/if}}
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/upload.js"></script>
</body>

</html>
