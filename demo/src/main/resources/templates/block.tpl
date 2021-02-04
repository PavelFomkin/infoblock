<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<body>
<div th:fragment="block"  th:inline='javascript'>
  <h1 class="content__title">
    Записаться на обучение
  </h1>
  <div class="row">
    <div class="main__aside-neighbour">
      <form id="ws_request_form" action="/iblocks/course/request" method="POST" class="form form_descripted">
        <div class="main__content">
          <h2 class="content__subtitle">
            Компетенция и форма обучения
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
          <div class="form__section">
            <fieldset id="category" class="form__fieldset">
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
          <div id="locality" style="display:none" class="form__section">
            <div class="form__description">Для подбора доступной для прохождения программы обучения, выберите из списка регион
            </div>
            <label class="select">
              <select id="locality_select" class="select__control" data-live-search="true">
              </select>
              <span class="select__title">Регион обучения</span>
            </label>
          </div>
          <div id="education-competence" style="display:none" class="form__section">
            <div class="form__section">
              <label class="checkbox">
                <input id="is_distance_learning" type="checkbox" name="distance_learning">
                <span class="checkbox__label">Дистанционное обучение</span>
              </label>
            </div>
            <div class="form__description">Программы обучения доступные в вашем регионе
            </div>
            <label class="select">
              <select id="education-competence_select" name="competency" class="select__control" data-live-search="true">
              </select>
              <span class="select__title">Компетенция</span>
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
        <div id="educational-organization" style="display:none" class="main__content">
          <h2 class="content__subtitle">
            Место обучения
          </h2>
          <div class="form__section">
            <label class="select">
              <select id="educational-organization_select" name="provider" class="select__control" data-live-search="true">
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
                <p th:text="${candidate.firstName + ' ' + candidate.lastName + ' ' + candidate.middleName}">Имя Фамилия Отчество</p></dd>
            </div>
            <input th:value="${candidate.firstName}" name="student.first_name" type="hidden"/>
            <input th:value="${candidate.lastName}" name="student.last_name" type="hidden"/>
            <input th:value="${candidate.middleName}" name="student.middle_name" type="hidden"/>
            <div class="definitions__item mb-1">
              <dt class="definitions__key">СНИЛС:</dt>
              <dd class="definitions__value">
                <p th:text="${candidate.snils}">0001234000009</p></dd>
            </div>
            <input th:value="${candidate.snils}" name="student.snils" type="hidden"/>
            <div id="personal-info_birthday_text_block" style="display: none" class="definitions__item mb-1">
              <dt class="definitions__key">Дата рождения:</dt>
              <dd class="definitions__value">
                <p id="personal-info_birthday_text"></p></dd>
            </div>
            <div id="personal-info_sex_text_block" style="display: none" class="definitions__item">
              <dt class="definitions__key">Пол:</dt>
              <dd class="definitions__value">
                <p id="personal-info_sex_text"></p></dd>
            </div>
          </dl>
          <div id="personal-info_birthday_block" class="form__section">
            <div class="row">
              <div class="col-lg-6">
                <label class="input input_date">
                  <input id="personal-info_birthday" class="input__control" type="text" placeholder="08.08.2020" name="student.birthday"/>
                  <span class="input__title">Дата рождения:</span>
                  <span id="validation_birthday_error" style="display: none" class="input__error">Введите корректное значение</span>
                </label>
              </div>
            </div>
          </div>
          <div id="personal-info_sex_block" class="form__section">
            <fieldset class="form__fieldset">
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
            <div class="form__description">
              Выберите из списка регион вашего проживания
            </div>
            <label class="select select_required">
              <select id="personal-info_locality_select" name="student.region" class="select__control" data-live-search="true">
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
                <label class="input">
                  <input id="personal-info_phone_number" class="input__control" type="text" required
                    placeholder="+7(__) ___-__-__" data-inputmask="'mask': '+\\7(99[9]) 999-99-99',
                    'numericInput': true" inputmode="text" name="student.phone_number">
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
              <input id="personal-info_email" class="input__control" required placeholder="Введите email" name="student.email"/>
              <span class="input__title">Email</span>
              <span id="validation_email_format_error" style="display: none" class="input__error">Адрес электронной почты должен содержать символ &quot;@&quot;</span>
            </label>
          </div>
          <div class="form__section">
            <div class="form__description">
              Укажите адрес электронной почты повторно
            </div>
            <label class="input">
              <input id="personal-info_email_duplicate" class="input__control" required placeholder="Введите email"/>
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
                  Компетенция и форма обучения
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
                  Место обучения
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

    (function() {
      this.ACTIVE_STEP = "step-check__item_active";
      this.DISABLED_STEP = "step-check__item_disabled";
      this.localities = [];
      this.educationCompetencies = [];

      this.submitForm = function(event) {
        if (!this.validateBirthday() || !this.validatePhoneNumber() || !this.validateEmails()) {
          return false;
        }
        var $form = $("form");
        $.ajax({
          type: $form.attr('method'),
          url: $form.attr('action'),
          contentType: 'application/json',
          data: JSON.stringify(this.getFormData($form)),
          success: function() {
            alert("success");
          },
          error: function(resp) {
            // пытаемся получить код ошибки из комментария.
            var code = resp.responseJSON.comment.match(/^\[\d{3}/)[0];
            if (!code) {
              // пытаемся получить код ошибки из комментария, если формат комментария был изменен.
              code = resp.responseJSON.comment.match(/\d{3}/)[0];
            } else {
             code = code.substr(1,3);
            }
            if (code && code >= 400 && code < 500) {
              $("#error_notification").show();
              setTimeout(function() { $("#error_notification").hide(); }, 5000);
            } else {
              alert("В программе уже существует заявка от пользователя c указанным СНИЛС. Если ранее вы не подавали заявку по данной программе на сайте express.worldskills.ru или trudvsem.ru, обратитесь в службу технической поддержки по адресу <a href='mailto:express@worldskills.ru'>express@worldskills.ru</a>");
            }
          }
        });

        event.preventDefault();
      }

      this.getFormData = function($form){
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

      this.handleCategoryChange = function() {
        this.setLocalities();
        this.moveToLocalityStep();
      }

      this.handleLocalityChange = function() {
        this.setEducationCompetencies();
        this.moveToEducationCompetenceStep();
      }

      this.handleEducationCompetenceChange = function() {
        this.updateEducationCompetenceNote();
        this.setEducationalOrganizations();
        this.moveToEducationalOrganizationStep();
      }

      this.handleDistanceLearningChange = function() {
        this.setEducationCompetencies();
        this.moveToEducationCompetenceStep();
      }

      this.handleEducationalOrganizationChange = function(obj) {
        this.setLifeLocalities();
        this.moveToPersonalInfoStep();
      }

      this.handleLifeLocalityChange = function() {
        this.setCitiesForRegion($("#personal-info_locality_select").val());
        this.moveToPersonalInfoStep();
      }

      this.moveToLocalityStep = function() {
        $("#category_step").removeClass(this.ACTIVE_STEP);
        $("#locality_step").removeClass(this.DISABLED_STEP).addClass(this.ACTIVE_STEP);
        $("#education-competence_step").removeClass(this.ACTIVE_STEP).addClass(this.DISABLED_STEP);
        $("#educational-organization_step").removeClass(this.ACTIVE_STEP).addClass(this.DISABLED_STEP);
        $("#personal-info_step").removeClass(this.ACTIVE_STEP).addClass(this.DISABLED_STEP);
        $("#send-request_step").removeClass(this.ACTIVE_STEP).addClass(this.DISABLED_STEP);
        $("#locality").show();
        $("#education-competence").hide();
        $("#education-competence_note").hide();
        $("#educational-organization").hide();
        $("#personal-info").hide();
        $("#send-request").hide();
      }

      this.moveToEducationCompetenceStep = function() {
        $("#locality_step").removeClass(this.ACTIVE_STEP);
        $("#education-competence_step").removeClass(this.DISABLED_STEP).addClass(this.ACTIVE_STEP);
        $("#educational-organization_step").removeClass(this.ACTIVE_STEP).addClass(this.DISABLED_STEP);
        $("#personal-info_step").removeClass(this.ACTIVE_STEP).addClass(this.DISABLED_STEP);
        $("#send-request_step").removeClass(this.ACTIVE_STEP).addClass(this.DISABLED_STEP);
        $("#education-competence").show();
        $("#education-competence_note").hide();
        $("#educational-organization").hide();
        $("#personal-info").hide();
        $("#send-request").hide();
      }

      this.moveToEducationalOrganizationStep = function() {
        $("#education-competence_step").removeClass(this.ACTIVE_STEP);
        $("#educational-organization_step").removeClass(this.DISABLED_STEP).addClass(this.ACTIVE_STEP);
        $("#personal-info_step").removeClass(this.ACTIVE_STEP).addClass(this.DISABLED_STEP);
        $("#send-request_step").removeClass(this.ACTIVE_STEP).addClass(this.DISABLED_STEP);
        $("#educational-organization").show();
        $("#personal-info").hide();
        $("#send-request").hide();
      }

      this.moveToPersonalInfoStep = function() {
        $("#educational-organization_step").removeClass(this.ACTIVE_STEP);
        $("#personal-info_step").removeClass(this.DISABLED_STEP).addClass(this.ACTIVE_STEP);
        $("#send-request_step").removeClass(this.ACTIVE_STEP).addClass(this.DISABLED_STEP);
        $("#personal-info").show();
        $("#send-request").hide();
      }

      this.moveToSendRequestStep = function() {
        $("#personal-info_step").removeClass(this.ACTIVE_STEP);
        $("#send-request_step").removeClass(this.DISABLED_STEP).addClass(this.ACTIVE_STEP);
        $("#send-request").show();
      }

      this.setLocalities = function() {
        if (this.localities && this.localities.length > 0) {
          $("#locality_select").prop("selectedIndex", -1);
          return;
        }
        this.loadLocalities();
      }

      this.setEducationCompetencies = function() {
        this.loadEducationCompetencies($("#locality_select").val(), $("#is_distance_learning").is(':checked'));
      }

      this.setEducationalOrganizations = function() {
        var regionId = $("#locality_select").val();
        var educationCompetenceId = $("#education-competence_select").val()
        var isDistanceLearning = $("#is_distance_learning").is(':checked')
        this.loadEducationalOrganizations(regionId, educationCompetenceId, isDistanceLearning);
      }

      this.setLifeLocalities = function() {
        this.addOptions($("#personal-info_locality_select"), this.localities);
      }

      this.setCitiesForRegion = function(regionId) {
        this.loadCities(regionId);
      }

      this.addOptions = function(targetEl, arr, additionalFieldName) {
        var obj = this;
        targetEl.empty();
        arr.forEach(function(el) {
          obj.addOptionEl(targetEl, el.name, el.id);
        });
        targetEl.prop("selectedIndex", -1);
      }

      this.addOptionEl = function(targetEl, name, value) {
        var option = document.createElement("option");
        option.setAttribute("value", value);
        option.innerText = name;
        targetEl.append(option);
      }

      this.addMultiOptionEl = function(targetEl, name, additionalData, value) {
        var option = document.createElement("option");
        option.setAttribute("value", value);
        option.setAttribute("data-content", "<div>" + name + "</div><span style='color: grey; font-size: smaller;'>" + additionalData + "</span>");
        targetEl.append(option);
      }

      this.updateEducationCompetenceNote = function() {
        var selectedItem = $("#education-competence_select").val();
        if (!selectedItem) {
          return;
        }

        var selectedCompetency = this.educationCompetencies.filter(function(el) { return el.id === selectedItem; })[0];
        $("#education-competence_note_title").text(selectedCompetency.name);
        $("#education-competence_note_description").text(selectedCompetency.description);
        $("#education-competence_note").show();
      }

      this.validatePhoneNumber = function() {
        if ($("#personal-info_phone_number").val().length !== 10) {
          $("#validation_phone_error").show();
          $("#personal-info_phone_number").parent().addClass("input_error");
          return false;
        }
        return true;
      }

      this.validateEmails = function() {
        var email = $("#personal-info_email").val();
        var emailDuplicate = $("#personal-info_email_duplicate").val();
        if (email && email.indexOf("@") === -1) {
          $("#personal-info_email").parent().addClass("input_error");
          $("#validation_email_format_error").show();
          return false;
        } else if (email && emailDuplicate && email !== emailDuplicate) {
          $("#validation_email_error").show();
          $("#personal-info_email").parent().addClass("input_error");
          $("#personal-info_email_duplicate").parent().addClass("input_error");
          return false;
        }
        return true;
      }

      this.validateBirthday = function() {
        if (!$("#personal-info_birthday").val() ||
          /^\d{2}.\d{2}.\d{4}$/.test($("#personal-info_birthday").val())) {
          return true;
        }
        $("#validation_birthday_error").show();
        $("#personal-info_birthday").parent().addClass("input_error");
        return false;
      }

      this.validate = function() {
        if ($("#personal-info_step").hasClass(this.ACTIVE_STEP) &&
            $("#personal-info_locality_select").val() &&
            $("#personal-info_city_select").val() &&
            $("#personal-info_phone_number").val() &&
            $("#personal-info_email").val() &&
            $("#personal-info_email_duplicate").val()) {
          this.moveToSendRequestStep();
        } else if ($("#send-request_step").hasClass(this.ACTIVE_STEP) &&
            (!$("#personal-info_locality_select").val() ||
            !$("#personal-info_city_select").val() ||
            !$("#personal-info_phone_number").val() ||
            !$("#personal-info_email").val() ||
            !$("#personal-info_email_duplicate").val())) {
          this.moveToPersonalInfoStep();
        }
        $("#validation_phone_error").hide();
        $("#personal-info_phone_number").parent().removeClass("input_error");
        $("#validation_email_error").hide();
        $("#validation_email_format_error").hide();
        $("#personal-info_email").parent().removeClass("input_error");
        $("#personal-info_email_duplicate").parent().removeClass("input_error");
        $("#validation_birthday_error").hide();
        $("#personal-info_birthday").parent().removeClass("input_error");
      }

      this.loadLocalities = function() {
        var obj = this;
        this.load("/iblocks/course/localities", function(resp) {
          obj.localities = resp.data;
          obj.addOptions($("#locality_select"), obj.localities);
        })
      }

      this.loadCities = function(regionId, callback) {
        var obj = this;
        this.load("/iblocks/course/cities?regionId=" + regionId, function (resp) {
          obj.addOptions($("#personal-info_city_select"), resp.data);
        })
      }

      this.loadEducationCompetencies = function(regionId, isDistanceLearning) {
        var obj = this;
        var url = "/iblocks/course/education-competence"
                  + "?regionId=" + regionId
                  + "&isDistanceLearning=" + isDistanceLearning;
        this.load(url, function(resp) {
          obj.educationCompetencies = resp.data
          obj.addOptions($("#education-competence_select"), obj.educationCompetencies);
        });
      }

      this.loadEducationalOrganizations = function(regionId, educationCompetenceId, isDistanceLearning) {
        var obj = this;
        var url = "/iblocks/course/educational-organizations"
            + "?regionId=" + regionId
            + "&educationCompetenceId=" + educationCompetenceId
            + "&isDistanceLearning=" + isDistanceLearning;
        this.load(url, function(resp) {
          if (resp.data.length > 0) {
              $("#educational-organization_select").prop("name", "provider");
              obj.addOptions($("#educational-organization_select"), resp.data, "address");
          } else {
              obj.loadRegOperator(regionId);
          }
        });
      }

      this.loadRegOperator = function(regionId) {
        var obj = this;
        var url = "/iblocks/course/reg-operator"
            + "?regionId=" + regionId;
        this.load(url, function(resp) {
          if (resp.data) {
            $("#educational-organization_select").prop("name", "reg_operator");
            obj.addOptions($("#educational-organization_select"), [].concat(resp.data));
          }
        });
      }

      this.load = function(url, callback, attempt = 1) {
        var objCallback = callback;
        var obj = this;
        if (attempt > 3) {
          return;
        }
        $.ajax({
          url: url,
          async: true,
          type: "GET",
          success: callback,
          error: function() {
            obj.load(url, callback, ++attempt);
          }
        });
      }

      $("#ws_request_form").on("change", this.validate.bind(this));
      $("#ws_request_form").on("submit", this.submitForm.bind(this));
      $("#category").on("change", this.handleCategoryChange.bind(this));
      $("#locality_select").on("change", this.handleLocalityChange.bind(this));
      $("#is_distance_learning").on("change", this.handleDistanceLearningChange.bind(this));
      $("#education-competence_select").on("change", this.handleEducationCompetenceChange.bind(this));
      $("#educational-organization_select").on("change", this.handleEducationalOrganizationChange.bind(this));
      $("#personal-info_locality_select").on("change", this.handleLifeLocalityChange.bind(this));
    })();

    (function setCandidateData() {
      try {
        var candidate = [[${candidate}]];
          $("#personal-info_email").val(candidate.email);
          $("#personal-info_email_duplicate").val(candidate.email);
          $("#personal-info_phone_number").val(candidate.phone);
        if (candidate.birthday) {
          var birthday = candidate.birthday;
          $("#personal-info_birthday").val(birthday);
          $("#personal-info_birthday_block").hide();
          $("#personal-info_birthday_text").text(birthday);
          $("#personal-info_birthday_text_block").show();
        }
        if (candidate.genderType) {
          var sex = candidate.genderType.toLowerCase();
          $("input:radio[name='student.sex']").filter("[value=" + sex + "]").prop('checked', true);
          $("#personal-info_sex_block").hide();
          $("#personal-info_sex_text").text(sex === "female" ? "Женский" : "Мужской");
          $("#personal-info_sex_text_block").show();
        }
      } catch (e) {
        console.log(e);
      }
    })();
  </script>
</div>
</body>
</html>
