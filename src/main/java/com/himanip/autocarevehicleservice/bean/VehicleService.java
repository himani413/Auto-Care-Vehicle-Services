package com.himanip.autocarevehicleservice.bean;

public class VehicleService {
	
	private int booking_id;
	private String date;
	private String time;
	private String location;
	private String vehicle_no;
	private int mileage;
	private String message;
	private String username;
	
	public int getBooking_id() {
		return booking_id;
	}
	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}
	public String getUserName() {
		return username;
	}
	public void setUserName(String username) {
		this.username = username;
	}
	
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getVehicle_no() {
		return vehicle_no;
	}
	public void setVehicle_no(String vehicle_no) {
		this.vehicle_no = vehicle_no;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public VehicleService(int booking_id, String date, String time,
			String location, String vehicle_no, int mileage, String message, String username) {
		super();
		this.booking_id = booking_id;
		this.date = date;
		this.time = time;
		this.location = location;
		this.vehicle_no = vehicle_no;
		this.mileage = mileage;
		this.message = message;
		this.username = username;
	}
	public VehicleService( String date, String time, String location,
			String vehicle_no, int mileage, String message, String username) {
		super();
		this.date = date;
		this.time = time;
		this.location = location;
		this.vehicle_no = vehicle_no;
		this.mileage = mileage;
		this.message = message;
		this.username = username;
	}

}
