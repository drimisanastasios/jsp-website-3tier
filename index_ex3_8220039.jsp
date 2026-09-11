<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error_ex3_8220039.jsp" %>
<%@ page import="java.util.ArrayList, java.util.List, exercise3_2024_2025_8220039.UserDAO, exercise3_2024_2025_8220039.User"%>

<%
User cUser = (User) session.getAttribute("userObj2024");

boolean needlogin = false;
if (session.getAttribute("userObj2024") == null) {
	needlogin = true;
}
%>

<!DOCTYPE html>
<html lang="en">
	<%@ include file = "header_ex3_8220039.jsp" %>
	
	<body>
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span> <span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">8220039</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="index_ex3_8220039.jsp">Home</a></li>
						<li><a href="about_ex3_8220039.jsp">About</a></li>
						<%
						if (needlogin == true) { 
						%>
						</ul>
						<ul class="nav navbar-nav navbar-right">				
							<li><a href="register_ex3_8220039.jsp">Register</a></li>	
							<li><a href="login_ex3_8220039.jsp">Sign in</a></li>				
						</ul>		
						<%
						} else {
						%>
						<li><a href="dashboard_ex3_8220039.jsp">Dashboard</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">Signed in as <%= cUser.getUsername() %></a></li>
						<li><a href="logout_ex3_8220039.jsp">Sign out</a></li>
					</ul>
					<%
						}
					%>
				</div>
			</div>
		</nav>

		<div class="container theme-showcase" role="main">
			<div class="jumbotron">
				<h1>ismgroup44</h1>
			</div>

			<div class="page-header">
				<h1>Δριμής Αναστάσιος</h1>
			</div>
		</div>
		
		<%@ include file = "footer_ex3_8220039.jsp" %>
	</body>
</html>
