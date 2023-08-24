package tech.csm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.csm.model.Place;
import tech.csm.repository.PlaceServiceRepository;

@Service
public class PlaceServiceImpl implements PlaceService{
	
	@Autowired
	private PlaceServiceRepository PlaceServiceRepository;

	@Override
	public List<Place> findAllPlaces() {
		return PlaceServiceRepository.findAll();
	}

	@Override
	public Place findById(Integer pId) {
		return PlaceServiceRepository.findById(pId).get();
	}


	@Override
	public Place addSeatsToPlace(Place place) {
		return PlaceServiceRepository.save(place);
	}

}
