<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="ISO-8859-1">
	<title>Vehicle Service Reservation - Login</title>
	<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

	<style>
	body {
    background: #fff;
	}
	
	html, body {
	    height: 100%;
	}	
	
	.app-name {
	    color: #5663ab;
	}
	
	.container{
	 width:100%;
	 
	}
	
	.login-block {
	    margin: 0;
	    width:100%;
	    hieght: 80%;
	    padding: 6.25rem;
	}
	
	.login-sec {
	    padding: 3.125rem 1.875rem;
	    position: relative;
	    background: #f8f9fa;
	}
	
	#btn-login{
	 margin-top: 15px;
	 margin-left: 120px;
	 width: 100px;
	font-size: 20px;
	}
	
	.app-icon {
	    text-align: center;
	    width: 7.625rem;
	    height: 7.625rem;
	    line-height: 7.125rem;
	    border-radius: 100%;
	    border: 0.25rem solid #dbe4ec;
	}
	
	.app-icon i {
	    line-height: 7.125rem;
	}
	
	.app-name {
	    font-size: 2rem;
	    font-weight: 800;
	    letter-spacing: 0.2rem;
	    padding: 1.2rem 0 0.2rem 0;
	    color: #774d78;
	}
	
	.app-login-form {
	    margin-bottom: 0;
	    text-align: center;
	}
	
	#tagline{
		display: flex;
        justify-content: center; /* Horizontally center the text */
        align-items: center; /* Vertically center the text */
        font-size: 20px;
        margin-top: 20px;
        font-style: italic;
        color: gray;
	}
		
	</style>
</head>
<body class="app-login">

<section class="login-block">
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-md-4 col-lg-4 mx-auto login-sec">
               
                <div class="app-name text-center">Auto Care Vehicle Services</div>
                <div class="inner-div">

					<button id="btn-login" class="btn btn-success" onclick="window.location.href='https://api.asgardeo.io/t/orgqfac7/oauth2/authorize?response_type=code&client_id=xvsKpS5yAgbX8qXOfRDeNI13Ul4a&scope=openid%20email%20phone%20profile&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2FAuto-Care-Vehicle-Services%2Fauthorize.jsp'" >
						<span class="btn-text">Login</span>
						<div class="fill-container"></div>
					</button>
				
	
				</div>
            </div>
        </div>
    </div>
    <h5><span id="tagline">Drive in Peace of Mind with Your Trusted Auto Care Partner..</span></h5>
</section>

</body>
</html>