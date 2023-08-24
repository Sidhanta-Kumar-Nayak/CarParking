package tech.csm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.csm.model.User;
import tech.csm.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public User findUserById(Integer uId) {
		return userRepository.findById(uId).get();
	}

	@Override
	public User saveUser(User user) {
		return userRepository.save(user);
	}

}
