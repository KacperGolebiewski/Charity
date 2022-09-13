package pl.coderslab.charity.donation;

import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import pl.coderslab.charity.user.AppUser;
import pl.coderslab.charity.user.AppUserRepository;

@Service
@AllArgsConstructor
public class DonationServiceImpl implements DonationService {

    private final DonationRepository donationRepository;
    private final AppUserRepository appUserRepository;


    @Override
    public Page<Donation> findDonationsPaginated(int pageNo, int pageSize, String sortField, String sortDirection) {
        Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by(sortField).ascending() : Sort.by(sortField).descending();
        Pageable pageable = PageRequest.of(pageNo - 1, pageSize, sort);
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        AppUser user = appUserRepository.findByEmail(auth.getName()).orElse(null);
        return this.donationRepository.findAllByUserId(user.getId(), pageable);
    }


}
