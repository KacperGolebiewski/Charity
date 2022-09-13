<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../header-admin.jsp"/>
<div class="body flex-grow-1 px-3 py-5" style="font-size: 1.5rem;!important;">
    <div class="container py-5">
        <div class="card mb-4">
            <div class="card-body">
                <div class="tab-content rounded-bottom">
                    <div class="tab-pane p-3 active preview" role="tabpanel" id="preview-1055">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th scope="col">Imię</th>
                                <th scope="col">Nazwisko</th>
                                <th scope="col">Email</th>
                                <th scope="col">
                                    <a href="<c:url value="${pageContext.request.contextPath}/admin/messages/${currentPage}?sortField=created&sortDir=${reverseSortDir}"/>"><i
                                            class="fa fa-fw fa-sort"></i></a>
                                    <span>Data</span>
                                </th>
                                <th scope="col">Wiadomość</th>
                                <th scope="col">
                                    <div align="middle">
                                        <span>Akcje</span>
                                    </div>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${messages}" var="message">
                                <tr>
                                    <td>${message.firstName}</td>
                                    <td>${message.lastName}</td>
                                    <td>${message.email}</td>
                                    <td>${message.created}</td>
                                    <td>${message.message}</td>
                                    <td align="right">
                                        <a style="font-size: 1.5rem;!important;"
                                           class="btn btn-link text-danger text-gradient px-3 mb-0 py-2"
                                           href="<c:url value="/admin/messages/confirm-delete/${message.id}"/>"><i
                                                class="align-middle fa fa-trash px-2 text-sm me-2"></i>Usuń</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${totalPages != 1}">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <c:choose>
                        <c:when test="${currentPage > 1}">
                            <li class="page-item">
                                <a class="page-link"
                                   href="<c:url value="${pageContext.request.contextPath}/admin/messages/${currentPage-1}?sortField=${sortField}&sortDir=${sortDir}"/>">Previous</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item disabled">
                                <a class="page-link">Previous</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach begin="1" end="${totalPages}" varStatus="status">
                        <c:choose>
                            <c:when test="${currentPage != status.index}">
                                <li class="page-item"><a class="page-link"
                                                         href="<c:url value="${pageContext.request.contextPath}/admin/messages/${status.index}?sortField=${sortField}&sortDir=${sortDir}"/>">${status.index}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item disabled"><a class="page-link">${status.index}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${currentPage < totalPages}">
                            <li class="page-item">
                                <a class="page-link"
                                   href="<c:url value="${pageContext.request.contextPath}/admin/messages/${currentPage+1}?sortField=${sortField}&sortDir=${sortDir}"/>">Next</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item disabled">
                                <a class="page-link">Next</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </nav>
        </c:if>
    </div>
</div>
<jsp:include page="../footer-admin.jsp"/>
