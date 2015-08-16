<%@ page import="java.util.List"%>
<%@ page import="com.sinapsi.model.MacroInterface"%>
<%@ page import="com.sinapsi.engine.component.Action"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
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
      List<MacroInterface> macros = (List<MacroInterface>) session.getAttribute("macros");
      @SuppressWarnings("unchecked")
      Map<Integer, String> devices = (Map<Integer, String>) session.getAttribute("devices");
      @SuppressWarnings("unchecked")
      Map<Integer, String> triggeredDevices = (Map<Integer, String>) session.getAttribute("triggeredDevice");
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
            <li class="active treeview">
              <a href="dashboard">
                <i class="fa fa-dashboard"></i> <span>Dashboard</span></i>
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
            <li class="treeview">
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
            Macro
            <small>Manager</small>
          </h1>
        </section>
        <div class="modal fade" id="confirm-delete" tabindex="-1"
             role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
             <div class="modal-dialog">
				<div class="modal-content">
				    <div class="modal-header">
				       <button type="button" class="close" data-dismiss="modal"
				             aria-hidden="true">&times;</button>
				       <h4 class="modal-title" id="myModalLabel">Confirm Delete</h4>
				    </div>
                    <div class="modal-body">
				        <p>You are about to delete this Macro, this procedure is
				           irreversible.</p>
				        <p>Do you want to proceed?</p>
				    </div>
                    <div class="modal-footer">
				        <button type="button" class="btn btn-default"
								data-dismiss="modal">Cancel</button>
				        <a class="btn btn-danger btn-ok">Delete</a>
				    </div>
				</div>
				</div>
        </div>
        <!-- Main content -->
        <section class="content">
          <!-- Small boxes (Stat box) -->
          <div class="row">
              <div class="col-md-12">
				<%
				   if(macros.size() == 0) {
				%>
                <div class="col-lg-12 col-xs-12">
				  <h1>
				     <center>You have not any macro yet!</center>
				  </h1>
                </div>
				<%
				   } else {
				%>
				<%
				   int counter = 0;
                   for(MacroInterface macro : macros) {
												                         
				   String triggerParameters =   macro.getTrigger().getActualParameters();  
                   triggerParameters = triggerParameters.replace("{", "");
                   triggerParameters = triggerParameters.replace("}", "");
                   triggerParameters = triggerParameters.replace("\"", "");
                   triggerParameters = triggerParameters.replace("parameters:", "");
                   triggerParameters = triggerParameters.replace(":", " : ");
                   triggerParameters = triggerParameters.replace("_", " ");
				   triggerParameters = triggerParameters.replace("TRIGGER", "");
												                         
				   String triggerName = macro.getTrigger().getName();
				   triggerName = triggerName.replace("_", " ");
				%>
				<div class="panel panel-default">
				   <div class="panel-heading">
				      <h3>
				         <a data-toggle="collapse" data-parent="#accordion"
				            href="#<%=counter%>" class="collapsed"
				            style="text-decoration: none; color: <%=macro.getMacroColor()%>"> <%=macro.getName()%> <small>starts
				            on device <%=triggeredDevices.get(macro.getTrigger().getExecutionDevice().getId())%>
				            </small>
				            </a>

				            <div class="btn-toolbar">
								<button
								   data-href="web_macro_manager?action=delete&macro=<%=macro.getId()%>"
								   data-toggle="modal" data-target="#confirm-delete"
								   class="btn btn-danger pull-right">
								   <i class="fa fa-pencil"></i> Delete
								</button>
								<button class="btn btn-primary pull-right">
								   <i class="fa fa-edit "></i> Edit
								</button>
				           </div>
				       </h3>
				     </div>
                    
                     <div id="<%=counter++%>" class="panel-collapse collapse"
				          style="height: 0px;">
				       <div class="panel-body">
				         <div class="callout callout-info">
				            <h4>
								<strong>Triggered by </strong>
				            </h4>
				            <%=triggerName%>
				            <h5>
								<strong>On parameters </strong>
				            </h5>
				            <%=triggerParameters%>
				         </div>

				         <div class="callout callout-info">
				            <h4>
				               <strong>Actions executed</strong>
				            </h4>
				            <%
				               for(Action action : macro.getActions()) {
				                   String actionParameters = action.getActualParameters();
                                   actionParameters = actionParameters.replace("{", "");
								   actionParameters = actionParameters.replace("}", "");
								   actionParameters = actionParameters.replace("\"", "");
								   actionParameters = actionParameters.replace("parameters:", "");
								   actionParameters = actionParameters.replace(":", " : ");
								   actionParameters = actionParameters.replace("_", " ");
																				                                    
								   String actionName = action.getName();
				                   actionName = actionName.replace("_", " ");
				             %>
				             <div class="callout callout-info">
								<%=actionName%>
								<h5>
								   <strong>On parameters </strong>
								</h5>
								<%=actionParameters%>
								<h5>
								   <strong>Executed on device </strong>
								</h5>
								<%=devices.get(action.getExecutionDevice().getId())%>
				              </div>
				              <%
								 }
				               %>
				            </div>
				          </div>
				        </div>
				     </div>
				     <%
				         }
				         }
				      %>
				 </div>
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
    </script>
    <!-- Bootstrap 3.3.4 -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- Morris.js charts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="plugins/morris/morris.min.js"></script>
    <!-- Sparkline -->
    <script src="plugins/sparkline/jquery.sparkline.min.js"></script>
    <!-- jvectormap -->
    <script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <!-- jQuery Knob Chart -->
    <script src="plugins/knob/jquery.knob.js"></script>
    <!-- daterangepicker -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
    <script src="plugins/daterangepicker/daterangepicker.js"></script>
    <!-- datepicker -->
    <script src="plugins/datepicker/bootstrap-datepicker.js"></script>
    <!-- Bootstrap WYSIHTML5 -->
    <script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
    <!-- Slimscroll -->
    <script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="plugins/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/app.min.js"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="dist/js/pages/dashboard.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js"></script>
  </body>
</html>
