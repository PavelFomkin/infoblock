package com.example.demo;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.dto.city.City;
import com.example.demo.dto.education.competence.EducationCompetence;
import com.example.demo.dto.education.organization.EducationalOrganization;
import com.example.demo.dto.locality.Locality;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CourseRequestService {

    private final WorldSkillsRestClient worldSkillsRestClient;

    public List<Locality> getLocalities() {
        return worldSkillsRestClient.getLocalities();
    }

    public List<City> getCities(String regionId) {
        return worldSkillsRestClient.getCities(regionId);
    }

    public List<EducationCompetence> getEducationCompetencies(String regionId) {
        return worldSkillsRestClient.getEducationCompetencies(regionId);
    }

    public List<EducationalOrganization> getEducationalOrganizations(String regionId, String educationCompetenceId, Boolean isDistanceLearning) {
        return worldSkillsRestClient.getEducationalOrganizations(regionId, educationCompetenceId, isDistanceLearning);
    }
}
