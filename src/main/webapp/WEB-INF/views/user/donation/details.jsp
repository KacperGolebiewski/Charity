<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header-donation.jsp"/>
<div class="body flex-grow-1 px-3 py-5" style="font-size: 1.5rem;!important;">
    <div class="container py-5">
        <div class="card mb-4">
            <div class="card-header px-4 py-3 custom-display">
                <span><strong><spring:message code="text.myDonations"/></strong></span>
            </div>
            <div class="card-body">
                <div class="tab-content rounded-bottom">
                    <div class="tab-pane p-3 active preview" role="tabpanel" id="preview-1055">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th scope="col"><spring:message code="text.fullName"/></th>
                                <th scope="col"><spring:message code="text.institutionName"/></th>
                                <th scope="col"><spring:message code="text.donationType"/></th>
                                <th scope="col"><spring:message code="text.quantity"/></th>
                                <th scope="col">
                                    <a href="<c:url value="/donation/details/${currentPage}?sortField=isDelivered&sortDir=${reverseSortDir}"/>"><i
                                            class="fa fa-fw fa-sort"></i></a>
                                    <span><spring:message code="text.status"/></span></th>
                                <th scope="col">
                                    <a href="<c:url value="/donation/details/${currentPage}?sortField=created&sortDir=${reverseSortDir}"/>"><i
                                            class="fa fa-fw fa-sort"></i></a>
                                    <span><spring:message code="text.creationDate"/></span></th>
                                <th scope="col">
                                    <a href="<c:url value="/donation/details/${currentPage}?sortField=updated&sortDir=${reverseSortDir}"/>"><i
                                            class="fa fa-fw fa-sort"></i></a>
                                    <span><spring:message code="text.deliveryDate"/></span></th>
                                <th scope="col">
                                    <div align="middle">
                                        <span><spring:message code="text.actions"/></span>
                                    </div>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${donations}" var="donation">
                                <tr>
                                    <td>${donation.user.firstName} ${donation.user.lastName}</td>
                                    <td>"${donation.institution.name}"</td>
                                    <td>
                                        <c:forEach items="${donation.categories}" var="category">
                                            ${category.name}<br>
                                        </c:forEach>
                                    </td>
                                    <td>${donation.quantity}</td>
                                    <c:choose>
                                        <c:when test="${donation.delivered == true}">
                                            <td><spring:message code="text.delivered"/></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td><spring:message code="text.pending"/></td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td>${donation.created.toString().substring(0,10)}</td>
                                    <td>
                                        <c:if test="${donation.delivered == true}">
                                            ${donation.updated.toString().substring(0,10)}
                                            ${donation.updated.toString().substring(11,16)}
                                        </c:if>
                                    </td>
                                    <td align="right">
                                        <a style="font-size: 1.5rem;!important;"
                                           class="btn btn-link text-dark px-3 mb-0 py-2"
                                           href="<c:url value="/donation/details/edit/${donation.id}"/>"><i
                                                class="align-middle fa fa-edit px-2 text-sm me-2"></i><spring:message code="text.edit"/></a>
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
                                   href="<c:url value="/donation/details/${currentPage-1}?sortField=${sortField}&sortDir=${sortDir}"/>"><spring:message code="text.previous"/></a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item disabled">
                                <a class="page-link"><spring:message code="text.previous"/></a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                    <c:forEach begin="1" end="${totalPages}" varStatus="status">
                        <c:choose>
                            <c:when test="${currentPage != status.index}">
                                <li class="page-item"><a class="page-link"
                                                         href="<c:url value="/donation/details/${status.index}?sortField=${sortField}&sortDir=${sortDir}"/>">${status.index}</a>
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
                                   href="<c:url value="/donation/details/${currentPage+1}?sortField=${sortField}&sortDir=${sortDir}"/>"><spring:message code="text.next"/></a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item disabled">
                                <a class="page-link"><spring:message code="text.next"/></a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </nav>
        </c:if>
    </div>
</div>
<jsp:include page="../../footer.jsp"/>