package pl.coderslab.charity.user;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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


    @Query("select t from AppUser t where t.appUserRole = ?1")
    Page<AppUser> findAdmins(AppUserRole role, Pageable pageable);

//    @Query(nativeQuery = true, value = "select * from charity_donation.app_user t where t.app_user_role = 'ROLE_ADMIN'")
//    Iterable<AppUser> findAdmins(Sort sort);


    @Transactional
    @Modifying
    @Query("UPDATE AppUser a SET a.enabled = TRUE WHERE a.email = ?1")
    int enableAppUser(String email);


}