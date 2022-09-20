package pl.coderslab.charity;

import com.github.javafaker.Faker;
import lombok.AllArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import pl.coderslab.charity.category.CategoryRepository;
import pl.coderslab.charity.donation.Donation;
import pl.coderslab.charity.donation.DonationRepository;
import pl.coderslab.charity.institution.InstitutionRepository;
import pl.coderslab.charity.message.Message;
import pl.coderslab.charity.message.MessageRepository;
import pl.coderslab.charity.user.AppUser;
import pl.coderslab.charity.user.AppUserRepository;
import pl.coderslab.charity.user.AppUserRole;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.Month;
import java.util.List;
import java.util.stream.IntStream;

@Component
@AllArgsConstructor
public class SampleDataLoader implements CommandLineRunner {

    private final AppUserRepository appUserRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;
    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final MessageRepository messageRepository;

    private final Faker faker;


    @Override
    public void run(String... args) throws Exception {
        List<AppUser> people = IntStream.rangeClosed(1, 100)
                .mapToObj(i -> new AppUser(
                        faker.name().firstName(),
                        faker.name().lastName(),
                        faker.internet().emailAddress(),
                        bCryptPasswordEncoder.encode(faker.bothify("????##")),
                        AppUserRole.ROLE_USER
                )).toList();
        List<Donation> donations = IntStream.rangeClosed(1, 10)
                .mapToObj(i -> new Donation(
                        faker.random().nextInt(1, 10),
                        categoryRepository.findAll(),
                        institutionRepository.findById(1L).get(),
                        faker.address().streetAddress(),
                        faker.address().cityName(),
                        faker.address().zipCode(),
                        faker.phoneNumber().toString(),
                        LocalDate.of(LocalDate.now().getYear() + 1, Month.SEPTEMBER, 21),
                        LocalTime.now(),
                        faker.lorem().sentence(10),
                        appUserRepository.findById(1L).get(),
                        false,
                        LocalDateTime.now()
                )).toList();
        List<Message> messages = IntStream.rangeClosed(1, 100)
                .mapToObj(i -> new Message(
                        faker.name().firstName(),
                        faker.name().lastName(),
                        faker.internet().emailAddress(),
                        faker.lorem().paragraph(2),
                        LocalDateTime.now()

                )).toList();
//        messageRepository.saveAll(messages);
//        appUserRepository.saveAll(people);
//        donationRepository.saveAll(donations);
    }

}

