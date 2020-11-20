<!DOCTYPE HTML>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<html xmlns:th="http://www.thymeleaf.org">
<th:block xmlns:th="http://www.thymeleaf.org">
  <h1 class="content__title">
      Записаться на обучение
  </h1>
  <div class="row">
      <div class="main__aside-neighbour">
          <form method="POST" class="form form_descripted" onchange="validate()" onsubmit="submit()">
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
                              <input type="radio" name="category">
                              <span class="radio__label">Нахожусь под риском увольнения</span>
                          </label>
                          <label class="radio">
                              <input type="radio" name="category">
                              <span class="radio__label">Выпускник образовательной организации</span>
                          </label>
                          <label class="radio">
                              <input type="radio" name="category">
                              <span class="radio__label">Ищу работу</span>
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
                        <select id="education-competence_select" class="select__control" data-live-search="true">
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
                          <input id="is_distance_learning" type="checkbox" name="">
                          <span class="checkbox__label">Дистанционное обучение</span>
                        </label>
                  </div>
                  <div class="form__section">
                      <label class="select">
                          <select id="educational-organization_select" class="select__control" data-live-search="true">
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
                          <p th:text="${fio}">Фамилия Имя Отчество</p></dd>
                      </div>
                      <div class="definitions__item">
                          <dt class="definitions__key">СНИЛС:</dt>
                          <dd class="definitions__value">
                          <p th:text="${snils}">0001234000009</p></dd>
                      </div>
                  </dl>
                  <div class="form__section">
                      <div class="form__description">
                          Выберите из списка регион вашего проживания
                      </div>
                      <label class="select select_required">
                          <select id="personal-info_locality_select" class="select__control" data-live-search="true" onchange="handleLifeLocalityChange()">
                          </select>
                          <span class="select__title">Регион проживания</span>
                        </label>
                  </div>
                  <div class="form__section">
                      <label class="select select_required">
                          <select id="personal-info_city_select" class="select__control" data-live-search="true">
                          </select>
                          <span class="select__title">Город проживания</span>
                        </label>
                  </div>
                  <div class="form__section">
                      <div class="row">
                          <div class="col-lg-6">
                              <label class="input input_date">
                                  <input id="personal-info_birthday"class="input__control" type="text" placeholder="08.08.2020"/>
                                  <span class="input__title">Дата рождения:</span>
                              </label>
                          </div>
                      </div>
                  </div>
                  <div class="form__section">
                      <fieldset class="form__fieldset">
                          <legend class="form__title">Пол</legend>
                          <div class="row">
                              <div class="col-auto">
                                  <label class="radio">
                                      <input type="radio" name="gender">
                                      <span class="radio__label">Мужской</span>
                                  </label>
                              </div>
                              <div class="col-auto">
                                  <label class="radio">
                                      <input type="radio" checked name="gender">
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
                                  <input id="personal-info_phone_number" class="input__control" type="text" required placeholder="+7(__) ___-__-__" data-inputmask="'mask': '+\\7(99[9]) 999-99-99', 'numericInput': true" inputmode="text">
                                  <span class="input__title">Телефон</span>
                              </label>
                          </div>
                      </div>
                  </div>
                  <div class="form__section">
                      <div class="form__description">
                          Укажите адрес вашей электронной почты для получения уведомлений об изменении статуса заявки на обучение
                      </div>
                      <label class="input input_error">
                          <input id="personal-info_email" class="input__control" required type="email"  placeholder="Введите email"/>
                          <span class="input__title">Email</span>
                          <span class="input__error">Введите корректное значение</span>
                      </label>
                  </div>
                  <div class="form__section">
                      <div class="form__description">
                          Укажите адрес электронной почты повторно
                      </div>
                      <label class="input">
                          <input id="personal-info_email_duplicate" class="input__control" required type="email"  placeholder="Введите email"/>
                          <span class="input__title">Подтверждение email</span>
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
</th:block>
</html>
<script>
    var ACTIVE_STEP = "step-check__item_active";
    var DISABLED_STEP = "step-check__item_disabled";
    var localities;
    var educationCompetencies;
    var educationalOrganizations;
    var cities;
    var personalInfo;

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

    function submit() {
        debugger;
        if ($("#personal-info_email").val() !== $("#personal-info_email_duplicate").val()) {
            alert("error");
        }
        this.event.preventDefault();
        return false;
    }

    function setLocalities() {
        if (!!localities) {
            $("#locality_select").prop("selectedIndex", -1);
            return;
        }
         loadLocalities();


        addOptions($("#locality_select"), localities);
    }

    function setEducationCompetencies() {
         loadEducationCompetencies($("#locality_select").val());


        addOptions($("#education-competence_select"), educationCompetencies);
    }

    function setEducationalOrganizations() {
         var regionId = $("#locality_select").val();
         var educationCompetenceId = $("#education-competence_select").val()
         var isDistanceLearning = $("#is_distance_learning").is(':checked')
         loadEducationalOrganizations(regionId, educationCompetenceId, isDistanceLearning);


        addOptions($("#educational-organization_select"), educationalOrganizations);
    }

    function setLifeLocalities() {
        addOptions($("#personal-info_locality_select"), localities);
    }

    function setCitiesForRegion(regionId) {
         loadCities(regionId);

        addOptions($("#personal-info_city_select"), cities);
    }

    function addOptions(targetEl, arr) {
        targetEl.empty();
        arr.forEach(function(el) {
            addOptionEl(targetEl, el.name, el.id);
        });
        targetEl.prop("selectedIndex", -1);
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
    }

    function loadLocalities() {
        var url = "//" + window.location.host + "/iblocks/course/localities";
        $.ajax({
            url: url,
            async: false,
            type: "GET",
            success: function(data){
              localities = data;
            }
        });
    }

    function loadCities(regionId) {
        var url = "//" + window.location.host + "/iblocks/course/cities?region_id=" + regionId;
        $.ajax({
            url: url,
            async: false,
            type: "GET",
            success: function(data){
              cities = data;
            }
        });
    }

    function loadEducationCompetencies(regionId) {
        var url = "//" + window.location.host + "/iblocks/course/education-competence?region_id=" + regionId;
        $.ajax({
            url: url,
            async: false,
            type: "GET",
            success: function(data){
              educationCompetencies = data;
            }
        });
    }

    function loadEducationalOrganizations(regionId, educationCompetenceId, isDistanceLearning) {
        var url = "//" + window.location.host + "/iblocks/course/educational-organizations"
            + "?regionId=" + regionId
            + "&education_competence_id=" + educationCompetenceId
            + "&is_distance_learning=" + isDistanceLearning;
        $.ajax({
            url: url,
            async: false,
            type: "GET",
            success: function(data){
              educationalOrganizations = data;
            }
        });
    }
</script>