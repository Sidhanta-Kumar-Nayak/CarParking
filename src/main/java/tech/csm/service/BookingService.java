package tech.csm.service;

import java.util.List;

import tech.csm.model.Booking;

public interface BookingService {

	Booking saveBooking(Booking booking);

	List<Booking> findAll();

	List<Booking> findAllByUserId(Integer uId);

	List<Booking> findByPendingStatus();

	Booking findById(Integer bId);

}
