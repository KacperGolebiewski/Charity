<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../header.jsp"/>
<section id="institutions" class="help">
    <h2><spring:message code="text.myProfile"/></h2>
    <%--    <div class="help--slides active" data-id="1">--%>
    <ul class="help--slides-items">
        <li>
            <div>
                <h1 class="title"><spring:message code="text.firstName"/>: ${user.firstName}</h1>
                <h1 class="subtitle"><spring:message code="text.lastName"/>: ${user.lastName}</h1>
                <h1 class="subtitle"><spring:message code="text.email"/>: ${user.email}</h1>
                <a href="<c:url value="/user/details/edit"/>" type="button" class="btn next-step"><spring:message
                        code="text.edit"/></a>
            </div>
        </li>
    </ul>
</section>
<jsp:include page="../footer.jsp"/>