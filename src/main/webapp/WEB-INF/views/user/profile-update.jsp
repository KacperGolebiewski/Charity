<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../header.jsp"/>
<section class="login-page">
    <h2>Mój Profil:</h2>
    <%--@elvariable id="appUser" type="pl.coderslab.charity.user.AppUser"--%>
    <form:form modelAttribute="appUser" method="post" action="/user/details/edit">
        <div class="form-group">
            <form:input type="text" path="firstName" placeholder="first name"/>
        </div>
        <div class="form-group">
            <form:input type="text" path="lastName" placeholder="last name"/>
        </div>
        <div class="form-group">
            <form:input type="password" path="password" placeholder="password"/>
        </div>
        <div class="form-group">
            <input type="password" name="repeat-password" placeholder="repeat password"/>
        </div>
        <div class="form-group form-group--buttons">
            <button class="btn" type="submit">Wyślij</button>
        </div>
    </form:form>
</section>
<jsp:include page="../footer.jsp"/>