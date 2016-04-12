<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Cam's Cloud - Create Directory</title>
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
        {{>newdirnav}}
        <div id="page-wrapper">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            <i class="glyphicon glyphicon-plus"></i> Create Directory
                        </h1>
                    </div>
                </div>
                {{#if savepath}}
                <p class="breadcrumb">
                  Create directory at {{savepath}}
                </p>
                {{/if}}
                {{#if message}}
                  <div class="alert alert-{{message.type}}" role="alert">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    {{message.text}} <kbd>{{savepath}}{{message.created}}</kbd>
                  </div>
                {{/if}}
                <!-- /.row -->
                <form method="get">
                  <div class="input-group">
                    <input id="dirName" name="name" class="input-group" type="text"/>
                  <div>
                  <br/>
                  <input id="createBtn" type="submit" value="Create" class="btn btn-success btn-lg" disabled/>
                </form>
                <br/>
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
    <script src="/js/createdirectory.js"></script>
</body>

</html>
