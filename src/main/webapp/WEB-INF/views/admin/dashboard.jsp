<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="header-admin.jsp"/>
<div class="body flex-grow-1 px-3 py-5" style="font-size: 2rem">
    <div class="container py-5">
        <div class="card mb-4">
                    <div class="card-header px-4 py-3 custom-display">
                        <span><strong>Zarządzaj Adminami</strong></span>
                        <span><a class="btn btn-outline-success px-3 py-2" href="#" role="button"><i class="fa fa-plus px-2"></i>Dodaj</a></span>
                    </div>
            <div class="card-body">
                    <div class="tab-content rounded-bottom">
                        <div class="tab-pane p-3 active preview" role="tabpanel" id="preview-1055">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Imię</th>
                                    <th scope="col">Nazwisko</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Zablokowany</th>
                                    <th scope="col">Aktywny</th>
                                    <th scope="col">
                                        <div align="middle">
                                            <span >Akcje</span>
                                        </div>
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${admins}" var="admin">
                                    <tr>
                                        <th scope="row">${admin.id}</th>
                                        <td>${admin.firstName}</td>
                                        <td>${admin.lastName}</td>
                                        <td>${admin.email}</td>
                                        <td>${admin.locked}</td>
                                        <td>${admin.enabled}</td>
                                        <td align="right">
                                            <a class="btn btn-link text-danger text-gradient px-3 mb-0 py-2" href="<c:url value="${pageContext.request.contextPath}/admin/dashboard/delete/${admin.id}"/>"><i class="align-middle fa fa-trash px-2 text-sm me-2"></i>Usuń</a>
                                            <a class="btn btn-link text-dark px-3 mb-0 py-2" href="<c:url value="${pageContext.request.contextPath}/admin/dashboard/edit/${admin.id}"/>"><i class="align-middle fa fa-edit px-2 text-sm me-2"></i>Edytuj</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link">Previous</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                </li>
            </ul>
        </nav>
        </div>


<jsp:include page="footer-admin.jsp"/>