<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
<div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="/files/"><i class="fa fa-cloud"></i> Cam's Cloud</a>
</div>
<!-- Top Menu Items -->
<ul class="nav navbar-right top-nav">
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> {{user.name}} <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li>
                <a href="/logout"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
            </li>
        </ul>
    </li>
</ul>
<div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav side-nav">
        <li class="active">
            <a href="/files/"><i class="fa fa-folder"></i> My Files</a>
        </li>
        <li>
            <a href="" data-toggle="modal" data-target="#uploadModal"><i class="glyphicon glyphicon-open"></i> Upload File</a>
        </li>
        <li>
            <a href="" data-toggle="modal" data-target="#createDirectoryModal"><i class="fa fa-plus"></i> Create Directory</a>
        </li>
    </ul>
</div>
</nav>
