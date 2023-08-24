package tech.csm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import tech.csm.model.Booking;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Integer> {

	@Query("from Booking where user.userId=?1")
	List<Booking> findAllByUserId(Integer uId);

	List<Booking> findAllByStatus(String string);




}
