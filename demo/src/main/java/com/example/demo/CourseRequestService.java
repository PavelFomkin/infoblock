package com.example.demo;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dto.city.CityDTO;
import com.example.demo.dto.education.competence.EducationCompetenceDTO;
import com.example.demo.dto.education.organization.EducationalOrganizationDTO;
import com.example.demo.dto.education.organization.RegOperatorDTO;
import com.example.demo.dto.locality.LocalityDTO;
import com.example.demo.dto.request.StudentEnrollmentRequestDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CourseRequestService {

    private final WorldSkillsProxyRestClient restClient;

    public List<LocalityDTO> getLocalities() {
        return restClient.getLocalities();
    }

    public List<CityDTO> getCities(String regionId) {
        return restClient.getCities(regionId);
    }

    public List<EducationCompetenceDTO> getEducationCompetencies(String regionId, Boolean isDistanceLearning) {
        return restClient.getEducationCompetencies(regionId, isDistanceLearning);
    }

    public List<EducationalOrganizationDTO> getEducationalOrganizations(String regionId, String educationCompetenceId, Boolean isDistanceLearning) {
        return restClient.getEducationalOrganizations(regionId, educationCompetenceId, isDistanceLearning);
    }

    public RegOperatorDTO getRegOperator(String regionId) {
        return restClient.getRegOperator(regionId);
    }

    public void sendRequest(StudentEnrollmentRequestDTO studentEnrollmentRequestDTO) {
        restClient.sendTrainingRequest(studentEnrollmentRequestDTO);
    }

    public StudentEnrollmentRequestDTO sendTrainingRequest(StudentEnrollmentRequestDTO studentEnrollmentRequestDTO) {
        return restClient.sendTrainingRequest(studentEnrollmentRequestDTO);
    }
}
