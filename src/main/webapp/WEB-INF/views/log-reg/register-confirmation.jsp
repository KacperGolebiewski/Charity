<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../header.jsp"/>
<div class="slogan container container--90">
    <h2>
        <spring:message code="text.registrationConfirmation"/>
        <div class="form-group form-group--buttons">
            <a href="<c:url value="/login"/>" class="btn btn--without-border"><spring:message code="text.login"/></a>
        </div>
    </h2>
</div>
<jsp:include page="../footer.jsp"/>