<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../header.jsp"/>
<section class="login-page">
  <h2>Podaj email w celu przypomnienia hasła:</h2>
  <form method="post" action="<c:url value="${pageContext.request.contextPath}/password-recover"/>">
    <div class="form-group">
      <input type="email" name="email" placeholder="Email" />
    </div>
    <div class="form-group form-group--buttons">
      <button class="btn" type="submit">Wyślij</button>
    </div>
  </form>
</section>
<jsp:include page="../footer.jsp"/>