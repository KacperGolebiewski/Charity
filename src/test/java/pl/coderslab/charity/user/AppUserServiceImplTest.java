package pl.coderslab.charity.user;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import org.mockito.Captor;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import pl.coderslab.charity.registration.token.ConfirmationToken;
import pl.coderslab.charity.registration.token.ConfirmationTokenService;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.UUID;

import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.BDDMockito.given;
import static org.mockito.BDDMockito.then;
import static org.mockito.Mockito.never;

class AppUserServiceImplTest {

    @Mock
    private AppUserRepository appUserRepository;
    @Mock
    private ConfirmationTokenService confirmationTokenService;

    @Captor
    private ArgumentCaptor<AppUser> userArgumentCaptor;

    @Captor
    private ArgumentCaptor<ConfirmationToken> tokenArgumentCaptor;

    @Mock
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    private AppUserServiceImpl underTest;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
        underTest = new AppUserServiceImpl(appUserRepository,bCryptPasswordEncoder,confirmationTokenService);
    }

    @Test
    void itShouldSignUpNeWUser() {
        //Given
        // ... user
        AppUser user = new AppUser();
        user.setEmail("email@gmail.com");
        user.setId(1L);
        user.setFirstName("John");
        user.setLastName("Smith");
        user.setPassword("123");
        String email = user.getEmail();

        // ... token
        String token = UUID.randomUUID().toString();
        ConfirmationToken confirmationToken = new ConfirmationToken(token, LocalDateTime.now(), LocalDateTime.now().plusMinutes(15), user);

        // ... encodedPassword
        String encodedPassword = bCryptPasswordEncoder.encode(user.getPassword());


        // ... no user with Email
        given(appUserRepository.findByEmail(email)).willReturn(Optional.empty());
        user.setPassword(encodedPassword);

        //When
        underTest.signUpUser(user);
        //Then
        then(appUserRepository).should().save(userArgumentCaptor.capture());
        then(confirmationTokenService).should().saveConfirmationToken(tokenArgumentCaptor.capture());

        AppUser userArgumentCaptorValue = userArgumentCaptor.getValue();
        ConfirmationToken tokenArgumentCaptorValue = tokenArgumentCaptor.getValue();

        assertThat(userArgumentCaptorValue).usingRecursiveComparison().isEqualTo(user);
        assertThat(tokenArgumentCaptorValue.getAppUser()).isEqualTo(confirmationToken.getAppUser());

    }

    @Test
    void itShouldNotSignUpNeWUserWhenEmailAlreadyTaken() {
        //Given
        // ... user
        AppUser user = new AppUser();
        user.setEmail("email@gmail.com");
        user.setId(1L);
        user.setFirstName("John");
        user.setLastName("Smith");
        user.setPassword("123");
        String email = user.getEmail();

        // ... user with Email exists
        given(appUserRepository.findByEmail(email)).willReturn(Optional.of(user));

        //When
        //Then
        assertThatThrownBy(()-> underTest.signUpUser(user))
                .isInstanceOf(IllegalStateException.class)
                .hasMessageContaining("email already taken");

        //Finally
        then(appUserRepository).should(never()).save(any());
    }
}