<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_ex3_8220039.jsp"%>
<%@ page import="java.util.ArrayList, java.util.List, exercise3_2024_2025_8220039.UserDAO, exercise3_2024_2025_8220039.User"%>


<%
if (session.getAttribute("userObj2024") == null) {
	request.setAttribute("message", "You are not authorized to acces this resource. Please login.");
    response.sendRedirect("login_ex3_8220039.jsp");
    return;   
}

User cUser = (User) session.getAttribute("userObj2024");
%>

<!DOCTYPE html>
<html lang="en">
	<%@ include file = "header_ex3_8220039.jsp" %>
	
	<body>

		<!-- Fixed navbar -->
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
						<li><a href="index_ex3_8220039.jsp">Home</a></li>										
						<li><a href="about_ex3_8220039.jsp">About</a></li>				
						<li class="active"><a href="dashboard_ex3_8220039.jsp">Dashboard</a></li>
										
					</ul>
					<ul class="nav navbar-nav navbar-right">
                        <li>
							<p class="navbar-text">Signed in as <%= cUser.getUsername() %></p>
						</li>
						<li>
							<a href="logout_ex3_8220039.jsp"><span class="glyphicon glyphicon-log-out"></span> Sign out</a>
						</li>								        	
			        </ul>		
		
				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>

		<div class="container theme-showcase" role="main">

			<!-- Main jumbotron for a primary marketing message or call to action -->
			<div class="jumbotron">
				<h1>3η Ατομική Άσκηση</h1>
			</div>

			<!-- Page Title -->
			<div class="page-header">
				<h1>Welcome <code><%=cUser.getFirstname()+ " " + cUser.getLastname() %></code></h1>
			</div>
            <%
			UserDAO s=new UserDAO();
			List<User> users= s.getUsers();
			%>
            <div class="row">

                <div class="col-xs-12">
                    <h2>Available Users <span class="badge"><%=users.size() %></span></h2>
                </div>
				<table class="table">
					<thead class="thead-info">
						<tr class="info">
							<th><b>A/A</b></th>
							<th><b>Last Name</b></th>
							<th><b>First Name</b></th>
							<th><b>Email</b></th>
						</tr>
					</thead>
					<tbody>
						<%
							int index = 1;
							for (User user: users) {
								String r = user.getUsername().equals(cUser.getUsername()) ? "success" : "";
						%>
						<tr class="<%= r %>">
							<td><%=index++ %></td>
							<td><%=user.getLastname()%></td>
							<td><%=user.getFirstname()%></td>
							<td><a href = "profile_ex3_8220039.jsp?uname=<%= user.getFirstname()%>"><%=user.getEmail()%></a></td>
						</tr>
						<%
							}
						%>
							
					</tbody>
				</table>
            </div>
			
		</div>
		<!-- /container -->

        <%@ include file = "footer_ex3_8220039.jsp" %>
		
	</body>
</html>