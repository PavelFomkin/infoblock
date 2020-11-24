<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<body>
<div th:fragment="block">
  <h1 class="content__title">
    Записаться на обучение
  </h1>
  <div id="request_submitted" style="display: none">
    <p class="content__paragraph">
      <strong>Ваша заявка на обучение успешно отправлена!</strong><br>
      Нам понадобится некоторое время на ее проверку. После завершения проверки вы получите
      уведомление об изменении статуса заявки на электронную почту, указанную вами в форме заявки на
      обучение.
    </p>
    <p class="content__paragraph content_small content_strong">
      <a href="/" class="link">Вернуться на главную страницу</a>
    </p>
  </div>
  <div class="row" id="request_main">
    <div class="main__aside-neighbour">
      <form id="ws_request_form" action="/iblocks/course/request" method="POST" class="form form_descripted" onchange="validate()" onsubmit="return submitForm()">
        <div class="main__content">
          <h2 class="content__subtitle">
            Программа обучения
          </h2>
          <div class="content_small content_muted mb-3">
            <div class="content__paragraph">
              Для подбора программы обучения, выберите одну из трех приведенных категорий:
            </div>
            <ul class="list">
              <li class="list__item">
                Если вы&nbsp;недавно окончили или в&nbsp;ближайшее время окончите обучение
                в&nbsp;образовательной организации, выберите категорию <strong> &laquo;Выпускник
                образовательной организации&raquo;</strong>;
              </li>
              <li class="list__item">
                Если вы&nbsp;&mdash; специалист, находящийся в&nbsp;поиске работы, выберите категорию
                <strong>&laquo;Ищу работу&raquo;</strong>;
              </li>
              <li class="list__item">
                Если в&nbsp;связи с&nbsp;эпидемиологической обстановкой вы&nbsp;находитесь в&nbsp;числе
                граждан с&nbsp;повышенным риском потери работы, выберите категорию <strong>&laquo;Нахожусь
                под риском увольнения&raquo;</strong>.
              </li>
            </ul>
          </div>
          <div id="category" class="form__section" onchange="handleCategoryChange()">
            <fieldset class="form__fieldset">
                <legend class="form__title">Категория</legend>
                <label class="radio">
                  <input value="graduate" type="radio" name="student.category">
                  <span class="radio__label">Выпускник образовательной организации</span>
                </label>
                <label class="radio">
                  <input value="unemployed" type="radio" name="student.category">
                  <span class="radio__label">Ищу работу</span>
                </label>
                <label class="radio">
                  <input value="dismissal_risk" type="radio" name="student.category">
                  <span class="radio__label">Нахожусь под риском увольнения</span>
                </label>
              </fieldset>
          </div>
          <div id="locality" style="display:none" class="form__section" onchange="handleLocalityChange()">
            <div class="form__description">Для подбора доступной для прохождения программы обучения, выберите из списка регион
            </div>
            <label class="select">
              <select id="locality_select" class="select__control" data-live-search="true">
              </select>
              <span class="select__title">Регион обучения</span>
            </label>
          </div>
          <div id="education-competence" style="display:none" class="form__section" onchange="handleEducationCompetenceChange()">
            <div class="form__description">Программы обучения доступные в вашем регионе
            </div>
            <label class="select">
              <select id="education-competence_select" name="competency" class="select__control" data-live-search="true">
              </select>
              <span class="select__title">Программа обучения</span>
            </label>
          </div>
          <div id="education-competence_note" style="display:none" class="card card_note">
            <div class="content__paragraph">
              <strong><span id="education-competence_note_title"></span></strong>
              <br>
              <span id="education-competence_note_description"></span>
            </div>
          </div>
        </div>
        <div id="educational-organization" style="display:none" class="main__content" onchange="handleEducationalOrganizationChange()">
          <h2 class="content__subtitle">
            Форма и место обучения
          </h2>
          <div class="form__section">
            <label class="checkbox">
              <input id="is_distance_learning" type="checkbox" name="isDistanceLearning">
              <span class="checkbox__label">Дистанционное обучение</span>
            </label>
          </div>
          <div class="form__section">
            <label class="select">
              <select id="educational-organization_select" name="providerAddress" class="select__control" data-live-search="true">
              </select>
              <span class="select__title">Место обучения</span>
            </label>
          </div>
        </div>
        <div id="personal-info" style="display:none" class="main__content">
          <h2 class="content__subtitle">
            Персональные данные
          </h2>
          <dl class="definitions mb-3">
            <div class="definitions__item mb-1">
              <dt class="definitions__key">ФИО:</dt>
              <dd class="definitions__value">
                <p th:text="${candidate.firstName + ' ' + candidate.lastName + ' ' + candidate.middleName}">Фамилия Имя Отчество</p></dd>
            </div>
            <input th:value="${candidate.firstName}" name="student.firstName" type="hidden"/>
            <input th:value="${candidate.lastName}" name="student.lastName" type="hidden"/>
            <input th:value="${candidate.middleName}" name="student.middleName" type="hidden"/>
            <div class="definitions__item">
              <dt class="definitions__key">СНИЛС:</dt>
              <dd class="definitions__value">
                <p th:text="${candidate.snils}">0001234000009</p></dd>
            </div>
            <input th:value="${candidate.snils}" name="student.snils" type="hidden"/>
          </dl>
          <div class="form__section">
            <div class="form__description">
              Выберите из списка регион вашего проживания
            </div>
            <label class="select select_required">
              <select id="personal-info_locality_select" name="student.region" class="select__control" data-live-search="true" onchange="handleLifeLocalityChange()">
              </select>
              <span class="select__title">Регион проживания</span>
            </label>
          </div>
          <div class="form__section">
            <label class="select select_required">
              <select id="personal-info_city_select" name="student.city" class="select__control" data-live-search="true">
              </select>
              <span class="select__title">Город проживания</span>
            </label>
          </div>
          <div class="form__section">
            <div class="row">
              <div class="col-lg-6">
                <label class="input input_date">
                  <input id="personal-info_birthday"class="input__control" type="text" placeholder="08.08.2020"
                    name="student.birthday"/>
                  <span class="input__title">Дата рождения:</span>
                  <span id="validation_birthday_error" style="display: none" class="input__error">Введите корректное значение</span>
                </label>
              </div>
            </div>
          </div>
          <div class="form__section">
            <fieldset id="personal-info_sex" class="form__fieldset">
              <legend class="form__title">Пол</legend>
              <div class="row">
                <div class="col-auto">
                  <label class="radio">
                    <input value="male" type="radio" name="student.sex">
                    <span class="radio__label">Мужской</span>
                  </label>
                </div>
                <div class="col-auto">
                  <label class="radio">
                    <input value="female" type="radio" name="student.sex">
                    <span class="radio__label">Женский</span>
                  </label>
                </div>
              </div>
            </fieldset>
          </div>
          <div class="form__section">
            <div class="row">
              <div class="col-lg-6">
                <label class="input">
                  <input id="personal-info_phone_number" class="input__control" type="text" required
                    placeholder="+7(__) ___-__-__" data-inputmask="'mask': '+\\7(99[9]) 999-99-99',
                    'numericInput': true" inputmode="text" th:value="${candidate.phoneNumber}" name="student.phoneNumber">
                  <span class="input__title">Телефон</span>
                  <span id="validation_phone_error" style="display: none" class="input__error">Введите корректное значение</span>
                </label>
              </div>
            </div>
          </div>
          <div class="form__section">
            <div class="form__description">
              Укажите адрес вашей электронной почты для получения уведомлений об изменении статуса заявки на обучение
            </div>
            <label class="input">
              <input id="personal-info_email" class="input__control" required type="email"  placeholder="Введите email"
                th:value="${candidate.email}" name="student.email"/>
              <span class="input__title">Email</span>
            </label>
          </div>
          <div class="form__section">
            <div class="form__description">
              Укажите адрес электронной почты повторно
            </div>
            <label class="input">
              <input id="personal-info_email_duplicate" class="input__control" required type="email"  placeholder="Введите email"
                th:value="${candidate.email}"/>
              <span class="input__title">Подтверждение email</span>
              <span id="validation_email_error" style="display: none" class="input__error">Email не совпадает с указанным ранее</span>
            </label>
          </div>
        </div>
        <button id="send-request" type="submit" class="button" style="display:none">Отправить заявку</button>
      </form>
    </div>
    <div class="main__aside main__aside_relative mb-3">
      <div class="main__aside-container">
        <div class="card">
          <div class="step-check step-check_fill">
            <div id="category_step" class="step-check__item step-check__item_active">
              <div class="step-check__label">
                <svg class="step-check__check">
                  <use xlink:href="/assets/redesign-theme/uikit/icon/icons.svg#simple-check"></use>
                </svg>
              </div>
              <div class="step-check__main">
                <div class="step-check__title">
                  Выбор категории
                </div>
              </div>
            </div>
            <div id="locality_step" class="step-check__item step-check__item_disabled">
              <div class="step-check__label">
                <svg class="step-check__check">
                  <use xlink:href="/assets/redesign-theme/uikit/icon/icons.svg#simple-check"></use>
                </svg>
              </div>
              <div class="step-check__main">
                <div class="step-check__title">
                  Регион обучения
                </div>
              </div>
            </div>
            <div id="education-competence_step" class="step-check__item step-check__item_disabled">
              <div class="step-check__label">
                <svg class="step-check__check">
                  <use xlink:href="/assets/redesign-theme/uikit/icon/icons.svg#simple-check"></use>
                </svg>
              </div>
              <div class="step-check__main">
                <div class="step-check__title">
                  Программа обучения
                </div>
              </div>
            </div>
            <div id="educational-organization_step" class="step-check__item step-check__item_disabled">
              <div class="step-check__label">
                <svg class="step-check__check">
                  <use xlink:href="/assets/redesign-theme/uikit/icon/icons.svg#simple-check"></use>
                </svg>
              </div>
              <div class="step-check__main">
                <div class="step-check__title">
                  Форма и место обучения
                </div>
              </div>
            </div>
            <div id="personal-info_step" class="step-check__item step-check__item_disabled">
              <div class="step-check__label">
                <svg class="step-check__check">
                  <use xlink:href="/assets/redesign-theme/uikit/icon/icons.svg#simple-check"></use>
                </svg>
              </div>
              <div class="step-check__main">
                <div class="step-check__title">
                  Персональные данные
                </div>
              </div>
            </div>
            <div id="send-request_step" class="step-check__item step-check__item_disabled">
              <div class="step-check__label">
                <svg class="step-check__check">
                  <use xlink:href="/assets/redesign-theme/uikit/icon/icons.svg#simple-check"></use>
                </svg>
              </div>
              <div class="step-check__main">
                <div class="step-check__title">
                  Отправить заявку
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div id="error_notification" style="display: none; position: fixed; z-index: 10003; top: 120px; right: 20px;"
    class="notifications__card notifications__card_warning">
    <div class="notifications__card-icon">
      <svg class="icon icon_in-text">
        <use xlink:href="/assets/redesign-theme/uikit/icon/icons.svg#question"></use>
      </svg>
    </div>
    <div class="notifications__card-title">
      <span>Не удалось отправить заявку. Пожалуйста, повторите попытку позже. </span>
    </div>
    <button class="button button_plain notifications__card-close">
      <svg class="icon icon_s">
        <use xlink:href="/uikit/icon/icons.svg#close"></use>
      </svg>
    </button>
  </div>
  <script>

    function submitForm() {
      if (!validatePhoneNumber() || !validateEmails() || !validateBirthday()) {
        return false;
      }
      var $form = $("form");
      $.ajax({
        type: $form.attr('method'),
        url: $form.attr('action'),
        contentType: 'application/json',
        data: JSON.stringify(getFormData($form)),
        success: function() {
          $("#request_main").hide();
          $("#request_submitted").show();
          document.body.scrollTop = 0; // for Safari
          document.documentElement.scrollTop = 0; // for Chrome, Firefox, IE and Opera
        },
        error: function() {
          $("#error_notification").show();
          setTimeout(function() { $("#error_notification").hide(); }, 5000);
        }
      });

      this.event.preventDefault();
    }

    function getFormData($form){
      // Make sure the checked checkboxes value is true
      $.each($form.find("input[type='checkbox']:checked"), function(i, c){
        $(c).val(true);
      });

      // Serialize
      var unindexed_array = $form.serializeArray();
      var indexed_array = {};

      $.map(unindexed_array, function(n, i){
        if (n['name'].split('.').length > 1) {
          var objName = n['name'].split('.')[0];
          var paramName = n['name'].split('.')[1];
          if (!indexed_array[objName]) {
            indexed_array[objName] = {};
          }
          if (indexed_array[objName][paramName]) {
            var valueArray = [indexed_array[objName][paramName]];
            indexed_array[objName][paramName] = valueArray.concat(n['value']);
          } else {
            indexed_array[objName][paramName] = n['value'];
          }
        } else {
          if(indexed_array[n['name']]){
            var valueArray = [indexed_array[n['name']]];
            indexed_array[n['name']] = valueArray.concat(n['value']);
          } else {
            indexed_array[n['name']] = n['value'];
          }
        }
      });

      // Add the unchecked checkboxes
      $.each($form.find("input[type='checkbox']:not(:checked)"), function(i, c){
        indexed_array[$(c).attr('name')] = "false";
      });

      return indexed_array;
     }

    var ACTIVE_STEP = "step-check__item_active";
    var DISABLED_STEP = "step-check__item_disabled";
    var localities;
    var educationCompetencies;

    function handleCategoryChange() {
      setLocalities();
      moveToLocalityStep();
    }

    function handleLocalityChange() {
      setEducationCompetencies();
      moveToEducationCompetenceStep();
    }

    function handleEducationCompetenceChange() {
      updateEducationCompetenceNote();
      setEducationalOrganizations();
      moveToEducationalOrganizationStep();
    }

    function handleEducationalOrganizationChange() {
      if (this.event.target.id === "is_distance_learning") {
        setEducationalOrganizations();
        moveToEducationalOrganizationStep();
        return;
      }
      setLifeLocalities();
      moveToPersonalInfoStep();
    }

    function handleLifeLocalityChange() {
      setCitiesForRegion($("#personal-info_locality_select").val());
      moveToPersonalInfoStep();
    }

    function moveToLocalityStep() {
      $("#category_step").removeClass(ACTIVE_STEP);
      $("#locality_step").removeClass(DISABLED_STEP).addClass(ACTIVE_STEP);
      $("#education-competence_step").removeClass(ACTIVE_STEP).addClass(DISABLED_STEP);
      $("#educational-organization_step").removeClass(ACTIVE_STEP).addClass(DISABLED_STEP);
      $("#personal-info_step").removeClass(ACTIVE_STEP).addClass(DISABLED_STEP);
      $("#send-request_step").removeClass(ACTIVE_STEP).addClass(DISABLED_STEP);
      $("#locality").show();
      $("#education-competence").hide();
      $("#education-competence_note").hide();
      $("#educational-organization").hide();
      $("#personal-info").hide();
      $("#send-request").hide();
    }

    function moveToEducationCompetenceStep() {
      $("#locality_step").removeClass(ACTIVE_STEP);
      $("#education-competence_step").removeClass(DISABLED_STEP).addClass(ACTIVE_STEP);
      $("#educational-organization_step").removeClass(ACTIVE_STEP).addClass(DISABLED_STEP);
      $("#personal-info_step").removeClass(ACTIVE_STEP).addClass(DISABLED_STEP);
      $("#send-request_step").removeClass(ACTIVE_STEP).addClass(DISABLED_STEP);
      $("#education-competence").show();
      $("#education-competence_note").hide();
      $("#educational-organization").hide();
      $("#personal-info").hide();
      $("#send-request").hide();
    }

    function moveToEducationalOrganizationStep() {
      $("#education-competence_step").removeClass(ACTIVE_STEP);
      $("#educational-organization_step").removeClass(DISABLED_STEP).addClass(ACTIVE_STEP);
      $("#personal-info_step").removeClass(ACTIVE_STEP).addClass(DISABLED_STEP);
      $("#send-request_step").removeClass(ACTIVE_STEP).addClass(DISABLED_STEP);
      $("#educational-organization").show();
      $("#personal-info").hide();
      $("#send-request").hide();
    }

    function moveToPersonalInfoStep() {
      $("#educational-organization_step").removeClass(ACTIVE_STEP);
      $("#personal-info_step").removeClass(DISABLED_STEP).addClass(ACTIVE_STEP);
      $("#send-request_step").removeClass(ACTIVE_STEP).addClass(DISABLED_STEP);
      $("#personal-info").show();
      $("#send-request").hide();
    }

    function moveToSendRequestStep() {
      $("#personal-info_step").removeClass(ACTIVE_STEP);
      $("#send-request_step").removeClass(DISABLED_STEP).addClass(ACTIVE_STEP);
      $("#send-request").show();
    }

    function setLocalities() {
      if (!!localities) {
        $("#locality_select").prop("selectedIndex", -1).selectpicker('refresh');
        return;
      }
      loadLocalities();
    }

    function setEducationCompetencies() {
      loadEducationCompetencies($("#locality_select").val());
    }

    function setEducationalOrganizations() {
      var regionId = $("#locality_select").val();
      var educationCompetenceId = $("#education-competence_select").val()
      var isDistanceLearning = $("#is_distance_learning").is(':checked')
      loadEducationalOrganizations(regionId, educationCompetenceId, isDistanceLearning);
    }

    function setLifeLocalities() {
      addOptions($("#personal-info_locality_select"), localities);
    }

    function setCitiesForRegion(regionId) {
      loadCities(regionId);
    }

    function addOptions(targetEl, arr) {
      targetEl.empty();
      arr.forEach(function(el) {
        addOptionEl(targetEl, el.name, el.id);
      });
      targetEl.prop("selectedIndex", -1);
      targetEl.selectpicker('refresh');
    }

    function addOptionEl(targetEl, name, value) {
      var option = document.createElement("option");
      option.setAttribute("value", value);
      option.innerText = name;
      targetEl.append(option);
    }

    function updateEducationCompetenceNote() {
      var selectedItem = $("#education-competence_select").val();
      if (!selectedItem) {
        return;
      }

      var selectedCompetency = educationCompetencies.filter(function(el) { return el.id === selectedItem; })[0];
      $("#education-competence_note_title").text(selectedCompetency.name);
      $("#education-competence_note_description").text(selectedCompetency.description);
      $("#education-competence_note").show();
    }

    function validatePhoneNumber() {
      if ($("#personal-info_phone_number").val().length !== 10) {
        $("#validation_phone_error").show();
        $("#personal-info_phone_number").parent().addClass("input_error");
        return false;
      }
      return true;
    }

    function validateEmails() {
      if ($("#personal-info_email").val() &&
        $("#personal-info_email_duplicate").val() &&
        $("#personal-info_email").val() !== $("#personal-info_email_duplicate").val()) {
        $("#validation_email_error").show();
        $("#personal-info_email").parent().addClass("input_error");
        $("#personal-info_email_duplicate").parent().addClass("input_error");
        return false;
      }
      return true;
    }

    function validateBirthday() {
      if (!$("#personal-info_birthday").val() ||
        /^\d{2}.\d{2}.\d{4}$/.test($("#personal-info_birthday").val())) {
        return true;
      }
      $("#validation_birthday_error").show();
      $("#personal-info_birthday").parent().addClass("input_error");
      return false;
    }

    function validate() {
      if ($("#personal-info_step").hasClass(ACTIVE_STEP) &&
          $("#personal-info_locality_select").val() &&
          $("#personal-info_city_select").val() &&
          $("#personal-info_phone_number").val() &&
          $("#personal-info_email").val() &&
          $("#personal-info_email_duplicate").val()) {
        moveToSendRequestStep();
      } else if ($("#send-request_step").hasClass(ACTIVE_STEP) &&
          !$("#personal-info_locality_select").val() &&
          !$("#personal-info_city_select").val() &&
          !$("#personal-info_phone_number").val() &&
          !$("#personal-info_email").val() &&
          !$("#personal-info_email_duplicate").val()) {
        moveToPersonalInfoStep();
      }
      $("#validation_phone_error").hide();
      $("#personal-info_phone_number").parent().removeClass("input_error");
      $("#validation_email_error").hide();
      $("#personal-info_email").parent().removeClass("input_error");
      $("#personal-info_email_duplicate").parent().removeClass("input_error");
      $("#validation_birthday_error").hide();
      $("#personal-info_birthday").parent().removeClass("input_error");
    }

    function loadLocalities() {
      load("/iblocks/course/localities", function(data) {
        localities = data.data;
        addOptions($("#locality_select"), localities);
      })
    }

    function loadCities(regionId, callback) {
      load("/iblocks/course/cities?regionId=" + regionId, function (data) {
        addOptions($("#personal-info_city_select"), data.data);
      })
    }

    function loadEducationCompetencies(regionId) {
      load("/iblocks/course/education-competence?regionId=" + regionId, function(data) {
        educationCompetencies = data.data
        addOptions($("#education-competence_select"), educationCompetencies);
      });
    }

    function loadEducationalOrganizations(regionId, educationCompetenceId, isDistanceLearning) {
      var url = "/iblocks/course/educational-organizations"
          + "?regionId=" + regionId
          + "&educationCompetenceId=" + educationCompetenceId
          + "&isDistanceLearning=" + isDistanceLearning;
      load(url, function(data) {
        addOptions($("#educational-organization_select"), data.data);
      });
    }

    function load(url, callback) {
      $.ajax({
        url: url,
        async: true,
        type: "GET",
        success: callback});
    }
  </script>
</div>
</body>
</html>
