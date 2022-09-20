<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../../header.jsp"/>
<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3><spring:message code="text.important"/></h3>
            <p data-step="1" class="active">
                <spring:message code="text.donationInstructions"/>
            </p>
            <p data-step="2">
                <spring:message code="text.donationInstructions"/>
            </p>
            <p data-step="3">
                <spring:message code="text.donationInstructions2"/>
            </p>
            <p data-step="4"><spring:message code="text.addressAndPickUpDate"/></p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter"><spring:message code="text.step"/> <span>1</span>/4</div>
        <%--@elvariable id="donation" type="pl.coderslab.charity.donation.Donation"--%>
        <form:form modelAttribute="donation">
            <form:hidden path="id"/>
            <!-- STEP 1: class .active is switching steps -->
            <div data-step="1" class="active">
                <h3><spring:message code="text.chooseWhatYouWantToGiveAway"/></h3>
                <c:forEach items="${categories}" var="category">
                    <c:if test="${category.active}">
                        <div class="form-group form-group--checkbox">
                            <label>
                                <form:checkbox path="categories" cssClass="checkbox" value="${category.id}"
                                               id="category"/>
                                    <%--                  <span class="checkbox"></span>--%>
                                <span class="description">
                  <div class="title">${category.name}</div>
                </span>
                            </label>
                        </div>
                    </c:if>
                </c:forEach>
                <div class="form-group form-group--checkbox">
            <span class="text-error">
            <form:errors path="categories"/>
            </span>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step"><spring:message code="text.next"/></button>
                </div>
            </div>

            <!-- STEP 2 -->
            <div data-step="2">
                <h3><spring:message code="text.enterNumberOfBags"/></h3>

                <div class="form-group form-group--inline">
                    <label>
                        <spring:message code="text.numberOfBags"/>
                        <form:input type="number" name="bags" step="1" path="quantity"/>
                    </label><br>
                    <span class="text-error">
            <form:errors path="quantity"/>
            </span>
                </div>


                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step"><spring:message code="text.previous"/></button>
                    <button type="button" class="btn next-step"><spring:message code="text.next"/></button>
                </div>
            </div>
            <!-- STEP 4 -->
            <div data-step="3">
                <h3><spring:message code="text.chooseOrganization"/></h3>
                <c:forEach items="${institutions}" var="institution">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <form:radiobutton path="institution" value="${institution.id}" id="institution"/>
                            <span class="checkbox radio"></span>
                            <span class="description">
                  <div class="title"><spring:message code="text.institution"/> "${institution.name}"</div>
                  <div class="subtitle">
                    <spring:message code="text.purposeAndMission"/> ${institution.description}
                  </div>
                </span>
                        </label>
                    </div>
                </c:forEach>
                <div class="form-group form-group--checkbox">
            <span class="text-error">
            <form:errors path="institution"/>
            </span>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step"><spring:message code="text.previous"/></button>
                    <button type="button" class="btn next-step"><spring:message code="text.next"/></button>
                </div>
            </div>

            <!-- STEP 5 -->
            <div data-step="4">
                <h3><spring:message code="text.receiptOfTheGoods"/></h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4><spring:message code="text.pickUpAddress"/></h4>
                        <div class="form-group form-group--inline">
                            <label><spring:message code="text.street"/> <form:input type="text" path="street"/> </label>
                            <span class="text-error">
                       <form:errors path="street"/>
                    </span>
                        </div>
                        <div class="form-group form-group--inline">
                            <label><spring:message code="text.city"/> <form:input type="text" path="city"/> </label>
                            <span class="text-error">
                         <form:errors path="city"/>
                    </span>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                <spring:message code="text.zipCode"/> <form:input type="text" path="zipCode"/>
                            </label>
                            <span class="text-error">
                       <form:errors path="zipCode"/>
                    </span>
                        </div>
                        <div class="form-group form-group--inline">
                            <label>
                                <spring:message code="text.phoneNumber"/> <form:input type="text" path="phoneNumber"/>
                            </label>
                            <span class="text-error">
                       <form:errors path="phoneNumber"/>
                    </span></div>
                    </div>
                    <div class="form-section--column">
                        <h4><spring:message code="text.pickUpDate"/></h4>
                        <div class="form-group form-group--inline">
                            <label><spring:message code="text.date"/> <form:input type="date" path="pickUpDate"
                                                                                  id="date"/> </label>
                            <span class="text-error">
                        <form:errors path="pickUpDate"/>
                    </span>
                        </div>


                        <div class="form-group form-group--inline">
                            <label><spring:message code="text.pickUpTime"/> <form:input type="time" path="pickUpTime"
                                                                                        id="time"/> </label>
                            <span class="text-error">
                       <form:errors path="pickUpTime"/>
                    </span>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                <spring:message code="text.notesForTheCourier"/>
                                <form:textarea rows="5" path="pickUpComment" spellcheck="false"/>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step"><spring:message code="text.previous"/></button>
                    <button type="button" class="btn next-step"><spring:message code="text.next"/></button>
                </div>
            </div>
            <!-- STEP 6 -->
            <div data-step="5">
                <h3><spring:message code="text.donationSummary"/></h3>
                <div class="summary">
                    <div id="confirmationForm" class="form-section">
                        <h4><spring:message code="text.donate"/></h4>
                    </div>
                    <div class="form-section form-section--columns">
                        <div id="confirmationFormAddress" class="form-section--column">
                            <h4><spring:message code="text.pickUpAddress"/>:</h4>
                        </div>
                        <div id="confirmationFormCollection" class="form-section--column">
                            <h4><spring:message code="text.pickUpDateAndTime"/></h4>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step"><spring:message code="text.previous"/></button>
                    <button type="submit" class="btn"><spring:message code="text.confirm"/></button>
                </div>
            </div>
        </form:form>
    </div>
</section>
<jsp:include page="../../footer.jsp"/>