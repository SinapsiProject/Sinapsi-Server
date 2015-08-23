<%@ page import="java.util.Map"%>
<%@ page import="com.sinapsi.model.DeviceInterface"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Sinapsi | Web</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.4 -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons 2.0.0 -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
       <!-- iCheck -->
    <link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
    <!-- Morris chart -->
    <link rel="stylesheet" href="plugins/morris/morris.css">
    <!-- jvectormap -->
    <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <!-- Date Picker -->
    <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker-bs3.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="skin-blue sidebar-mini">
    <%
	  String email = null;
	  Cookie[] cookies = request.getCookies();
	  if (cookies != null) {
	    for (Cookie cookie : cookies) {
	      if (cookie.getName().equals("user"))
	        email = cookie.getValue();
	    }
	  }
	  if (email == null)
	    response.sendRedirect("login.html");
	  
	     
      String role = (String) session.getAttribute("role");
      @SuppressWarnings("unchecked")
      Map<DeviceInterface, Boolean> devices = (Map<DeviceInterface, Boolean>) session.getAttribute("devices");
      int nDevices = 0;
	%>
    <div class="wrapper">

      <header class="main-header">
        <!-- Logo -->
        <a href="index.jsp" class="logo">
          
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><img src="dist/img/white_cog.png" height="34px" width="34px"></span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg"><img src="dist/img/white_cog.png" height="38px" width="38px"></span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">

              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="dist/img/user2-160x160.png" class="user-image" alt="User Image">
                  <span class="hidden-xs">Username</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    <img src="dist/img/user2-160x160.png" class="img-circle" alt="User Image">
                    <p>
                       <%=email%>
                    </p>
                  </li>
                  <!-- Menu Body -->
                  <li class="user-body">
                    <div class="col-xs-4 text-center">
                      <a href="#"></a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#">Macros</a>
                    </div>
                    <div class="col-xs-4 text-center">
                      <a href="#"></a>
                    </div>
                  </li>
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">Profile</a>
                    </div>
                    <div class="pull-right">
                      <a href="web_logout" class="btn btn-default btn-flat">Sign out</a>
                    </div>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <div class="user-panel">
            <div class="pull-left image">
              <img src="dist/img/user2-160x160.png" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
              <p>Username</p>
              <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
          </div>
      
          <!-- search form -->
          <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
              <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
          </form>
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">Main Navigation</li>
            <li class="treeview">
              <a href="dashboard">
                  <i class="fa fa-dashboard"></i><span>Dashboard</span></i>
              </a>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-pie-chart"></i>
                <span>Charts</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="web_charts"> Server Load</a></li>
              </ul>
            </li>
            <li class="active treeview">
              <a href="#">
                <i class="fa fa-laptop"></i>
                <span>Devices</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="web_devices"> Connected</a></li>
              </ul>
            </li>
          
            <li class="treeview">
              <a href="web_macro_editor">
                <i class="fa fa-edit"></i> <span>Macro Editor</span>
              </a>
            </li>
          
            <li  class="treeview">
              <a href="web_macro_manager">
                <i class="fa fa-wrench"></i> <span>Macro Manager</span>
              </a>
            </li>
          
           <li  class="treeview">
              <a href="#">
                <i class="fa fa-files-o"></i> <span>Logs</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                	<li><a href="web_log?type=tomcat">Tomcat</a></li>
                    <li><a href="web_log?type=catalina">Catalina</a></li>
				    <li><a href="web_log?type=db">Database</a></li>
				    <li><a href="web_log?type=ws">WebSocket</a></li>
                    <li><a href="web_log?type=webs">Web Service</a></li>
               </ul>
            </li>
            <li class="treeview">
                <a href="#"><i class="fa fa-book"></i> <span>Help</span>
                 <i class="fa fa-angle-left pull-right"></i>
                </a>
                
                <ul class="treeview-menu">
                   <li><a href="#"> Getting Started</a></li>
                   <li><a href="#"> Contact</a></li>
                   <li><a href="#"> About</a></li>
                </ul>
            </li>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Devices
          </h1>
        </section>
        <!-- Main content -->
        <section class="content">
        <div class="row">
         <%
            for(Map.Entry<DeviceInterface, Boolean> entry : devices.entrySet()) {
         %>
           <div class="col-lg-3 col-xs-6">
              <div class="info-box">
                 <% if(entry.getValue() || entry.getKey().getPlatformType().equals("Web")) {%>
				     <span class="info-box-icon bg-green">
				 <% } else {%>
				      <span class="info-box-icon bg-aqua">
				 <% }%>
				    <% if(entry.getKey().getPlatformType().equals("Android")) {%>
				    	<i class="fa fa-android"></i></span>
                    <%}if(entry.getKey().getPlatformType().equals("PC Linux")) {%>
                        <i class="fa fa-linux"></i></span>
                    <%}if(entry.getKey().getPlatformType().equals("Web")) {%>
                        <i class="fa fa-cloud"></i></span>
                    <%}%> 
                  <div class="info-box-content">    
                      <span class="info-box-text"><%=entry.getKey().getModel()%></span>
                      <%if(entry.getValue() || entry.getKey().getPlatformType().equals("Web")){%>
                         <span class="progress-description text-success"> Online</span>
                      <%}else{%>
                         <span class="progress-description text-fail"> Offline</span>
                      <%}%>
                  </div>
              </div>
           </div>
        <%
           ++nDevices;
           if(nDevices == 4) {
        	  nDevices = 0;
        %>
        </div>
        <div class="row">
        <% 
            }
          }
        %>
        </div>
        </section><!-- /.content -->
          
      </div><!-- /.content-wrapper -->
      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b> Antares</b> 1.0
        </div>
        <strong>Copyright &copy; Sinapsi 2015</strong>
      </footer>
      <div class="control-sidebar-bg"></div>
    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.4 -->
    <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
      $.widget.bridge('uibutton', $.ui.button);
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="dist/js/app.min.js"></script>
    <script src="dist/js/pages/dashboard.js"></script>
    <script src="dist/js/demo.js"></script>
  </body>
</html>
