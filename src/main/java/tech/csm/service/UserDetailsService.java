package tech.csm.service;

import java.util.List;

import tech.csm.model.Place;
import tech.csm.model.UserDetails;

public interface UserDetailsService {


	UserDetails findDetailsById(Integer uId);

	UserDetails saveUserdtls(UserDetails userdtls);

}
