package tech.csm.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name="user_details")
public class UserDetails implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer slno;
	
	@OneToOne
	@JoinColumn(name = "user_id")
	private User user;
	

	@Column(name="car_name")
	private String carName;
	
	@Column(name="email")
	private String email;
	
	@Column(name="driving_experience")
	private Integer drivingExp;
	
	@Column(name="date_of_birth")
	private Date date;
	
	@Column(name="phone_no")
	private String phoneNo;
	
	@Column(name="car_number")
	private String carNumber;
	
	
	
}
