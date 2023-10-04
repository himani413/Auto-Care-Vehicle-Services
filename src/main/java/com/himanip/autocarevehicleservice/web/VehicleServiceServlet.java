package com.himanip.autocarevehicleservice.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.himanip.autocarevehicleservice.bean.VehicleService;
import com.himanip.autocarevehicleservice.dao.VehicleServiceDao;

/**
 * Servlet implementation class VehicleServiceServlet
 */
@WebServlet("/")
public class VehicleServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       private VehicleServiceDao vehicleServiceDao;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init() throws ServletException {
		vehicleServiceDao = new VehicleServiceDao();
	}
	
/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();

		
		try {
			switch (action) {
			case "/new":
				showNewForm(request, response);
				break;
				
			case "/insert":
				insertVehicleService(request, response);
				break;
				
			case "/delete":
				deleteVehicleService(request, response);
				break;
	
			default:
				String email = request.getParameter("email"); // retrieving the user email fom the home page.
				listVehicleService(request, response,email);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}
		

	

	private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		RequestDispatcher dispatcher = request.getRequestDispatcher("vehicle-service-form.jsp");
		dispatcher.forward(request, response);
		
	}

	//insert vehicle service
	private void insertVehicleService(HttpServletRequest request, HttpServletResponse response)throws SQLException, IOException 
	{
   
		
		String date = request.getParameter("date");
		
		String time = request.getParameter("time");
		
		
		String location = request.getParameter("location");
		String vehicle_no = request.getParameter("vehicle_no");
		int mileage = Integer.parseInt(request.getParameter("mileage"));
		String message = request.getParameter("message");
		String username = request.getParameter("username");
		
		VehicleService newVehicleService = new VehicleService(date, time, location, vehicle_no, mileage, message, username);
		
		vehicleServiceDao.insertVehicleService(newVehicleService);
		
		response.sendRedirect("list");
		
	}
	
	//delete vehicle service
	private void deleteVehicleService(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException 
	{
		int booking_id = Integer.parseInt(request.getParameter("booking_id"));
		try {
		
			vehicleServiceDao.deleteVehicleService(booking_id);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		response.sendRedirect("list");
	}

	
	//default
	private void listVehicleService(HttpServletRequest request, HttpServletResponse response,String email)throws SQLException, IOException, ServletException 
	{ 

		String username = email;
		try {
			List<VehicleService> listVehicleService = vehicleServiceDao.selectAllVehicleServices(username);
			request.setAttribute("listVehicleSerivice", listVehicleService);
			RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
			dispatcher.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	

}

