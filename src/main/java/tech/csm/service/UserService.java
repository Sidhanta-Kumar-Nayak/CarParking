package tech.csm.service;

import tech.csm.model.User;

public interface UserService {

	User findUserById(Integer uId);

	User saveUser(User user);

}
