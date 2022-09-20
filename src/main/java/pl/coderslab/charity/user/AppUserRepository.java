package pl.coderslab.charity.user;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

    @Query(nativeQuery = true, value = "select app_user_id from app_user join forgotten_password_token fpt on app_user.id = fpt.app_user_id where fpt.token = ?1")
    Long findByToken(String token);


    @Query("select t from AppUser t where t.appUserRole = ?1")
    Page<AppUser> findAdmins(AppUserRole role, Pageable pageable);


    @Transactional
    @Modifying
    @Query("UPDATE AppUser a SET a.enabled = TRUE WHERE a.email = ?1")
    int enableAppUser(String email);

    @Transactional
    @Modifying
    @Query("UPDATE AppUser a SET a.password = ?1 WHERE a.email = ?2")
    int updatePassword(String password, String email);


}