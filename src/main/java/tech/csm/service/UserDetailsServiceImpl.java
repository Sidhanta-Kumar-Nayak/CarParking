package tech.csm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.csm.model.UserDetails;
import tech.csm.repository.UserDetailsRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private UserDetailsRepository userDetailsRepository;
	

	@Override
	public UserDetails findDetailsById(Integer uId) {
		 return userDetailsRepository.findByUserDetailsId(uId);
	}


	@Override
	public UserDetails saveUserdtls(UserDetails userdtls) {
		return userDetailsRepository.save(userdtls);
	}





	




}
