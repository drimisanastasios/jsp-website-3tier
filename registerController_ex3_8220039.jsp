<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error_ex3_8220039.jsp" %>
<%@ page import="exercise3_2024_2025_8220039.User" %>
<%@ page import="exercise3_2024_2025_8220039.UserDAO" %>

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
					<li class="active"><a href="register_ex3_8220039.jsp">Register</a></li>					
					<li><a href="about_ex3_8220039.jsp">About</a></li>					
				</ul>	
			</div>
		</div>
	</nav>

	<div class="container theme-showcase" role="main">
		<div class="jumbotron">
			<h1>1η Ατομική Άσκηση</h1>
		</div>

	</div>

	<% 
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");
        String agree = request.getParameter("agree"); 

        if ((name != null && name.length() >= 3) &&
            (surname != null && surname.length() >= 3) &&
            (username != null && username.length() >= 5) &&
            (password != null && password.length() >= 6) &&
            (agree != null && agree.equals("on")) && 
            (confirm != null && confirm.equals(password))) {
            
            User user = new User(name, surname, email, username, password);
            UserDAO userdao = new UserDAO();
            userdao.register(user);

    %>
    <div class="page-header">
        <h1>Registration almost done!</h1>
    </div>            
    <div class="container theme-showcase" role="main">
        <div class="jumbotron2">
            <h2><b>Note: </b> a verification link has been sent to the email: <%=email%></h2>
        </div>
        <ul class="list">
            <li><b>Name: </b><%= name %></li>
            <li><b>Surname: </b><%= surname %></li>
            <li><b>Email: </b><%= email %></li>
            <li><b>Username: </b><%= username %></li>
        </ul>
    </div>

    <% 
        } else {
    %>

    <div class="container theme-showcase" role="main">
        <div class="page-header">
            <h3>Registration form has errors</h3>
        </div>
        <div class="jumbotron3">
            <ul class="list2">
                <li>Sorry, username or email already registered.</li>
            </ul>
        </div>
        <div class="button-container">
            <button type="submit" class="btn btn-submit" onclick="window.location.href='register_ex3_8220039.jsp'"><b><</b> Back to the form</button>
        </div>
    </div>

    <%
        }
    %>

	<%@ include file = "footer_ex3_8220039.jsp" %>
</body>
</html>
