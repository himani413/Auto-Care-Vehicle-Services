<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.json.JSONObject" %>

<%
    String code = request.getParameter("code");
    String sessionState = request.getParameter("session_state");
    
    // Set it as a session attribute
    session.setAttribute("sessionState", sessionState); 
    
    // Define the URL
    String url = "https://api.asgardeo.io/t/orgqfac7/oauth2/token";
    String client_Id = "xvsKpS5yAgbX8qXOfRDeNI13Ul4a";
    String client_secret = "O6PN9pU8TRYiukabCKno97x7kphL2UU4t5Kg7D9Q8v4a";
    String redirect_uri = "http://localhost:8080/Auto-Care-Vehicle-Services/authorize.jsp";
    

    // Define the request body parameters
    String postData = "code=" + URLEncoder.encode(code, "UTF-8");
   
    postData += "&grant_type=authorization_code";
    postData += "&client_id=" + URLEncoder.encode(client_Id, "UTF-8");
    postData += "&client_secret=" + URLEncoder.encode(client_secret, "UTF-8");
    postData += "&redirect_uri=" + URLEncoder.encode(redirect_uri, "UTF-8");
    
    // Create a URL object and open a connection
    URL obj = new URL(url);
    HttpURLConnection con = (HttpURLConnection) obj.openConnection();

    // Set the HTTP request method to POST
    con.setRequestMethod("POST");

    // Set the request headers
    con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

    // Enable input/output streams
    con.setDoOutput(true);

    // Write the POST data to the output stream
    try (OutputStream os = con.getOutputStream()) {
        byte[] input = postData.getBytes("UTF-8");
        os.write(input, 0, input.length);
    }

    // Get the response code
    int responseCode = con.getResponseCode();

    // Read the response data
    if (responseCode == HttpURLConnection.HTTP_OK) {
        try (BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()))) {
            String inputLine;
            StringBuilder responseData = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                responseData.append(inputLine);
            }

            // Handle the response data here
            String responseDataStr = responseData.toString();
            
            // Parse the response data as JSON
            JSONObject jsonResponse = new JSONObject(responseDataStr);

            // Extract access_token and id_token
            String access_token = jsonResponse.getString("access_token");
            String id_token = jsonResponse.getString("id_token");

            // Store tokens in session attributes
            request.getSession().setAttribute("access_token", access_token);
            request.getSession().setAttribute("id_token", id_token);

            // Redirect to the home.jsp page
            response.sendRedirect("home.jsp");
        }
    } else {
        // Handle errors here
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <!-- You can include any necessary HTML content here -->
</head>
<body>
    <!-- You can include any necessary HTML content here -->
</body>
</html>
    
