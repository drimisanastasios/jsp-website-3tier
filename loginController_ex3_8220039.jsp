<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_ex3_8220039.jsp"%>
<%@ include file = "header_ex3_8220039.jsp" %>
<%@ page import="exercise3_2024_2025_8220039.UserDAO, exercise3_2024_2025_8220039.User" %>

<%
    try {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        if (username == null || password == null) {
            throw new Exception("No parameters specified, please visit <a href='login_ex3_8220039.jsp'>login form</a>");
        }

        UserDAO usda = new UserDAO();
        User user = usda.authenticate(username, password);

        session.setAttribute("userObj2024", user);
        response.sendRedirect("dashboard_ex3_8220039.jsp");

    } catch (Exception e) {
        request.setAttribute("message", "Wrong username or password");
        request.getRequestDispatcher("login_ex3_8220039.jsp").forward(request, response);
    }
%>