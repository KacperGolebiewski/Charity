<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../header-admin.jsp"/>
<div class="body flex-grow-1 px-3 py-5" style="font-size: 1.5rem;!important;">
  <div class="container-custom py-5">
    <div class="card mb-4">
      <div class="card-header px-4 py-3 custom-display">
        <span><strong>Czy na pewno chcesz usunąć?</strong></span>
      </div>
      <div class="card-body">
        <a style="font-size: 1.5rem;!important;"
           class="btn btn-link text-danger text-gradient px-3 mb-0 py-2"
           href="<c:url value="/admin/dashboard/delete/${id}"/>"><i
                class="align-middle fa fa-trash px-2 text-sm me-2"></i>Usuń</a>
        <a style="font-size: 1.5rem;!important;"
           class="btn btn-link text-dark px-3 mb-0 py-2"
           href="<c:url value="/admin/dashboard"/>"><i
                class="align-middle fa fa-arrow-alt-circle-left px-2 text-sm me-2"></i>Powrót</a>
      </div>
    </div>
  </div>
</div>
<jsp:include page="../footer-admin.jsp"/>