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
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="${pageContext.request.contextPath}/resources/css/style.css"/>"/>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
</head>
<body>
<header class="py-xl-5">
    <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
        <nav class="container container--70">
            <ul class="nav--actions">
                <li class="logged-user">
                    Witaj
                    <sec:authentication property="principal.firstName"/>
                    <ul class="dropdown">
                        <li><a href="<c:url value="${pageContext.request.contextPath}/admin/dashboard"/>">Admin</a></li>
                        <li><a href="<c:url value="${pageContext.request.contextPath}/user/details"/>">Profil</a></li>
                        <li><a href="#">Moje zbiórki</a></li>
                        <li>
                            <form action="<c:url value="/logout"/>" method="post">
                                <input class="logout" type="submit" value="Wyloguj"/>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            </form>
                        </li>
                    </ul>
                </li>
            </ul>
            <ul>
                    <%--          <c:choose>--%>
                    <%--              <c:when test="${requestScope['javax.servlet.forward.request_uri']=='/admin/dashboard'}">--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/dashboard"/>" class="btn btn--without-border active">Zarządzaj adminami</a></li>--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/users" />" class="btn btn--without-border">Zarządzaj użytkownikami</a></li>--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/institutions"/>" class="btn btn--without-border">Zarządzaj fundacjami</a></li>--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/categories"/>" class="btn btn--without-border">Zarządzaj kategoriami</a></li>--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/messages"/>" class="btn btn--without-border">Wiadomości</a></li>--%>
                    <%--              </c:when>--%>
                    <%--              <c:when test="${requestScope['javax.servlet.forward.request_uri']=='/admin/users/'}">--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/dashboard"/>" class="btn btn--without-border">Zarządzaj adminami</a></li>--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/users" />" class="btn btn--without-border active">Zarządzaj użytkownikami</a></li>--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/institutions"/>" class="btn btn--without-border">Zarządzaj fundacjami</a></li>--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/categories"/>" class="btn btn--without-border">Zarządzaj kategoriami</a></li>--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/messages"/>" class="btn btn--without-border">Wiadomości</a></li>--%>
                    <%--              </c:when>--%>
                    <%--              <c:when test="${requestScope['javax.servlet.forward.request_uri']=='/admin/institutions'}">--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/dashboard"/>" class="btn btn--without-border">Zarządzaj adminami</a></li>--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/users" />" class="btn btn--without-border">Zarządzaj użytkownikami</a></li>--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/institutions"/>" class="btn btn--without-border active">Zarządzaj fundacjami</a></li>--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/categories"/>" class="btn btn--without-border">Zarządzaj kategoriami</a></li>--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/messages"/>" class="btn btn--without-border">Wiadomości</a></li>--%>
                    <%--              </c:when>--%>
                    <%--              <c:when test="${requestScope['javax.servlet.forward.request_uri']=='/admin/categories'}">--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/dashboard"/>" class="btn btn--without-border">Zarządzaj adminami</a></li>--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/users" />" class="btn btn--without-border">Zarządzaj użytkownikami</a></li>--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/institutions"/>" class="btn btn--without-border">Zarządzaj fundacjami</a></li>--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/categories"/>" class="btn btn--without-border active">Zarządzaj kategoriami</a></li>--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/messages"/>" class="btn btn--without-border">Wiadomości</a></li>--%>
                    <%--              </c:when>--%>
                    <%--              <c:when test="${requestScope['javax.servlet.forward.request_uri']=='/admin/messages'}">--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/dashboard"/>" class="btn btn--without-border">Zarządzaj adminami</a></li>--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/users" />" class="btn btn--without-border">Zarządzaj użytkownikami</a></li>--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/institutions"/>" class="btn btn--without-border">Zarządzaj fundacjami</a></li>--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/categories"/>" class="btn btn--without-border">Zarządzaj kategoriami</a></li>--%>
                    <%--                  <li><a href="<c:url value="${pageContext.request.contextPath}/admin/messages"/>" class="btn btn--without-border active">Wiadomości</a></li>--%>
                    <%--              </c:when>--%>
                    <%--              <c:otherwise>--%>
                <li><a href="<c:url value="${pageContext.request.contextPath}/admin/dashboard/1"/>"
                       class="btn btn--without-border">Zarządzaj adminami</a></li>
                <li><a href="<c:url value="${pageContext.request.contextPath}/admin/users/1" />"
                       class="btn btn--without-border">Zarządzaj użytkownikami</a></li>
                <li><a href="<c:url value="${pageContext.request.contextPath}/admin/institutions/1"/>"
                       class="btn btn--without-border">Zarządzaj fundacjami</a></li>
                <li><a href="<c:url value="${pageContext.request.contextPath}/admin/categories"/>"
                       class="btn btn--without-border">Zarządzaj kategoriami</a></li>
                <li><a href="<c:url value="${pageContext.request.contextPath}/admin/messages/1"/>"
                       class="btn btn--without-border">Wiadomości</a></li>
            </ul>
        </nav>
    </sec:authorize>
</header>
