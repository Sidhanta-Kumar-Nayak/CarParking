package tech.csm.service;

import java.util.List;

import tech.csm.model.Place;

public interface PlaceService {

	List<Place> findAllPlaces();

	Place findById(Integer pId);

	Place addSeatsToPlace(Place place);

}
