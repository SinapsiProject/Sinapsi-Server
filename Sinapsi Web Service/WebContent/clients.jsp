<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<%@page import="com.sinapsi.model.UserInterface"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Sinapsi</title>
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<link href="assets/css/font-awesome.css" rel="stylesheet" />
<link href="assets/css/custom-styles.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700'
	rel='stylesheet' type='text/css' />
</head>

<body>
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
	  List<UserInterface> admins = (List<UserInterface>) session.getAttribute("admins");
	  @SuppressWarnings("unchecked")
	  List<UserInterface> users = (List<UserInterface>) session.getAttribute("users");
	  @SuppressWarnings("unchecked")
	  List<UserInterface> pendingusers = (List<UserInterface>) session.getAttribute("pending_users");

	  session.removeAttribute("admins");
	  session.removeAttribute("users");
	  session.removeAttribute("pending_users");
	%>
	<div id="wrapper">
		<nav class="navbar navbar-default top-navbar" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">Sinapsi</a>
			</div>

			<ul class="nav navbar-top-links navbar-right">
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" aria-expanded="false"> <%=email%>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li class="divider"></li>
						<li><a href="web_logout"><i class="fa fa-sign-out fa-fw"></i>
								Logout</a></li>
					</ul> <!-- /.dropdown-user --></li>
			</ul>
		</nav>

		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">

					<li><a href="dashboard"><i class="fa fa-dashboard"></i>
							Dashboard</a></li>
					<%
					  if (role == "admin") {
					%>
					<li><a href="web_charts"><i class="fa fa-bar-chart-o"></i>
							Charts</a></li>
					<li><a class="active-menu" href="web_clients"><i
							class="fa fa-sitemap"></i> Clients Connected </a></li>
					<%
					  }
					%>
					<li><a href="web_macro_manager"><i class="fa fa-wrench"></i>
							Macro Manager </a></li>
					<li><a href="web_macro_editor"><i class="fa fa-edit"></i>
							Macro Editor </a></li>
					<li><a href="web_devices"><i class="fa fa-desktop"></i>
              Devices </a></li>
					<%
					  if (role == "admin") {
					%>
					<li><a href="#"><i class="glyphicon glyphicon-cog"></i>
							Engine <span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="web_log?type=actionlog">Log</a></li>
						</ul></li>
						
					<li><a href="#"><i class="fa fa-fw fa-file"></i> Log <span
							class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="web_log?type=tomcat">Tomcat</a></li>
							<li><a href="web_log?type=catalina">Catalina</a></li>
							<li><a href="web_log?type=db">Database</a></li>
							<li><a href="web_log?type=ws">WebSocket</a></li>
							<li><a href="web_log?type=webs">Web Service</a></li>
						</ul></li>
					<%
					  }
					%>
				</ul>
			</div>
		</nav>

		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h1 class="page-header">
							Sinapsi <small>Users</small>
						</h1>
					</div>
				</div>

				<%
				  if (role == "user") {
				%>
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">Messages</div>
							<div class="panel-body">
								<div class="alert alert-danger">
									You need <strong>administration</strong> permisison to see this
									page.
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
				  }
				  if (role == "admin") {
				%>
	
				<div class="row">
					<div class="col-md-12">
						<!-- Advanced Tables -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3>Administrators</h3>
							</div>
							
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>Email</th>
												<th>Email log</th>
											</tr>
										</thead>
										<tbody>
											<%
											  for (UserInterface admin : admins) {
											%>
											<tr>
												<td><%=admin.getEmail()%></td>
												<td><label> <input type="checkbox" value="">
												</label></td>
											</tr>
											<%
											  }
											%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<!-- Advanced Tables -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3>Users</h3>
							</div>
							
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>Email</th>
											</tr>
										</thead>
										<tbody>
											<%
											  for (UserInterface user : users) {
											%>
											<tr>
												<td><%=user.getEmail()%></td>
											</tr>
											<%
											  }
											%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-md-12">
						<!-- Advanced Tables -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3>Users pending for activation</h3>
							</div>
							
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>Email</th>
												<th>Active user</th>
												<th>Delete user</th>
											</tr>
										</thead>
										<tbody>
											<%
											  for (UserInterface pendingUser : pendingusers) {
											%>
											<tr>
												<td><%=pendingUser.getEmail()%></td>
												<td><a
													href="web_clients?action=active&email=<%=pendingUser.getEmail()%>"
													class="btn btn-default btn-sm">Active</a></td>
												<td><a
													href="web_clients?action=delete&email=<%=pendingUser.getEmail()%>"
													class="btn btn-danger btn-sm">Delete</a></td>
											</tr>
											<%
											  }
											%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
				  }
				%>

			</div>
			Alpha 1.0 Version © 2015 Sinapsi
		</div>
	</div>
	<script src="assets/js/jquery-1.10.2.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.metisMenu.js"></script>
	<script src="assets/js/custom-scripts.js"></script>
</body>
</html>