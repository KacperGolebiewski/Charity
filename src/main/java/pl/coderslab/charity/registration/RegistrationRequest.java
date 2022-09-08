package pl.coderslab.charity.registration;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Getter
@Setter
@AllArgsConstructor
@EqualsAndHashCode
@ToString
@NoArgsConstructor
public class RegistrationRequest {

    @NotBlank
    private String firstName;
    @NotBlank
    private String lastName;
    @Column(nullable = false, unique = true, length = 60)
    @NotBlank
    @Email
    private String email;
    @NotBlank
    private String password;
}

