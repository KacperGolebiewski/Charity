package pl.coderslab.charity.password;


import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Optional;

@Service
@AllArgsConstructor
public class ForgottenPasswordTokenService {

    private final ForgottenPasswordTokenRepository forgottenPasswordTokenRepository;


    public void saveForgottenPasswordToken(ForgottenPasswordToken token) {
        forgottenPasswordTokenRepository.save(token);
    }

    public Optional<ForgottenPasswordToken> getToken(String token) {
        return forgottenPasswordTokenRepository.findByToken(token);
    }

    public int setConfirmedAt(String token) {
        return forgottenPasswordTokenRepository.updateConfirmedAt(token, LocalDateTime.now());
    }
}
