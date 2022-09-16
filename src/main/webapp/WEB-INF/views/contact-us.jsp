<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../views/header.jsp"/>
<div class="contact">
    <h2><spring:message code="text.contactUsForm"/></h2>
    <div class="body flex-grow-1 px-3 py-5" style="font-size: 1.5rem;!important;">
        <div class="container py-5">
            <div class="card mb-4">
                <div class="card-body">
                    <form:form class="form--contact" modelAttribute="message">
                        <form:hidden path="id"/>
                        <div class=" form-group form-group--50">
                            <spring:message code="text.firstName" var="placeholderName" />
                            <form:input type="text" placeholder='${placeholderName}' path="firstName"/>
                            <span class="text-error">
                       <form:errors path="firstName"/>
                    </span>
                        </div>
                        <div class="form-group form-group--50">
                            <spring:message code="text.lastName" var="placeholderlastName" />
                            <form:input type="text" placeholder='${placeholderlastName}' path="lastName"/>
                            <span class="text-error">
                       <form:errors path="lastName"/>
                    </span>
                        </div>
                        <div class="form-group">
                            <spring:message code="text.email" var="placeholderemail" />
                            <form:input type="text" placeholder='${placeholderemail}' path="email"/>
                            <span class="text-error">
                       <form:errors path="email"/>
                    </span>
                        </div>

                        <div class="form-group">
                            <spring:message code="text.message" var="placeholderMessage" />
                            <form:textarea type="text" placeholder='${placeholderMessage}' path="messageField"/>
                            <span class="text-error">
                       <form:errors path="messageField"/>
                    </span>
                        </div>

                        <button class="btn" type="submit"><spring:message code="text.send"/></button>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../views/footer.jsp"/>