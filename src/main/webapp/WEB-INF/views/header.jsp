<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>

    <link rel="stylesheet" href="<c:url value="${pageContext.request.contextPath}/resources/css/style.css"/>"/>
</head>
<body>
<header class="header--main-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li><a href="<c:url value="${pageContext.request.contextPath}/login"/>" class="btn btn--small btn--without-border">Zaloguj</a></li>
            <li><a href="<c:url value="${pageContext.request.contextPath}/register"/>" class="btn btn--small btn--highlighted">Załóż konto</a></li>
        </ul>

        <ul>
            <li><a href="<c:url value="${pageContext.request.contextPath}/"/>" class="btn btn--without-border active">Start</a></li>
            <li><a href="#how-it-works" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="#about-us" class="btn btn--without-border">O nas</a></li>
            <li><a href="#institutions" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="#contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>

    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                Zacznij pomagać!<br/>
                Oddaj niechciane rzeczy w zaufane ręce
            </h1>
        </div>
    </div>
</header>

<sec:authorize access="isAuthenticated()">
<header class="header--form-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li class="logged-user">
                Witaj
                <sec:authentication property="principal.firstName"/>
                <ul class="dropdown">
                    <li><a href="#">Profil</a></li>
                    <li><a href="#">Moje zbiórki</a></li>
                    <li><a href="#">Wyloguj</a></li>
                </ul>
            </li>
        </ul>

        <ul>
            <li><a href="<c:url value="${pageContext.request.contextPath}/"/>" class="btn btn--without-border active">Start</a></li>
            <li><a href="<c:url value="${pageContext.request.contextPath}/#how-it-works"/>" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="<c:url value="${pageContext.request.contextPath}/#about-us" />" class="btn btn--without-border">O nas</a></li>
            <li><a href="<c:url value="${pageContext.request.contextPath}/#institutions"/>" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="<c:url value="${pageContext.request.contextPath}/donation"/>" class="btn btn--without-border">Przekaż dary</a></li>
            <li><a href="<c:url value="${pageContext.request.contextPath}/#contact"/>" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>
</sec:authorize>

