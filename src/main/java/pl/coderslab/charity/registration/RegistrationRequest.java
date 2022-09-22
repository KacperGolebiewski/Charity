package pl.coderslab.charity.registration;

import lombok.*;
import pl.coderslab.charity.validation.PasswordMatches;
import pl.coderslab.charity.validation.ValidEmail;

import javax.persistence.Column;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@AllArgsConstructor
@EqualsAndHashCode
@ToString
@NoArgsConstructor
@PasswordMatches
public class RegistrationRequest {

    @NotNull
    @NotEmpty
    private String firstName;

    @NotNull
    @NotEmpty
    private String lastName;

    @Column(nullable = false, unique = true, length = 60)
    @NotNull
    @NotEmpty
    @ValidEmail
    private String email;

    @NotNull
    @NotEmpty
    private String password;

    private String matchingPassword;

}

