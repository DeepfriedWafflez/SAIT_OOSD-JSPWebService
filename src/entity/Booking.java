package entity;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the bookings database table.
 * 
 */
@Entity
@Table(name="bookings")
@NamedQuery(name="Booking.findAll", query="SELECT b FROM Booking b")
public class Booking implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@SequenceGenerator(name="BOOKINGS_BOOKINGID_GENERATOR" )
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="BOOKINGS_BOOKINGID_GENERATOR")
	private int bookingId;

	@Temporal(TemporalType.TIMESTAMP)
	private Date bookingDate;

	private String bookingNo;

	private int customerId;

	private int packageId;

	private double travelerCount;

	private String tripTypeId;

	//bi-directional many-to-one association to Bookingdetail
	@OneToMany(mappedBy="booking")
	private List<Bookingdetail> bookingdetails;

	public Booking() {
	}

	public int getBookingId() {
		return this.bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public Date getBookingDate() {
		return this.bookingDate;
	}

	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}

	public String getBookingNo() {
		return this.bookingNo;
	}

	public void setBookingNo(String bookingNo) {
		this.bookingNo = bookingNo;
	}

	public int getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public int getPackageId() {
		return this.packageId;
	}

	public void setPackageId(int packageId) {
		this.packageId = packageId;
	}

	public double getTravelerCount() {
		return this.travelerCount;
	}

	public void setTravelerCount(double travelerCount) {
		this.travelerCount = travelerCount;
	}

	public String getTripTypeId() {
		return this.tripTypeId;
	}

	public void setTripTypeId(String tripTypeId) {
		this.tripTypeId = tripTypeId;
	}

	public List<Bookingdetail> getBookingdetails() {
		return this.bookingdetails;
	}

	public void setBookingdetails(List<Bookingdetail> bookingdetails) {
		this.bookingdetails = bookingdetails;
	}

	public Bookingdetail addBookingdetail(Bookingdetail bookingdetail) {
		getBookingdetails().add(bookingdetail);
		bookingdetail.setBooking(this);

		return bookingdetail;
	}

	public Bookingdetail removeBookingdetail(Bookingdetail bookingdetail) {
		getBookingdetails().remove(bookingdetail);
		bookingdetail.setBooking(null);

		return bookingdetail;
	}

}