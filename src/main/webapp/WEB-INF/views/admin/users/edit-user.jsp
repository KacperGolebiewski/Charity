<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../header-admin.jsp"/>
<div class="body flex-grow-1 px-3 py-5" style="font-size: 1.5rem;!important;">
    <div class="container-custom py-5">
        <div class="card mb-4">
            <div class="card-header px-4 py-3 custom-display">
                <span><strong><spring:message code="text.editUser"/></strong></span>
            </div>
            <div class="card-body">
                <form:form modelAttribute="user">
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
                <div class="form-group form-group--checkbox">
                    <div class="title"><spring:message code="text.enabled"/></div>
                    <label>
                        <form:checkbox path="enabled" cssClass="checkbox" value="${user.enabled}" id="enabled"/><span
                            class="description"></span>
                    </label>
                </div>
                <div class="form-group form-group--checkbox">
                    <div class="title"><spring:message code="text.blocked"/></div>
                    <label>
                        <form:checkbox path="locked" cssClass="checkbox" value="${user.locked}" id="locked"/><span
                            class="description"></span>
                    </label>
                </div>
                <div class="form-group ">
                    <div class="form-group form-group--buttons">
                        <button style="font-size: 1.5rem;!important;"
                                class="btn btn-link text-dark px-3 mb-0 py-2" type="submit"><spring:message code="text.save"/>
                        </button>
                    </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="../footer-admin.jsp"/>