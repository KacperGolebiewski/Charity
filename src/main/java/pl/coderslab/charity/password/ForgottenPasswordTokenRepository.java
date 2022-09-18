package pl.coderslab.charity.password;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.charity.registration.token.ConfirmationToken;

import java.time.LocalDateTime;
import java.util.Optional;


@Repository
@Transactional(readOnly = true)
public interface ForgottenPasswordTokenRepository extends JpaRepository<ForgottenPasswordToken, Long> {

    Optional<ForgottenPasswordToken> findByToken(String token);

    @Transactional
    @Modifying
    @Query("UPDATE ForgottenPasswordToken f SET f.confirmedAt = ?2 WHERE f.token = ?1")
    int updateConfirmedAt(String token, LocalDateTime confirmedAt);
}
