package entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.SecondaryTable;
import javax.persistence.Table;

@Entity
@Table(name="bookings")
@SecondaryTable(name="bookingdetails")
//@SecondaryTable(name = "bookingdetails", pkJoinColumns = @PrimaryKeyJoinColumn(name = "BookingId", referencedColumnName = "BookingId"))

//@NamedQueries({
//@NamedQuery(name="Bookings.findAll", query="SELECT b FROM Bookings b"),
//@NamedQuery(name="BookingDetails.findAll", query="SELECT bd FROM BookingDetails bd")})
public class Bookings implements Serializable {
	/*
	* Purpose: Bookings object to store database properties
	* Made by: Brent Ward
	* Module: OOSD CRPG-207
	* Date: June 17th 2019
	*/
	
	private static final long serialVersionUID = 1L;
	
	@Id
	private int BookingId;
	private Date BookingDate;
	private String BookingNo;
	private int TravelerCount;
	private int CustomerId;
	
	@Column(table = "bookingdetails")
	private int BookingDetailId;
	@Column(table = "bookingdetails")
	private int ItineraryNo;
	@Column(table = "bookingdetails")
	private Date TripStart;
	@Column(table = "bookingdetails")
	private Date TripEnd;
	@Column(table = "bookingdetails")
	private String Description;
	@Column(table = "bookingdetails")
	private String Destination;
	@Column(table = "bookingdetails")
	private double BasePrice;
	
	
	public Bookings() {}
	
	//getters
	public int getBookingId() { return BookingId; }
	public Date getBookingDate() { return BookingDate; }
	public String getBookingNo() { return BookingNo; }
	public int getTravelerCount() { return TravelerCount; } 
	public int getCustomerId() { return CustomerId; }
	
	public int getBookingDetailId() { return BookingId; }
	public int getItineraryNo() { return ItineraryNo; }
	public Date getTripStart() { return TripStart; }
	public Date getTripEnd() { return TripEnd; }
	public String getDescription() { return Description; }
	public String getDestination() { return Destination; }
	public double getBasePrice() { return BasePrice; }
	
}