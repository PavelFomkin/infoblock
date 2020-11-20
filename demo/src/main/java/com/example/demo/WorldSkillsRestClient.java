package com.example.demo;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.example.demo.dto.city.City;
import com.example.demo.dto.education.competence.EducationCompetence;
import com.example.demo.dto.education.organization.EducationalOrganization;
import com.example.demo.dto.locality.Locality;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WorldSkillsRestClient {

    private static final String PROXY_WS_HOST = "http://172.18.108.145:8080/";

    private final RestTemplate restTemplate;

    public List<Locality> getLocalities() {
        return Arrays.asList(restTemplate.getForObject(PROXY_WS_HOST + "locality", Locality[].class));
    }

    public List<City> getCities(String regionId) {
        UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromUriString(PROXY_WS_HOST + "cities")
                .queryParam("region_id", regionId);
        return Arrays.asList(restTemplate.getForObject(uriBuilder.toUriString(), City[].class));
    }

    public List<EducationCompetence> getEducationCompetencies(String regionId) {
        UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromUriString(PROXY_WS_HOST + "education-competence")
                .queryParam("region_id", regionId);
        return Arrays.asList(restTemplate.getForObject(uriBuilder.toUriString(), EducationCompetence[].class));
    }

    public List<EducationalOrganization> getEducationalOrganizations(String regionId, String educationCompetenceId, Boolean isDistanceLearning) {
        UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromUriString(PROXY_WS_HOST + "educational-organizations")
                .queryParam("region_id", regionId)
                .queryParam("education_competence_id", educationCompetenceId)
                .queryParam("is_distance_learning", isDistanceLearning);
        return Arrays.asList(restTemplate.getForObject(uriBuilder.toUriString(), EducationalOrganization[].class));
    }
}
