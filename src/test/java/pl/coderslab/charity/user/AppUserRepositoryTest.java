package pl.coderslab.charity.user;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import pl.coderslab.charity.password.ForgottenPasswordToken;
import pl.coderslab.charity.password.ForgottenPasswordTokenRepository;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.UUID;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

@DataJpaTest
@AutoConfigureTestDatabase(replace= AutoConfigureTestDatabase.Replace.NONE)
class AppUserRepositoryTest {

    @Autowired
    AppUserRepository underTest;
    @Autowired
    ForgottenPasswordTokenRepository forgottenPasswordTokenRepository;


    @Test
    void itShouldFindUserByEmail() {
        //Given
        AppUser user = new AppUser();
        user.setEmail("email@gmail.com");
        user.setId(1L);
        user.setFirstName("John");
        user.setLastName("Smith");
        user.setPassword("123");
        //When
        underTest.save(user);
        //Then
        Optional<AppUser> optionalAppUser = underTest.findByEmail(user.getEmail());
        assertThat(optionalAppUser).isPresent().hasValueSatisfying(u -> {
            assertThat(u).usingRecursiveComparison().isEqualTo(user);
        });
    }

    @Test
    void itShouldNotFindUserByEmailWhenEmailDoesNotExists() {
        //Given
        String email = "email";
        //When
        //Then
        Optional<AppUser> optionalAppUser = underTest.findByEmail(email);
        assertThat(optionalAppUser).isNotPresent();
    }

    @Test
    void itShouldFindUserIdByToken() {
        //Given
        AppUser user = new AppUser();
        user.setEmail("email@gmail.com");
        user.setId(1L);
        user.setFirstName("John");
        user.setLastName("Smith");
        user.setPassword("123");

        ForgottenPasswordToken token = new ForgottenPasswordToken();
        token.setId(1L);
        token.setCreatedAt(LocalDateTime.now());
        token.setExpiresAt(LocalDateTime.now().plusMinutes(15));
        token.setAppUser(user);
        token.setToken(UUID.randomUUID().toString());
        //When
        underTest.save(user);
        forgottenPasswordTokenRepository.save(token);
        //Then
        Long id = underTest.findByToken(token.getToken());
        assertThat(id).usingRecursiveComparison().isEqualTo(token.getAppUser().getId());

    }

    @Test
    void itShouldNotFindUserIdByTokenWhenTokenDoesNotExists() {
        //Given
        String token = UUID.randomUUID().toString();
        //When
        //Then
        Long id = underTest.findByToken(token);
        assertThat(id).isNull();

    }

    @Test
    void itShouldFindAdminsPaginated() {
        //Given
        //When
        //Then


    }

    @Test
    void itShouldEnableAppUser() {
        //Given
        AppUser user = new AppUser();
        user.setEmail("1@gmail.com");
        user.setId(1L);
        user.setFirstName("John");
        user.setLastName("Smith");
        user.setPassword("123");
        String email = user.getEmail();
        underTest.save(user);
        //When
        underTest.enableAppUser(user.getEmail());
        //Then
        Optional<AppUser> byEmail = underTest.findByEmail(email);
        assertThat(byEmail).isPresent().hasValueSatisfying(u -> {
            assertThat(u).usingRecursiveComparison().isEqualTo(user);
        });


    }

    @Test
    void itShouldUpdatePassword() {
        //Given
        AppUser user = new AppUser();
        user.setEmail("1@gmail.com");
        user.setId(1L);
        user.setFirstName("John");
        user.setLastName("Smith");
        user.setPassword("123");
        String email = user.getEmail();
        String newPassword = "12345";
        underTest.save(user);
        //When
        underTest.updatePassword(newPassword,email);
        //Then
        Optional<AppUser> appUserOptional = underTest.findByEmail(email);
        assertThat(appUserOptional).isPresent().hasValueSatisfying(u -> {
            assertThat(u).usingRecursiveComparison().isEqualTo(user);
        });

    }
}

