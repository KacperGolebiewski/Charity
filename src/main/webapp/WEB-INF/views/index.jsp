<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<jsp:include page="../views/header.jsp"/>
<section id="how-it-works" class="stats">
    <div class="container container--85">
        <div class="stats--item">
            <em>${totalQuantity}</em>

            <h3><spring:message code="text.donatedBags"/></h3>
            <p><spring:message code="text.joinEveryone"/></p>
        </div>

        <div class="stats--item">
            <em>${totalDonations}</em>
            <h3><spring:message code="text.donations"/></h3>
            <p><spring:message code="text.joinSpreadingGood"/></p>
        </div>

    </div>
</section>

<section id="steps" class="steps">
    <h2><spring:message code="text.4steps"/></h2>

    <div class="steps--container">
        <div class="steps--item">
            <span class="icon icon--hands"></span>
            <h3><spring:message code="text.chooseItems"/></h3>
            <p><spring:message code="text.examples"/></p>
        </div>
        <div class="steps--item">
            <span class="icon icon--arrow"></span>
            <h3><spring:message code="text.putInBags"/></h3>
            <p><spring:message code="text.useBinBags"/></p>
        </div>
        <div class="steps--item">
            <span class="icon icon--glasses"></span>
            <h3><spring:message code="text.decideWhoYouWantToHelp"/></h3>
            <p><spring:message code="text.chooseTrustedPlace"/></p>
        </div>
        <div class="steps--item">
            <span class="icon icon--courier"></span>
            <h3><spring:message code="text.orderCourier"/></h3>
            <p><spring:message code="text.courierWillCome"/></p>
        </div>
    </div>
    <sec:authorize access="!isAuthenticated()">
        <a href="<c:url value="/register"/>" class="btn btn--large"><spring:message code="text.createAcc"/></a>
    </sec:authorize>
</section>

<section id="about-us" class="about-us">
    <div class="about-us--text">
        <h2><spring:message code="text.aboutUs"/></h2>
        <p><spring:message code="text.aboutUsText"/></p>
        <img src="<c:url value="/resources/images/signature.svg"/>"
             class="about-us--text-signature" alt="Signature"/>
    </div>
    <div class="about-us--image"><img
            src="<c:url value="/resources/images/about-us.jpg"/>"
            alt="People in circle"/>
    </div>
</section>

<section id="institutions" class="help">
    <h2><spring:message code="text.whoDoWeHelp"/></h2>

    <!-- SLIDE 1 -->
    <div class="help--slides active" data-id="1">
        <p><spring:message code="text.foundationDescription"/></p>

        <ul class="help--slides-items">
            <c:forEach items="${institutions}" var="institution" varStatus="status">
                <c:if test="${status.index %2 == 0}">
                    <li>
                    <div class="col">
                        <div class="title"><spring:message code="text.institution"/> "${institution.name}"</div>
                        <div class="subtitle"><spring:message
                                code="text.purposeAndMission"/>: ${institution.description}</div>
                    </div>
                </c:if>
                <c:if test="${status.index %2 != 0}">
                    <div class="col">
                        <div class="title"><spring:message code="text.institution"/> "${institution.name}"</div>
                        <div class="subtitle"><spring:message
                                code="text.purposeAndMission"/>: ${institution.description}</div>
                    </div>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
</section>
<jsp:include page="../views/footer.jsp"/>