package com.example.demo;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.example.demo.dto.city.CityDTO;
import com.example.demo.dto.education.competence.EducationCompetenceDTO;
import com.example.demo.dto.education.organization.EducationalOrganizationDTO;
import com.example.demo.dto.locality.LocalityDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WorldSkillsRestClient {

    private static final String PROXY_WS_HOST = "http://172.18.108.145:8080/";

    private final RestTemplate restTemplate;

    public List<LocalityDTO> getLocalities() {
        return Arrays.asList(restTemplate.getForObject(PROXY_WS_HOST + "locality", LocalityDTO[].class));
    }

    public List<CityDTO> getCities(String regionId) {
        UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromUriString(PROXY_WS_HOST + "cities")
                .queryParam("regionId", regionId);
        return Arrays.asList(restTemplate.getForObject(uriBuilder.toUriString(), CityDTO[].class));
    }

    public List<EducationCompetenceDTO> getEducationCompetencies(String regionId) {
        UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromUriString(PROXY_WS_HOST + "education-competence")
                .queryParam("regionId", regionId);
        return Arrays.asList(restTemplate.getForObject(uriBuilder.toUriString(), EducationCompetenceDTO[].class));
    }

    public List<EducationalOrganizationDTO> getEducationalOrganizations(String regionId, String educationCompetenceId, Boolean isDistanceLearning) {
        UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromUriString(PROXY_WS_HOST + "educational-organizations")
                .queryParam("regionId", regionId)
                .queryParam("educationCompetenceId", educationCompetenceId)
                .queryParam("isDistanceLearning", isDistanceLearning);
        return Arrays.asList(restTemplate.getForObject(uriBuilder.toUriString(), EducationalOrganizationDTO[].class));
    }
}
