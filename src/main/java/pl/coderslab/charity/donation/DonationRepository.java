package pl.coderslab.charity.donation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.persistence.NamedNativeQueries;
import java.util.List;

@Repository
public interface DonationRepository extends JpaRepository<Donation, Long> {


    @Query(nativeQuery = true, value="select sum(quantity) from donation")
    Integer findTotalQuantity();

    @Query(nativeQuery = true, value="select count(*) from donation;")
    Integer findTotalDonations();


}
