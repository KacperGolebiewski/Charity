package pl.coderslab.charity.institution;

import org.springframework.data.domain.Page;

public interface InstitutionService {

    Page<Institution> findAllPaginated(int pageNo, int pageSize);
}
