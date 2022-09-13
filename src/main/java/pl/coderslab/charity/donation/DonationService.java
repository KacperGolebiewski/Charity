package pl.coderslab.charity.donation;

import org.springframework.data.domain.Page;

public interface DonationService {

    Page<Donation> findDonationsPaginated(int pageNo, int pageSize, String sortField, String sortDirection);
}
