package tech.csm.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Entity
@Data
public class Booking implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="booking_id")
	private Integer bookingId;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@Column(name="date_of_service")
	private Date dateOfBooking;
	
	@ManyToOne
	@JoinColumn(name="place_id")
	private Place place;
	
	private String status;
	
	private Double price;
	
}
