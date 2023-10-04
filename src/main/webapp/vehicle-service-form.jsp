

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
// Retrieve the email from the session attribute
String userEmail = (String) session.getAttribute("userEmail");
%>
<html>
<head>
<title>Vehicle Service Reservation</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
 <style>
	.navblock{display:flex;}
	
 </style>
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: #774d78; justify-content: space-between;">
			
			<div class="navblock">
			<ul class="navbar-nav" >
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">My Reservations</a></li>
			</ul>
			</div>
			
			<div class="navblock">
				<a href="home.jsp" class="navbar-brand"> Auto Care - Vehicle Services </a>
			</div>
			
			<div class="navblock" id="logout">
			<ul class="navbar-nav">
				<li><a href="home.jsp" class="nav-link">Back</a></li>
			</ul>
			</div>
			
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				
				<c:if test="${vehicleService == null}">
					<form action="insert" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${vehicleService == null}">
            			Add New Reservation
            		</c:if>
					</h2>
				</caption>

			
				
				<fieldset class="form-group">
    				<label>Username (Authenticated User)</label>
    				<input type="text"  class="form-control" name="username" value="<%=userEmail%>" required="required" readonly>
				</fieldset>
				
				<fieldset class="form-group">
    				<label>Date of Service Reservation</label>
    				<input type="date" class="form-control" name="date" required="required" min="<%=java.time.LocalDate.now()%>" onblur="validateDate(this)" oninput="validateSunday(this)">
				</fieldset>
				<script>
				    function validateSunday(input) {
				        // Get the selected date from the input field
				        var selectedDate = new Date(input.value);
				        
				        // Check if the selected date is a Sunday (day 0 in JavaScript Date object)
				        if (selectedDate.getDay() === 0) {
				            alert("Sundays are not allowed. Please select a different date.");
				            input.value = ""; // Clear the input field
				        }
				    }
				</script>
				<fieldset class="form-group">
    				<label>Preferred Time</label>
    				<select class="form-control" name="time" required="required">
				        <option value="15:30:00">10 AM</option>
				        <option value="16:30:00">11 AM</option>
				        <option value="17:30:00">12 PM</option>
    				</select>
				</fieldset>
				
				<fieldset class="form-group">
			    	<label>Preferred Location</label>
			    	<select class="form-control" name="location" required="required">
				        
				        <option value="Ampara">Ampara</option>
				        <option value="Anuradhapura">Anuradhapura</option>
				        <option value="Badulla">Badulla</option>
				        <option value="Batticaloa">Batticaloa</option>
				        <option value="Colombo">Colombo</option>
				        <option value="Galle">Galle</option>
				        <option value="Gampaha">Gampaha</option>
				        <option value="Hambanthota">Hambanthota</option>
				        <option value="Jaffna">Jaffna</option>
				        <option value="Kaluthara">Kaluthara</option>
				        <option value="Kandy">Kandy</option>
				        <option value="District 12">Kegalle</option>
				        <option value="Kegalle">kilinochchi</option>
				        <option value="Kurunegala">Kurunegala</option>
				        <option value="Mannar">Mannar</option>
				        <option value="Mathale">Mathale</option>
				        <option value="Matara">Matara</option>
				        <option value="Monaragala">Monaragala</option>
				        <option value="Mullaitivu">Mullaitivu</option>
				        <option value="Nuwara Eliya">Nuwara Eliya</option>
				        <option value="Pollonnaruwa">Pollonnaruwa</option>
				        <option value="Puttalam">Puttalam</option>
				        <option value="Ratnapura">Ratnapura</option>
				        <option value="Trincomalee">Trincomalee</option>
				        <option value="Vavuniya">Vavuniya</option>
			        
			    	</select>
				</fieldset>
				
				
				<fieldset class="form-group">
				    <label>Vehicle Registration Number</label>
				    <input type="text" class="form-control" name="vehicle_no" required="required">
				</fieldset>

				<fieldset class="form-group">
    				<label>Current Mileage</label>
    				<input type="number" class="form-control" name="mileage" required="required">
				</fieldset>
				
				<fieldset class="form-group">
    				<label>Message</label>
    				<textarea class="form-control" name="message" required="required"></textarea>
				</fieldset>

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>