<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title><spring:message code="app.name"/></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href=
            "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.9.0/css/all.css">
</head>
<body>
<header>
    <nav class="container container--70">
        <ul class="nav--actions">
            <sec:authorize access="isAuthenticated()">
                <li class="logged-user">
                    <spring:message code="hello.message"/>
                    <sec:authentication property="principal.firstName"/>
                    <ul class="dropdown">
                        <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
                            <li>
                                <a href="<c:url value="/admin/dashboard"/>"><spring:message code="text.admin"/></a>
                            </li>
                        </sec:authorize>
                        <li>
                            <a href="<c:url value="/user/details"/>"><spring:message code="text.profile"/></a>
                        </li>
                        <li><a href="<c:url value="/donation/details"/>"><spring:message code="text.myDonations"/></a></li>
                        <li>
                            <form action="<c:url value="/logout"/>" method="post">
                                <spring:message code="text.signOut" var="signOut"/>
                                <input class="logout" type="submit" value='${signOut}'/>
                                <input type="hidden" name="${_csrf.parameterName}"
                                       value="${_csrf.token}"/>
                            </form>
                        </li>
                    </ul>
                </li>
            </sec:authorize>
        </ul>
        <ul>
            <sec:authorize access="isAuthenticated()">
                <li><a href="<c:url value="/donation"/>"
                       class="btn btn--without-border active"><spring:message code="text.start"/></a></li>
            </sec:authorize>
            <sec:authorize access="!isAuthenticated()">
                <li><a href="<c:url value="/"/>"
                       class="btn btn--without-border active"><spring:message code="text.start"/></a></li>
            </sec:authorize>
            <li><a href="<c:url value="/#how-it-works"/>"
                   class="btn btn--without-border"><spring:message code="text.howDoesItWork"/></a></li>
            <li><a href="<c:url value="/#about-us" />"
                   class="btn btn--without-border">O nas</a></li>
            <sec:authorize access="!isAuthenticated()">
                <li><a href="<c:url value="/donation"/>"
                       class="btn btn--without-border"><spring:message code="text.donateIt"/></a></li>
            </sec:authorize>
            <li><a href="<c:url value="/#institutions"/>"
                   class="btn btn--without-border"><spring:message code="text.institutions"/></a></li>
            <li><a href="<c:url value="/#contact"/>"
                   class="btn btn--without-border"><spring:message code="text.Contact"/></a></li>
        </ul>

    </nav>
</header>

