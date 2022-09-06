package pl.coderslab.charity.user;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Repository
@Transactional(readOnly = true)
public interface AppUserRepository extends JpaRepository<AppUser, Long> {

    Optional<AppUser> findByEmail(String email);

    @Transactional
    @Modifying
    @Query("UPDATE AppUser a SET a.enabled = TRUE WHERE a.email = ?1")
    int enableAppUser(String email);

    @Transactional
    @Modifying
    @Query(nativeQuery= true, value ="UPDATE charity_donation.app_user t SET t.first_name = ?1, t.last_name = ?2, t.password = ?3 WHERE t.email = ?4")
    void updateUser(String firstName, String lastName, String password, String email);

    @Transactional
    @Modifying
    @Override
    <S extends AppUser> S save(S entity);
}