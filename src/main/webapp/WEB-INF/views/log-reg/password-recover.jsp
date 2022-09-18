<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../header.jsp"/>
<section class="login-page">
    <h2><spring:message code="text.recoverPassword"/>:</h2>
    <form  method="post" action="/forgot-password">
        <div class="form-group">
            <spring:message code="text.password" var="placeholderPassword" />
            <label>
                <input type="email" name="email" placeholder='${placeholderPassword}'/>
            </label>
        </div>
        <div class="form-group form-group--buttons">
            <button class="btn" type="submit"><spring:message code="text.send"/></button>
        </div>
    </form>
</section>
<jsp:include page="../footer.jsp"/>