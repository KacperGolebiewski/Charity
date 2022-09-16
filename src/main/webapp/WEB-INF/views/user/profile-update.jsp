<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../header.jsp"/>
<section class="login-page">
    <h2><spring:message code="text.myProfile"/>:</h2>
    <%--@elvariable id="appUser" type="pl.coderslab.charity.user.AppUser"--%>
    <form:form modelAttribute="appUser" method="post" action="/user/details/edit">
        <div class="form-group">
            <spring:message code="text.firstName" var="placeholderName" />
            <form:input type="text" path="firstName" placeholder='${placeholderName}'/>
            <span class="text-error">
                       <form:errors path="firstName"/>
                    </span>
        </div>
        <div class="form-group">
            <spring:message code="text.lastName" var="placeholderlastName" />
            <form:input type="text" path="lastName" placeholder='${placeholderlastName}'/>
            <span class="text-error">
                       <form:errors path="lastName"/>
                    </span>
        </div>
        <div class="form-group">
            <spring:message code="text.password" var="placeholderPassword" />
            <form:input type="password" path="password" placeholder='${placeholderPassword}'/>
            <span class="text-error">
                       <form:errors path="password"/>
                    </span>
        </div>
        <div class="form-group">
            <spring:message code="text.repeatPassword" var="placeholderRepeatPassword" />
            <input type="password" name="repeat-password" placeholder='${placeholderRepeatPassword}'/>
        </div>
        <div class="form-group form-group--buttons">
            <button class="btn" type="submit"><spring:message code="text.send"/></button>
        </div>
    </form:form>
</section>
<jsp:include page="../footer.jsp"/>