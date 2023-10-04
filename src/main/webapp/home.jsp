<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.IOException" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.sql.*, java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
        // Retrieve access_token and id_token from session attributes
        String introUrl = "https://api.asgardeo.io/t/orgqfac7/oauth2/introspect";

        String access_token = (String) request.getSession().getAttribute("access_token");
        String id_token = (String) request.getSession().getAttribute("id_token");
        String jsonDataString = ""; // Initialize jsonDataString here


        // Check if the tokens exist in the session
         if (access_token != null && id_token != null) {
        	    String apiUrl = "https://api.asgardeo.io/t/orgqfac7/oauth2/userinfo";

        try {
            // Create a URL object
            URL url = new URL(apiUrl);

            // Open a connection to the URL
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // Set the request method to GET
            connection.setRequestMethod("GET");

            // Set the "Authorization" header with the Bearer token
            connection.setRequestProperty("Authorization", "Bearer " + access_token);

            // Get the response code
            int responseCode = connection.getResponseCode();

            // Check if the response code indicates success (HTTP 200 OK)
            if (responseCode == HttpURLConnection.HTTP_OK) {
                // Create a BufferedReader to read the response
                BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                String inputLine;
                StringBuilder responseStringBuilder = new StringBuilder();

                // Read the response line by line
                while ((inputLine = in.readLine()) != null) {
                    responseStringBuilder.append(inputLine);
                }
                in.close();

                // Parse the JSON response
                JSONObject jsonResponse = new JSONObject(responseStringBuilder.toString());
					//out.println(jsonResponse);
                // Retrieve user information
                String given_name = jsonResponse.getString("given_name");
                //String family_name = jsonResponse.getString("family_name");
                String country = jsonResponse.getString("country");
                String phone_number = jsonResponse.getString("phone_number");
                String email = jsonResponse.getString("email");

             // Store the email in a session attribute
                session.setAttribute("userEmail", email);
             
             	
              
               %>
			 <script>
			 document.addEventListener("DOMContentLoaded", function() {
				    
				  	
				  	var first_name = '<%=given_name%>';
				  	var coun_try = '<%=country %>';
				    var phone_num = '<%=phone_number%>';
				    var e_mail = '<%=email%>';
		
				  
				    // Now you can use these JavaScript variables to update your HTML elements
				    document.getElementById("fName").textContent =  first_name;
				    //document.getElementById("lName").textContent =  last_name;
				    document.getElementById("country").textContent =  coun_try;
				    document.getElementById("phone_no").textContent =  phone_num;
				    document.getElementById("email").textContent =  e_mail;
				});
			</script>
          <%       
            } else {
                // Handle error responses here
                out.println("HTTP Error: " + responseCode);
            }

            // Closing the connection
            connection.disconnect();
        } catch (IOException e) {
            
            e.printStackTrace();
        }
    } else {
        // Handle the case when either accessToken or idToken is null
        %>
    	<script>
			alert("Access token is missing");
		</script>
		<% 
    }
    %>
    
<html>
<head>
<title>Vehicle Service Reservation</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<style>
		.navblock{display:flex;}
		#welcome{margin-bottom:30px;}
		#info{margin-bottom:30px;}
		header{height:80px;}
		.navbar{height:70px;}
		.navbar-brand{font-size: 25px;}
		.nav-link{font-size:20px;}
	
	</style>
</head>

<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: #774d78; justify-content: space-between;">
			
			<div class="navblock">
			<ul class="navbar-nav" >
			<!--passing the email into ervlet class to retrive all service records from this email.-->
			<%
    
    			String useremail = (String) session.getAttribute("userEmail"); // Get the user's email from the session
			%>
				<li><a href="<%=request.getContextPath()%>/new"
					class="nav-link">New Reservation</a></li>
			</ul>
			</div>
			
			<div class="navblock">
				<a href="home.jsp" class="navbar-brand"> Auto Care - Vehicle Services </a>
			</div>
			
			<div class="navblock" id="logout">
			<ul class="navbar-nav">
				<li><a href='index.jsp' class="nav-link">Logout</a></li>
			</ul>
			</div>
			
		</nav>
	</header>
	<br>
	<div class="container" >
	
     <h2 id="welcome">Welcome, <span id="fName"></span>!</h2>
            
  <table class="table" id="info">
    <thead>
      <tr>
        <th>Email</th>
        <th>Phone Number</th>
        <th>Country</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td id="email"></td>
        <td id="phone_no"></td>
        <td id="country"></td>
      </tr>
      
    </tbody>
  </table>
            
	 
	
	</div>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">Your Vehicle Service Reservations</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/list?email=<%=useremail%>" class="btn btn-success">Show My Reservations</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Booking ID</th>
						<th>Date</th>
						<th>Time</th>
						<th>Location</th>
						<th>Vehicle no.</th>
						<th>Mileage</th>
						<th>Message</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach var="vehicleService" items="${listVehicleSerivice}">

						<tr>
							<td><c:out value="${vehicleService.booking_id}" /></td>
							<td><c:out value="${vehicleService.date}" /></td>
							<td><c:out value="${vehicleService.time}" /></td>
							<td><c:out value="${vehicleService.location}" /></td>
							<td><c:out value="${vehicleService.vehicle_no}" /></td>
							<td><c:out value="${vehicleService.mileage}" /></td>
							<td><c:out value="${vehicleService.message}" /></td>
							<td><a href="delete?booking_id=<c:out value='${vehicleService.booking_id}' />">Delete</a></td>
						</tr>
					</c:forEach>
		
				</tbody>

			</table>
		</div>
	</div>
</body>
</html>