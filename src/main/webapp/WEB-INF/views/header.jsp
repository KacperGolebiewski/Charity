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
<%--<header class="header--main-page">--%>
<%--    <nav class="container container--70">--%>
<%--        <ul class="nav--actions">--%>

<%--        </ul>--%>

<%--        <ul>--%>
<%--            <li><a href="<c:url value="${pageContext.request.contextPath}/"/>" class="btn btn--without-border active">Start</a></li>--%>
<%--            <li><a href="#how-it-works" class="btn btn--without-border">O co chodzi?</a></li>--%>
<%--            <li><a href="#about-us" class="btn btn--without-border">O nas</a></li>--%>
<%--            <li><a href="#institutions" class="btn btn--without-border">Fundacje i organizacje</a></li>--%>
<%--            <li><a href="#contact" class="btn btn--without-border">Kontakt</a></li>--%>
<%--        </ul>--%>
<%--    </nav>--%>

<%--    <div class="slogan container container--90">--%>
<%--        <div class="slogan--item">--%>
<%--            <h1>--%>
<%--                Zacznij pomagać!<br/>--%>
<%--                Oddaj niechciane rzeczy w zaufane ręce--%>
<%--            </h1>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</header>--%>

<sec:authorize access="!isAuthenticated()">
<header class="header--main-page">
</sec:authorize>
<sec:authorize access="isAuthenticated()">
<header class="header--form-page">
    </sec:authorize>
    <nav class="container container--70">
        <ul class="nav--actions">
            <sec:authorize access="!isAuthenticated()">
                <li><a href="<c:url value="${pageContext.request.contextPath}/login"/>" class="btn btn--small btn--without-border">Zaloguj</a></li>
                <li><a href="<c:url value="${pageContext.request.contextPath}/register"/>" class="btn btn--small btn--highlighted">Załóż konto</a></li>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
            <li class="logged-user">
                Witaj
                <sec:authentication property="principal.firstName"/>
                <ul class="dropdown">
                    <li><a href="#">Profil</a></li>
                    <li><a href="#">Moje zbiórki</a></li>
                    <li><a href="#">Wyloguj</a></li>
                </ul>
            </li>
            </sec:authorize>
        </ul>





        <ul>

                        <sec:authorize access="!isAuthenticated()">
                        <li><a href="<c:url value="${pageContext.request.contextPath}/"/>" class="btn btn--without-border active">Start</a></li>
                        </sec:authorize>
                        <li><a href="<c:url value="${pageContext.request.contextPath}/#how-it-works"/>" class="btn btn--without-border">O co chodzi?</a></li>
                        <li><a href="<c:url value="${pageContext.request.contextPath}/#about-us" />" class="btn btn--without-border">O nas</a></li>
                        <li><a href="<c:url value="${pageContext.request.contextPath}/#institutions"/>" class="btn btn--without-border">Fundacje i organizacje</a></li>
                        <sec:authorize access="isAuthenticated()">

                            <li><a href="<c:url value="${pageContext.request.contextPath}/donation"/>" class="btn btn--without-border active ">Przekaż dary</a></li>

                        </sec:authorize>
                        <li><a href="<c:url value="${pageContext.request.contextPath}/#contact"/>" class="btn btn--without-border">Kontakt</a></li>
<%--            <c:if test="${requestScope['javax.servlet.forward.request_uri']=='/donation'}">--%>
<%--            </c:if>--%>
<%--            zrobic z tego choose i otherwise --%>


        </ul>
    </nav>
        <sec:authorize access="!isAuthenticated()">
        <div class="slogan container container--90">
            <div class="slogan--item">
                <h1>
                    Zacznij pomagać!<br/>
                    Oddaj niechciane rzeczy w zaufane ręce
                </h1>
            </div>
        </div>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <c:if test="${requestScope['javax.servlet.forward.request_uri']=='/'}">
        <div class="slogan container container--90">
            <div class="slogan--item">
                <h1>
                    Oddaj rzeczy, których już nie chcesz<br />
                    <span class="uppercase">potrzebującym</span>
                </h1>

                <div class="slogan--steps">
                    <div class="slogan--steps-title">Wystarczą 4 proste kroki:</div>
                    <ul class="slogan--steps-boxes">
                        <li>
                            <div><em>1</em><span>Wybierz rzeczy</span></div>
                        </li>
                        <li>
                            <div><em>2</em><span>Spakuj je w worki</span></div>
                        </li>
                        <li>
                            <div><em>3</em><span>Wybierz fundację</span></div>
                        </li>
                        <li>
                            <div><em>4</em><span>Zamów kuriera</span></div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
            </c:if>
        </sec:authorize>
</header>

