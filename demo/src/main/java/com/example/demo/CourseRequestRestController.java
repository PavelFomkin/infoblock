package com.example.demo;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("iblocks/course")
@RequiredArgsConstructor
public class CourseRequestRestController {

    private final CourseRequestService courseRequestService;

    @PostMapping("/request")
    private ResponseEntity<String> request() {
        return ResponseEntity.ok("{\"ok\": \"ok\"}");
    }

    @GetMapping("/localities")
    private ResponseEntity getLocality() {
        return ResponseEntity.ok(courseRequestService.getLocalities());
    }

    @GetMapping("/cities")
    private ResponseEntity getCities(@RequestParam(value = "region_id", required = false) String regionId) {
        return ResponseEntity.ok(courseRequestService.getCities(regionId));
    }

    @GetMapping("/education-competence")
    private ResponseEntity getEducationCompetencies(@RequestParam(value = "region_id", required = false) String regionId) {
        return ResponseEntity.ok(courseRequestService.getEducationCompetencies(regionId));
    }

    @GetMapping("/educational-organizations")
    private ResponseEntity getEducationCompetencies(
            @RequestParam(value = "region_id", required = false) String regionId,
            @RequestParam(value = "education_competence_id", required = false) String educationCompetenceId,
            @RequestParam(value = "is_distance_learning", required = false) Boolean isDistanceLearning) {
        return ResponseEntity.ok(courseRequestService.getEducationalOrganizations(regionId, educationCompetenceId, isDistanceLearning));
    }
}
