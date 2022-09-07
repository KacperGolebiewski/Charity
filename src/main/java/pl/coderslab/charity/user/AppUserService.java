package pl.coderslab.charity.user;

import org.springframework.data.domain.Page;

public interface AppUserService {


    Page<AppUser> findUsersPaginated(int pageNo, int pageSize, String sortField, String sortDirection);

    Page<AppUser> findAdminsPaginated(int pageNo, int pageSize);
}
