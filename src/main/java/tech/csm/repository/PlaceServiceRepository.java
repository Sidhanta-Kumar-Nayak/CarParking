package tech.csm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tech.csm.model.Place;

@Repository
public interface PlaceServiceRepository extends JpaRepository<Place, Integer> {

}
