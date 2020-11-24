package com.example.demo;

import java.util.List;

import javax.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.example.demo.dto.Response;
import com.example.demo.dto.city.CityDTO;
import com.example.demo.dto.education.competence.EducationCompetenceDTO;
import com.example.demo.dto.education.organization.EducationalOrganizationDTO;
import com.example.demo.dto.locality.LocalityDTO;
import com.example.demo.dto.request.RequestDTO;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("iblocks/course")
@RequiredArgsConstructor
public class CourseRequestRestController {

    private final CourseRequestService courseRequestService;

    @PostMapping(value = "/request")
    private ResponseEntity<Response<Void>> request(@Valid @RequestBody RequestDTO requestDTO) {
        return Response.ok();
    }

    @GetMapping("/localities")
    private ResponseEntity<Response<List<LocalityDTO>>> getLocality() {
        return Response.ok(courseRequestService.getLocalities());
    }

    @GetMapping("/cities")
    private ResponseEntity<Response<List<CityDTO>>> getCities(@RequestParam(value = "regionId", required = false) String regionId) {
        return Response.ok(courseRequestService.getCities(regionId));
    }

    @GetMapping("/education-competence")
    private ResponseEntity<Response<List<EducationCompetenceDTO>>> getEducationCompetencies(@RequestParam(value = "regionId", required = false) String regionId) {
        return Response.ok(courseRequestService.getEducationCompetencies(regionId));
    }

    @GetMapping("/educational-organizations")
    private ResponseEntity<Response<List<EducationalOrganizationDTO>>> getEducationCompetencies(
            @RequestParam(value = "regionId", required = false) String regionId,
            @RequestParam(value = "educationCompetenceId", required = false) String educationCompetenceId,
            @RequestParam(value = "isDistanceLearning", required = false) Boolean isDistanceLearning) {
        return Response.ok(courseRequestService.getEducationalOrganizations(regionId, educationCompetenceId, isDistanceLearning));
    }
}
