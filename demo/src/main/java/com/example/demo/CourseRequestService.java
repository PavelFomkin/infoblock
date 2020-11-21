package com.example.demo;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dto.city.CityDTO;
import com.example.demo.dto.education.competence.EducationCompetenceDTO;
import com.example.demo.dto.education.organization.EducationalOrganizationDTO;
import com.example.demo.dto.locality.LocalityDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CourseRequestService {

    private final WorldSkillsRestClient worldSkillsRestClient;

    public List<LocalityDTO> getLocalities() {
        return worldSkillsRestClient.getLocalities();
    }

    public List<CityDTO> getCities(String regionId) {
        return worldSkillsRestClient.getCities(regionId);
    }

    public List<EducationCompetenceDTO> getEducationCompetencies(String regionId) {
        return worldSkillsRestClient.getEducationCompetencies(regionId);
    }

    public List<EducationalOrganizationDTO> getEducationalOrganizations(String regionId, String educationCompetenceId, Boolean isDistanceLearning) {
        return worldSkillsRestClient.getEducationalOrganizations(regionId, educationCompetenceId, isDistanceLearning);
    }
}
