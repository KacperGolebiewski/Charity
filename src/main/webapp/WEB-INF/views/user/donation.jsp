<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../header.jsp"/>
    <section class="form--steps">
      <div class="form--steps-instructions">
        <div class="form--steps-container">
          <h3>Ważne!</h3>
          <p data-step="1" class="active">
            Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
            wiedzieć komu najlepiej je przekazać.
          </p>
          <p data-step="2">
            Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
            wiedzieć komu najlepiej je przekazać.
          </p>
          <p data-step="3">
           Wybierz jedną, do
            której trafi Twoja przesyłka.
          </p>
          <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
      </div>

      <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>
        <%--@elvariable id="donation" type="pl.coderslab.charity.donation.Donation"--%>
        <form:form modelAttribute="donation">
          <form:hidden path="id"/>
          <!-- STEP 1: class .active is switching steps -->
          <div data-step="1" class="active">
            <h3>Zaznacz co chcesz oddać:</h3>
              <c:forEach items="${categories}" var="category">
                <c:if test="${category.active}">
                <div class="form-group form-group--checkbox">
                <label>
                  <form:checkbox path="categories"  cssClass="checkbox" value="${category.id}" id="category"/>
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
            <form:errors  path="categories"/>
            </span>
            </div>
            <div class="form-group form-group--buttons">
              <button type="button" class="btn next-step">Dalej</button>
            </div>
          </div>

          <!-- STEP 2 -->
          <div data-step="2">
            <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

            <div class="form-group form-group--inline">
              <label>
                Liczba 60l worków:
                <form:input type="number" name="bags" step="1"  path="quantity"/>
              </label><br>
              <span class="text-error">
            <form:errors  path="quantity"/>
            </span>
            </div>


            <div class="form-group form-group--buttons">
              <button type="button" class="btn prev-step">Wstecz</button>
              <button type="button" class="btn next-step">Dalej</button>
            </div>
          </div>
          <!-- STEP 4 -->
          <div data-step="3">
            <h3>Wybierz organizację, której chcesz pomóc:</h3>
            <c:forEach items="${institutions}" var="institution">
              <div class="form-group form-group--checkbox">
                <label>
                  <form:radiobutton path="institution" value="${institution.id}" id="institution"/>
                  <span class="checkbox radio"></span>
                  <span class="description">
                  <div class="title">Fundacja "${institution.name}"</div>
                  <div class="subtitle">
                    Cel i misja: ${institution.description}
                  </div>
                </span>
                </label>
              </div>
            </c:forEach>
            <div class="form-group form-group--checkbox">
            <span class="text-error">
            <form:errors  path="institution"/>
            </span>
            </div>
            <div class="form-group form-group--buttons">
              <button type="button" class="btn prev-step">Wstecz</button>
              <button type="button" class="btn next-step">Dalej</button>
            </div>
          </div>

          <!-- STEP 5 -->
          <div data-step="4">
            <h3>Podaj adres oraz termin odbioru rzeczy przez kuriera:</h3>

            <div class="form-section form-section--columns">
              <div class="form-section--column">
                <h4>Adres odbioru</h4>
                <div class="form-group form-group--inline">
                  <label> Ulica <form:input type="text" path="street"/> </label>
                    <span class="text-error">
                       <form:errors  path="street"/>
                    </span>
                </div>
                <div class="form-group form-group--inline">
                  <label> Miasto <form:input type="text" path="city"/> </label>
                    <span class="text-error">
                         <form:errors  path="city"/>
                    </span>
                </div>

                <div class="form-group form-group--inline">
                  <label>
                    Kod pocztowy <form:input type="text" path="zipCode"/>
                  </label>
                    <span class="text-error">
                       <form:errors  path="zipCode"/>
                    </span>
                </div>
                <div class="form-group form-group--inline">
                  <label>
                    Numer telefonu <form:input type="text" path="phoneNumber"/>
                  </label>
                    <span class="text-error">
                       <form:errors  path="phoneNumber"/>
                    </span>                </div>
              </div>
              <div class="form-section--column">
                <h4>Termin odbioru</h4>
                <div class="form-group form-group--inline">
                  <label> Data <form:input type="date" path="pickUpDate" id="date"/> </label>
                    <span class="text-error">
                        <form:errors  path="pickUpDate"/>
                    </span>
                </div>


                <div class="form-group form-group--inline">
                  <label> Godzina <form:input type="time" path="pickUpTime" id="time"/> </label>
                    <span class="text-error">
                       <form:errors  path="pickUpTime"/>
                    </span>
                </div>

                <div class="form-group form-group--inline">
                  <label>
                    Uwagi dla kuriera
                    <form:textarea rows="5" path="pickUpComment" spellcheck="false"/>
                  </label>
                </div>
              </div>
            </div>
            <div class="form-group form-group--buttons">
              <button type="button" class="btn prev-step">Wstecz</button>
              <button type="button" class="btn next-step">Dalej</button>
            </div>
          </div>
          <!-- STEP 6 -->
          <div data-step="5">
            <h3>Podsumowanie Twojej darowizny</h3>
            <div class="summary">
              <div id="confirmationForm" class="form-section">
                <h4 >Oddajesz:</h4>
              </div>
              <div class="form-section form-section--columns">
                <div id="confirmationFormAddress" class="form-section--column">
                  <h4>Adres odbioru:</h4>
                </div>
                <div id="confirmationFormCollection" class="form-section--column">
                  <h4>Termin odbioru:</h4>
                </div>
              </div>
            </div>
            <div class="form-group form-group--buttons">
              <button type="button" class="btn prev-step">Wstecz</button>
              <button type="submit" class="btn">Potwierdzam</button>
            </div>
          </div>
        </form:form>
      </div>
    </section>
<jsp:include page="../footer.jsp"/>