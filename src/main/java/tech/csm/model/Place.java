package tech.csm.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name="place")
@Data
public class Place implements Serializable {

	@Id
	@Column(name="place_id")
	private Integer placeId;
	
	@Column(name="place_name")
	private String placeName;
	
	@Column(name="price")
	private Double price;
	
	@Column(name="seats")
	private Integer seats;
	
	
	
}
