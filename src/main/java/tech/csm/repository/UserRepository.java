package tech.csm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tech.csm.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

}
