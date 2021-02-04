package com.example.demo;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.example.demo.dto.city.CityDTO;
import com.example.demo.dto.education.competence.EducationCompetenceDTO;
import com.example.demo.dto.education.organization.EducationalOrganizationDTO;
import com.example.demo.dto.education.organization.RegOperatorDTO;
import com.example.demo.dto.locality.LocalityDTO;
import com.example.demo.dto.request.StudentEnrollmentRequestDTO;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class WorldSkillsProxyRestClient {

    private static final String EDUCATIONAL_ORGANIZATIONS = "educational-organizations";
    private static final String EDUCATION_COMPETENCE = "education-competence";
    private static final String LOCALITY = "locality";
    private static final String CITIES = "cities";
    private static final String REG_OPERATOR = "reg-operator";
    private static final String STUDENT_ENROLMENT = "student-enrollment";

    private static final String EDUCATION_COMPETENCE_ID = "educationCompetenceId";
    private static final String IS_DISTANCE_LEARNING = "isDistanceLearning";
    private static final String REGION_ID = "regionId";
    private static final String PROXY_WS_HOST = "http://172.18.108.145:8080/";

    private final RestTemplate restTemplate;

    public List<LocalityDTO> getLocalities() {
        return Arrays.asList(restTemplate.getForObject(PROXY_WS_HOST + LOCALITY, LocalityDTO[].class));
    }

    public List<CityDTO> getCities(String regionId) {
        UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromUriString(PROXY_WS_HOST + CITIES)
                .queryParam(REGION_ID, regionId);
        return Arrays.asList(restTemplate.getForObject(uriBuilder.toUriString(), CityDTO[].class));
    }

    public List<EducationCompetenceDTO> getEducationCompetencies(String regionId, Boolean isDistanceLearning) {
        UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromUriString(PROXY_WS_HOST + EDUCATION_COMPETENCE)
                .queryParam(REGION_ID, regionId)
                .queryParam(IS_DISTANCE_LEARNING, isDistanceLearning);
        return Arrays.asList(restTemplate.getForObject(uriBuilder.toUriString(), EducationCompetenceDTO[].class));
    }

    public List<EducationalOrganizationDTO> getEducationalOrganizations(String regionId, String educationCompetenceId, Boolean isDistanceLearning) {
        UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromUriString(PROXY_WS_HOST + EDUCATIONAL_ORGANIZATIONS)
                .queryParam(REGION_ID, regionId)
                .queryParam(EDUCATION_COMPETENCE_ID, educationCompetenceId)
                .queryParam(IS_DISTANCE_LEARNING, isDistanceLearning);
        return Arrays.asList(restTemplate.getForObject(uriBuilder.toUriString(), EducationalOrganizationDTO[].class));
    }

    public RegOperatorDTO getRegOperator(String regionId) {
        UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromUriString(PROXY_WS_HOST + REG_OPERATOR)
                .queryParam(REGION_ID, regionId);
        return restTemplate.getForObject(uriBuilder.toUriString(), RegOperatorDTO.class);
    }

    public StudentEnrollmentRequestDTO sendTrainingRequest(StudentEnrollmentRequestDTO studentEnrollmentRequestDTO) {
        return restTemplate.postForObject(PROXY_WS_HOST + STUDENT_ENROLMENT, studentEnrollmentRequestDTO, StudentEnrollmentRequestDTO.class);
    }
}
