<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../header.jsp"/>
<section class="login-page">
    <h2>Załóż konto</h2>
    <%--@elvariable id="request" type="pl.coderslab.charity.registration.RegistrationRequest"--%>
    <form:form modelAttribute="request">
        <div class="form-group">
            <form:input type="text" path="firstName" placeholder="first name"/>
        </div>
        <div class="form-group">
            <form:input type="text" path="lastName" placeholder="last name"/>
        </div>
        <div class="form-group">
            <form:input type="email" path="email" placeholder="email"/>
        </div>
        <div class="form-group">
            <form:input type="password" path="password" placeholder="password"/>
        </div>
        <div class="form-group form-group--buttons">
            <a href="<c:url value="${pageContext.request.contextPath}/login"/>" class="btn btn--without-border">Zaloguj
                się</a>
            <button class="btn" type="submit">Załóż konto</button>
        </div>
    </form:form>
</section>
<jsp:include page="../footer.jsp"/>