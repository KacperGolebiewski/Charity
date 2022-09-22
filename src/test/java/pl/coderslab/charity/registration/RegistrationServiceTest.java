package pl.coderslab.charity.registration;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.*;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.charity.email.EmailSender;
import pl.coderslab.charity.registration.token.ConfirmationToken;
import pl.coderslab.charity.registration.token.ConfirmationTokenService;
import pl.coderslab.charity.user.AppUser;
import pl.coderslab.charity.user.AppUserRepository;
import pl.coderslab.charity.user.AppUserRole;
import pl.coderslab.charity.user.AppUserServiceImpl;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.UUID;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.assertj.core.api.AssertionsForClassTypes.assertThatThrownBy;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.BDDMockito.given;
import static org.mockito.BDDMockito.then;
import static org.mockito.Mockito.never;

class RegistrationServiceTest {

    @Mock
    private AppUserServiceImpl appUserService;

    @Mock
    private EmailValidator emailValidator;
    @Mock
    private AppUserRepository  appUserRepository;

    @Mock
    private ConfirmationTokenService confirmationTokenService;

    @Mock
    private EmailSender emailSender;
    @Captor
    private ArgumentCaptor<ConfirmationToken> tokenArgumentCaptor;

    private RegistrationService underTest;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
        underTest = new RegistrationService(appUserService,emailValidator,confirmationTokenService,emailSender);
    }

    @Test
    void itShouldRegisterUser() {
        //Given
        // ... request
        String email = "email@email.com";
        String password = "password";
        RegistrationRequest request = new RegistrationRequest("John","Smith", email, password, password);
        given(emailValidator.test(email)).willReturn(true);
        String token = appUserService.signUpUser(new AppUser(request.getFirstName(),request.getLastName(),request.getEmail(), request.getPassword(), AppUserRole.ROLE_USER));
        String link = "http://localhost:8080/register/confirm/" + token;
        String emailBody = underTest.buildEmail(request.getFirstName(),link);
        //When
        underTest.register(request);
        //Then
        then(emailSender).should().send(request.getEmail(), emailBody);
        //TODO: check assertion

    }

    @Test
    void itShouldNotRegisterUserWhenEmailIsNotValid() {
        //Given
        // ... request
        String email = "email@email.com";
        String password = "password";
        RegistrationRequest request = new RegistrationRequest("John","Smith", email, password, password);
        given(emailValidator.test(email)).willReturn(false);
        //When
        //Then
        assertThatThrownBy(()->underTest.register(request))
                .isInstanceOf(IllegalStateException.class)
                .hasMessageContaining("email not valid");
        //finally
        then(emailSender).shouldHaveNoInteractions();

    }

    @Test
    void itShouldRegisterAdmin() {
        //Given
        // ... request
        String email = "email@email.com";
        String password = "password";
        RegistrationRequest request = new RegistrationRequest("John","Smith", email, password, password);
        given(emailValidator.test(email)).willReturn(true);
        String token = appUserService.signUpUser(new AppUser(request.getFirstName(),request.getLastName(),request.getEmail(), request.getPassword(), AppUserRole.ROLE_ADMIN));
        String link = "http://localhost:8080/register/confirm/" + token;
        String emailBody = underTest.buildEmail(request.getFirstName(),link);
        //When
        underTest.registerAdmin(request);
        //Then
        then(emailSender).should().send(request.getEmail(), emailBody);
        //TODO: check assertion

    }


    @Test
    void itShouldNotRegisterAdminWhenEmailIsNotValid() {
        //Given
        // ... request
        String email = "email@email.com";
        String password = "password";
        RegistrationRequest request = new RegistrationRequest("John","Smith", email, password, password);
        given(emailValidator.test(email)).willReturn(false);
        //When
        //Then
        assertThatThrownBy(()->underTest.registerAdmin(request))
                .isInstanceOf(IllegalStateException.class)
                .hasMessageContaining("email not valid");
        //finally
        then(emailSender).shouldHaveNoInteractions();

    }



    @Test
    @Transactional
    void itShouldConfirmToken() {
        //Given
        String token = UUID.randomUUID().toString();
        AppUser user = new AppUser();
        user.setEmail("email@gmail.com");
        user.setId(1L);
        user.setFirstName("John");
        user.setLastName("Smith");
        user.setPassword("123");
        String email = user.getEmail();

        ConfirmationToken confirmationToken = new ConfirmationToken(token, LocalDateTime.now(), LocalDateTime.now().plusMinutes(15),user);
        given(confirmationTokenService.getToken(token)).willReturn(Optional.of(confirmationToken));
        //When
        underTest.confirmToken(token);
        //Then
        then(confirmationTokenService).should().setConfirmedAt(token);
        then(appUserService).should().enableAppUser(email);
        //TODO: check assertion
    }
    @Test
    void itShouldNotConfirmTokenWhenThereIsNoToken() {
        //Given
        String token = UUID.randomUUID().toString();
        AppUser user = new AppUser();
        user.setEmail("email@gmail.com");
        user.setId(1L);
        user.setFirstName("John");
        user.setLastName("Smith");
        user.setPassword("123");
        given(confirmationTokenService.getToken(token)).willReturn(Optional.empty());
        //When
        //Then
        assertThatThrownBy(()->underTest.confirmToken(token))
                .isInstanceOf(IllegalStateException.class)
                .hasMessageContaining("token not found");

    }

    @Test
    void itShouldNotConfirmTokenWhenTokenAlreadyConfirmed() {
        //Given
        String token = UUID.randomUUID().toString();
        AppUser user = new AppUser();
        user.setEmail("email@gmail.com");
        user.setId(1L);
        user.setFirstName("John");
        user.setLastName("Smith");
        user.setPassword("123");
        ConfirmationToken confirmationToken = new ConfirmationToken(token, LocalDateTime.now(), LocalDateTime.now().plusMinutes(15),user);
        given(confirmationTokenService.getToken(token)).willReturn(Optional.of(confirmationToken));
        confirmationToken.setConfirmedAt(LocalDateTime.now());


        //When
        //Then
        assertThatThrownBy(()->underTest.confirmToken(token))
                .isInstanceOf(IllegalStateException.class)
                .hasMessageContaining("email already confirmed");

    }

    @Test
    void itShouldNotConfirmTokenWhenTokenExpired() {
        //Given
        String token = UUID.randomUUID().toString();
        AppUser user = new AppUser();
        user.setEmail("email@gmail.com");
        user.setId(1L);
        user.setFirstName("John");
        user.setLastName("Smith");
        user.setPassword("123");
        ConfirmationToken confirmationToken = new ConfirmationToken(token, LocalDateTime.now(), LocalDateTime.now().plusMinutes(15),user);
        given(confirmationTokenService.getToken(token)).willReturn(Optional.of(confirmationToken));
        confirmationToken.setExpiresAt(LocalDateTime.now().minusHours(1));

        //When
        //Then
        assertThatThrownBy(()->underTest.confirmToken(token))
                .isInstanceOf(IllegalStateException.class)
                .hasMessageContaining("token expired");

    }
}