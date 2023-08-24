package tech.csm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.csm.model.Booking;
import tech.csm.repository.BookingRepository;

@Service
public class BookingServiceImpl implements BookingService {

	@Autowired
	private BookingRepository bookingRepository;

	@Override
	public Booking saveBooking(Booking booking) {
		if(booking.getBookingId()==null) {
		booking.setStatus("pending");
		}else {
			booking.setStatus("approved");
		}
		return bookingRepository.save(booking);
		
	}

	@Override
	public List<Booking> findAll() {
		return bookingRepository.findAll();
	}

	@Override
	public List<Booking> findAllByUserId(Integer uId) {
		return bookingRepository.findAllByUserId(uId);
	}

	@Override
	public List<Booking> findByPendingStatus() {
		return bookingRepository.findAllByStatus("pending");
	}

	@Override
	public Booking findById(Integer bId) {
		return bookingRepository.findById(bId).get();
	}
}
