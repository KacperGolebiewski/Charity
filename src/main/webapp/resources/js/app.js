document.addEventListener("DOMContentLoaded", function() {
  const confirmationForm = document.querySelector("#confirmationForm")
  const confirmationFormAddress = document.querySelector("#confirmationFormAddress")
  const confirmationFormCollection = document.querySelector("#confirmationFormCollection")

  const confirmationUlElement = document.createElement('ul')
  const confirmationLiElement = document.createElement('li')
  const confirmationUlElement2 = document.createElement('ul')
  const confirmationLiElement2 = document.createElement('li')

  const addressUlElement = document.createElement('ul')
  const streetLiElement = document.createElement('li')
  const cityLiElement = document.createElement('li')
  const zipCodeLiElement = document.createElement('li')
  const phoneNumberLiElement = document.createElement('li')

  const collectionUlElement = document.createElement('ul')
  const dateLiElement = document.createElement('li')
  const timeLiElement = document.createElement('li')
  const commentsLiElement = document.createElement('li')


  const spanElementIcon = document.createElement('span')
  spanElementIcon.classList.add("icon");
  spanElementIcon.classList.add("icon-bag");

  const spanElementText = document.createElement('span')
  spanElementText.classList.add("summary--text")

  const spanElementIcon2 = document.createElement('span')
  spanElementIcon2.classList.add("icon");
  spanElementIcon2.classList.add("icon-hand");

  const spanElementText2 = document.createElement('span')
  spanElementText2.classList.add("summary--text")


  confirmationLiElement.appendChild(spanElementIcon)
  confirmationLiElement.appendChild(spanElementText)
  confirmationUlElement.appendChild(confirmationLiElement)
  confirmationLiElement2.appendChild(spanElementIcon2)
  confirmationLiElement2.appendChild(spanElementText2)
  confirmationUlElement2.appendChild(confirmationLiElement2)
  confirmationForm.appendChild(confirmationUlElement)
  confirmationForm.appendChild(confirmationUlElement2)

  addressUlElement.appendChild(streetLiElement)
  addressUlElement.appendChild(cityLiElement)
  addressUlElement.appendChild(zipCodeLiElement)
  addressUlElement.appendChild(phoneNumberLiElement)
  confirmationFormAddress.appendChild(addressUlElement)

  collectionUlElement.appendChild(dateLiElement)
  collectionUlElement.appendChild(timeLiElement)
  collectionUlElement.appendChild(commentsLiElement)
  confirmationFormCollection.appendChild(collectionUlElement)


  /**
   * Form Select
   */
  class FormSelect {
    constructor($el) {
      this.$el = $el;
      this.options = [...$el.children];
      this.init();
    }

    init() {
      this.createElements();
      this.addEvents();
      this.$el.parentElement.removeChild(this.$el);
    }

    createElements() {
      // Input for value
      this.valueInput = document.createElement("input");
      this.valueInput.type = "text";
      this.valueInput.name = this.$el.name;

      // Dropdown container
      this.dropdown = document.createElement("div");
      this.dropdown.classList.add("dropdown");

      // List container
      this.ul = document.createElement("ul");

      // All list options
      this.options.forEach((el, i) => {
        const li = document.createElement("li");
        li.dataset.value = el.value;
        li.innerText = el.innerText;

        if (i === 0) {
          // First clickable option
          this.current = document.createElement("div");
          this.current.innerText = el.innerText;
          this.dropdown.appendChild(this.current);
          this.valueInput.value = el.value;
          li.classList.add("selected");
        }

        this.ul.appendChild(li);
      });

      this.dropdown.appendChild(this.ul);
      this.dropdown.appendChild(this.valueInput);
      this.$el.parentElement.appendChild(this.dropdown);
    }

    addEvents() {
      this.dropdown.addEventListener("click", e => {
        const target = e.target;
        this.dropdown.classList.toggle("selecting");

        // Save new value only when clicked on li
        if (target.tagName === "LI") {
          this.valueInput.value = target.dataset.value;
          this.current.innerText = target.innerText;
        }
      });
    }
  }
  document.querySelectorAll(".form-group--dropdown select").forEach(el => {
    new FormSelect(el);
  });

  /**
   * Hide elements when clicked on document
   */
  document.addEventListener("click", function(e) {
    const target = e.target;
    const tagName = target.tagName;

    if (target.classList.contains("dropdown")) return false;

    if (tagName === "LI" && target.parentElement.parentElement.classList.contains("dropdown")) {
      return false;
    }

    if (tagName === "DIV" && target.parentElement.classList.contains("dropdown")) {
      return false;
    }

    document.querySelectorAll(".form-group--dropdown .dropdown").forEach(el => {
      el.classList.remove("selecting");
    });
  });

  /**
   * Switching between form steps
   */
  class FormSteps {
    constructor(form) {
      this.$form = form;
      this.$next = form.querySelectorAll(".next-step");
      this.$prev = form.querySelectorAll(".prev-step");
      this.$step = form.querySelector(".form--steps-counter span");
      this.currentStep = 1;

      this.$stepInstructions = form.querySelectorAll(".form--steps-instructions p");
      const $stepForms = form.querySelectorAll("form > div");
      this.slides = [...this.$stepInstructions, ...$stepForms];

      this.init();

    }

    /**
     * Init all methods
     */
    init() {
      this.events();
      this.updateForm();
    }




    /**
     * All events that are happening in form
     */
    events() {
      // Next step
      this.$next.forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();
          this.currentStep++;
          this.updateForm();
        });
      });

      // Previous step
      this.$prev.forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();
          this.currentStep--;
          this.updateForm();
        });
      });

      // Form submit
      this.$form.querySelector("form").addEventListener("submit", e => this.submit(e));
    }

    /**
     * Update form front-end
     * Show next or previous section etc.
     */
    updateForm() {
      this.$step.innerText = this.currentStep;

      // TODO: Validation

      this.slides.forEach(slide => {
        slide.classList.remove("active");

        if (slide.dataset.step == this.currentStep) {
          slide.classList.add("active");
        }
      });

      this.$stepInstructions[0].parentElement.parentElement.hidden = this.currentStep >= 5;
      this.$step.parentElement.hidden = this.currentStep >= 5;

      // TODO: get data from inputs and show them in summary
      let quantity = document.querySelector('#quantity').value

      let categories = [];
      document.querySelectorAll('#category').forEach(function (category) {
        if (category.checked === true) {
          categories.push(category.parentElement.lastElementChild.innerText.trim())
        }
      });

      let institution;
      document.querySelectorAll('#institution').forEach(function (element) {
        if (element.checked === true) {
          let text = element.parentElement.lastElementChild.firstElementChild.innerText
          institution = text.substring(8, text.length).trim()
        }
      })
      let street = document.querySelector('#street').value
      let city = document.querySelector('#city').value
      let zipCode = document.querySelector('#zipCode').value
      let phoneNumber = document.querySelector('#phoneNumber').value
      let date = document.querySelector('#date').value
      let time = document.querySelector('#time').value
      let comments = document.querySelector('#pickUpComment').value

      if (quantity == 1) {
        spanElementText.innerText = quantity + " worek zawierający : " + categories.join(", ")
      }
      if (quantity > 1 && quantity < 5) {
        spanElementText.innerText = quantity + " worki zawierające : " + categories.join(", ")
      }
      if (quantity >= 5) {
        spanElementText.innerText = quantity + " worków zawierających : " + categories.join(", ")
      }
      spanElementText2.innerText = "Dla fundacji " + institution

      streetLiElement.innerText = street;
      cityLiElement.innerText = city;
      zipCodeLiElement.innerText = zipCode;
      phoneNumberLiElement.innerText = phoneNumber;

      dateLiElement.innerText = date;
      timeLiElement.innerText = time;
      commentsLiElement.innerText = comments;


    }

  }

  const form = document.querySelector(".form--steps");
  if (form !== null) {
    new FormSteps(form);
  }






});
