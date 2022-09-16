<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../header.jsp"/>
<section class="login-page">
    <h2><spring:message code="text.signUp"/></h2>
    <%--@elvariable id="request" type="pl.coderslab.charity.registration.RegistrationRequest"--%>
    <form:form modelAttribute="request">
        <div class="form-group">
            <spring:message code="text.firstName" var="placeholderName" />
            <form:input type="text" path="firstName" placeholder='${placeholderName}'/>
            <span class="text-error">
                       <form:errors path="firstName"/>
                    </span>
        </div>
        <div class="form-group">
            <spring:message code="text.lastName" var="placeholderLastName" />
            <form:input type="text" path="lastName" placeholder='${placeholderLastName}'/>
            <span class="text-error">
                       <form:errors path="firstName"/>
                    </span>
        </div>
        <div class="form-group">
            <spring:message code="text.email" var="placeholderEmail" />
            <form:input type="email" path="email" placeholder='${placeholderEmail}'/>
            <span class="text-error">
                       <form:errors path="email"/>
                    </span>
        </div>
        <div class="form-group">
            <spring:message code="text.password" var="placeholderPassword" />
            <form:input type="password" path="password" placeholder='${placeholderPassword}'/>
            <span class="text-error">
                       <form:errors path="password"/>
                    </span>
        </div>
        <div class="form-group form-group--buttons">
            <a href="<c:url value="/login"/>" class="btn btn--without-border"><spring:message code="text.login"/></a>
            <button class="btn" type="submit"><spring:message code="text.signUp"/></button>
        </div>
    </form:form>
</section>
<jsp:include page="../footer.jsp"/>