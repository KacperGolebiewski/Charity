package pl.coderslab.charity.message;

import org.springframework.data.domain.Page;

public interface MessageService {

    Page<Message> findAllPaginated(int pageNo, int pageSize, String sortField, String sortDirection);


}
