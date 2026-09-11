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
    <style>
        .jumbotron2 h2 {
           font-size: 20px;
        }
        .jumbotron2 {
           background-color: rgb(167, 224, 170);
           color: rgb(21, 83, 21);
           height: 60px;
           text-align: center;
           display: flex;
           align-items: center;
           justify-content: center;
           border-radius: 10px;
       }

       .jumbotron2 h3 {
           font-size: 15px;
       }

       .jumbotron3 {
           background-color: rgb(218, 140, 140);
           color: rgb(136, 9, 9);
           height: 150px;
           display: flex;
           align-items: center;
           justify-content: center;
           text-align: center;
           border-radius: 10px;
       }

       .button-container {
           display: flex;
          margin-top: 10px;
       }

       .btn-submit {
           background-color: rgb(74, 179, 221);
           color: white;
       }
   </style>
	
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
						<li><a href="dashboard_ex3_8220039.jsp">Dashboard</a></li>
										
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
            <div class="jumbotron">
                <h1>3η Ατομική Άσκηση</h1>
            </div>
    
        <%
            String uname1 = request.getParameter("uname");
            UserDAO userdao = new UserDAO();
            User prinuser = userdao.findUser(uname1);
            if (prinuser != null) {
        %>
        <div class="page-header">
            <h1>Profile of: <%= prinuser.getFirstname()%> <%= prinuser.getLastname()%></h1>
        </div>            
        <div class="container theme-showcase" role="main">
            <ul class="list-unstyled">
                <li><b>First Name: </b><%= prinuser.getFirstname()%></li>
                <li><b>Last Name: </b><%= prinuser.getLastname()%></li>
                <li><b>Email: </b><%= prinuser.getEmail()%></li>
                <li><b>Username: </b><%= prinuser.getUsername()%></li>
            </ul>
        </div>
        <%
            } else {
        %>
        <div class="container theme-showcase" role="main">
            <div class="jumbotron3">
                <p><b>User not found!</b></p>
            </div>
        </div>
    
        <%
            }
        %>
        <%@ include file = "footer_ex3_8220039.jsp" %>
		
	</body>
</html>