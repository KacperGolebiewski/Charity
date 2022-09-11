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
                <span><strong>Zarządzaj Kategoriami</strong></span>
                <span><a style="font-size: 1.5rem;!important;" class="btn btn-outline-success px-3 py-2" href="<c:url value="/admin/categories/add"/>"
                         role="button"><i class="fa fa-plus px-2"></i>Dodaj</a></span>
            </div>
            <div class="card-body">
                <div class="tab-content rounded-bottom">
                    <div class="tab-pane p-3 active preview" role="tabpanel" id="preview-1055">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th scope="col">Nazwa</th>
                                <th scope="col">Aktywny</th>
                                <th scope="col">
                                    <div align="middle">
                                        <span>Akcje</span>
                                    </div>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${categories}" var="category">
                                <tr>
                                    <td>${category.name}</td>
                                    <td>${category.active}</td>
                                    <td align="right">
                                        <a style="font-size: 1.5rem;!important;"
                                           class="btn btn-link text-danger text-gradient px-3 mb-0 py-2"
                                           href="<c:url value="/admin/categories/confirm-delete/${category.id}"/>"><i
                                                class="align-middle fa fa-trash px-2 text-sm me-2"></i>Usuń</a>
                                        <a style="font-size: 1.5rem;!important;"
                                           class="btn btn-link text-dark px-3 mb-0 py-2"
                                           href="<c:url value="/admin/categories/edit/${category.id}"/>"><i
                                                class="align-middle fa fa-edit px-2 text-sm me-2"></i>Edytuj</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../footer-admin.jsp"/>
