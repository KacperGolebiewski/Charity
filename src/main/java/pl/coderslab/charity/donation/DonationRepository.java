package pl.coderslab.charity.donation;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface DonationRepository extends JpaRepository<Donation, Long> {


    @Query(nativeQuery = true, value = "select sum(quantity) from donation")
    Integer findTotalQuantity();

    @Query(nativeQuery = true, value = "select count(*) from donation;")
    Integer findTotalDonations();

    @Query(nativeQuery = true, value = "select d.id from donation d join donation_categories dc where dc.categories_id =?;")
    List<Object> findDonationByCategoryId(long id);

    Optional<Donation> findDonationByInstitutionId(Long id);

    @Query("select d from Donation d where d.user.id =?1")
    Page<Donation> findAllByUserId(Long id, Pageable pageable);

    Donation findByUserId(Long id);


}
