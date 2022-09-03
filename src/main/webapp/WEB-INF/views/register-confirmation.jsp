<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../views/header-form.jsp"/>
<div class="slogan container container--90">
  <h2>
    Dziękujemy za potwierdzenie rejestracji.
    <div class="form-group form-group--buttons">
      <a href="<c:url value="${pageContext.request.contextPath}/login"/>" class="btn btn--without-border">Zaloguj się</a>
    </div>
  </h2>
</div>
</header>
<jsp:include page="../views/footer.jsp"/>