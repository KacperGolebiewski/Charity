package pl.coderslab.charity.registration;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Captor;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import pl.coderslab.charity.email.EmailSender;
import pl.coderslab.charity.registration.token.ConfirmationTokenService;
import pl.coderslab.charity.user.AppUser;
import pl.coderslab.charity.user.AppUserRole;
import pl.coderslab.charity.user.AppUserServiceImpl;

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
    private ConfirmationTokenService confirmationTokenService;

    @Mock
    private EmailSender emailSender;

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
    void itShouldConfirmToken() {
        //Given
        //When
        //Then

    }
}