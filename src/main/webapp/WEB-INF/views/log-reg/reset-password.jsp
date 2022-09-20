<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../header.jsp"/>
<section class="login-page">
    <h2><spring:message code="text.resetPassword"/></h2>
    <%--@elvariable id="request" type="pl.coderslab.charity.registration.RegistrationRequest"--%>
    <form:form modelAttribute="request" commandName="request">
        <form:input type="hidden" path="firstName"/>
        <form:input type="hidden" path="lastName"/>
        <form:input type="hidden" path="email"/>
        <div class="form-group">
            <spring:message code="text.password" var="placeholderPassword"/>
            <form:input type="password" path="password" placeholder='${placeholderPassword}'/>
            <span class="text-error">
                       <form:errors path="password"/>
                    </span>
        </div>
        <div class="form-group">
            <spring:message code="text.repeatPassword" var="placeholderMatchingPassword"/>
            <form:input type="password" path="matchingPassword" placeholder='${placeholderMatchingPassword}'/>
            <span class="text-error">
                       <form:errors/>
                    </span>
        </div>
        <div class="form-group form-group--buttons">
            <button class="btn" type="submit"><spring:message code="text.reset"/></button>
        </div>
    </form:form>
</section>
<jsp:include page="../footer.jsp"/>