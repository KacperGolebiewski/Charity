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
                <span><strong><spring:message code="text.editCategory"/></strong></span>
            </div>
            <div class="card-body">
                <form:form modelAttribute="category">
                    <div class="form-group">
                        <spring:message code="text.name" var="placeholderName"/>
                        <form:input type="text" path="name" placeholder='${placeholderName}'/>
                        <span class="text-error">
                       <form:errors path="name"/>
                    </span>
                    </div>
                    <div class="form-group ">
                        <span class="description">
                  <div class="title"><spring:message code="text.active"/>:</div>
                </span>

                        <form:checkbox path="active"/>
                        <span class="text-error">
                       <form:errors path="active"/>
                    </span>
                    </div>

                    <div class="form-group form-group--buttons">
                        <button style="font-size: 1.5rem;!important;"
                                class="btn btn-link text-dark px-3 mb-0 py-2" type="submit"><spring:message
                                code="text.save"/>
                        </button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../footer-admin.jsp"/>