<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error_ex3_8220039.jsp" %>

<!DOCTYPE html>
<html lang="en">
    <%@ include file = "header_ex3_8220039.jsp" %>
    <style>
        .form-control {
            width: 50%;
        }

        .form-group {
            display: flex;
            align-items: center;
        }

        .form-group label {
            width: 30%;
            margin-right: 10px;
            text-align: right;
        }

        .checkbox-container {
            text-align: center;
            margin-top: 20px;
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .btn-submit {
            background-color: green;
            color: white;
        }

        .btn-cancel {
            background-color: red;
            color: white;   
        }

        .jumbotron2 {
            background-color: rgb(255, 227, 167);
            color: rgb(124, 63, 7);
            height: 60px;
            text-align: center;
            display: flex;
            margin-bottom: 30px;
            margin-top: -30px;
            justify-content: center;
        }

        .jumbotron2 h2 {
            font-size: 15px;     
        }
        
    </style>

<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span> 
                    <span class="icon-bar"></span>
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
        <div class="page-header">
            <h1>Registration Form</h1>
        </div>
        <div class="jumbotron2">
            <h2>Please fill in the following form to create an account.</h2>
        </div>
    </div>

    <footer class="navbar-inverse">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <p class="text-center">&copy; Copyright 2019 by ismgroup44</p>
                </div>
            </div>
        </div>
    </footer>

    <div class="container form">
        <form action="registerController_ex3_8220039.jsp" method="post">
            <div class="form-group">
                <label for="InputName">Name</label>
                <input type="text" class="form-control" id="InputName" name="name" placeholder="your name">
            </div>
            <div class="form-group">
                <label for="InputSurname">Surname</label>
                <input type="text" class="form-control" id="InputSurname" name="surname" placeholder="your surname">
            </div>
            <div class="form-group">
                <label for="InputEmail">Email</label>
                <input type="email" class="form-control" id="InputEmail" name="email" placeholder="your email">
            </div>
            <div class="form-group">
                <label for="InputPhone">Username</label>
                <input type="usrnm" class="form-control" id="InputUsername" name="username" placeholder="your username">
            </div>
            <div class="form-group">
                <label for="InputPhone">Password</label>
                <input type="pswrd" class="form-control" id="InputPassword" name="password" placeholder="your password">
            </div>
            <div class="form-group">
                <label for="InputPhone">Confirm</label>
                <input type="cnfrm" class="form-control" id="InputConfirm" name="confirm" placeholder="confirm your password">
            </div>

            <div class="checkbox-container">
                <label>
                    <input type="checkbox" name="agree"> I aggree to the terms and conditions
                </label>
            </div>


            <div class="button-container">
                <button type="submit" class="btn btn-submit"> ✔Submit</button>    
                <button type="button" class="btn btn-cancel" onclick="window.location.href='index_ex3_8220039.jsp'">❌Cancel</button>   
            </div> 
        </form>
    </div>

    <%@ include file = "footer_ex3_8220039.jsp" %>
</body>
</html>
