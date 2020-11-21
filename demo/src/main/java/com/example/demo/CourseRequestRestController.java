package com.example.demo;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.example.demo.dto.request.RequestDTO;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("iblocks/course")
@RequiredArgsConstructor
public class CourseRequestRestController {

    private final CourseRequestService courseRequestService;

    @PostMapping(value="/request")
    private ResponseEntity<String> request(@RequestBody RequestDTO requestDTO) {
        return ResponseEntity.ok("{\"ok\": \"ok\"}");
    }

    @GetMapping("/localities")
    private ResponseEntity getLocality() {
        return ResponseEntity.ok(courseRequestService.getLocalities());
    }

    @GetMapping("/cities")
    private ResponseEntity getCities(@RequestParam(value = "regionId", required = false) String regionId) {
        return ResponseEntity.ok(courseRequestService.getCities(regionId));
    }

    @GetMapping("/education-competence")
    private ResponseEntity getEducationCompetencies(@RequestParam(value = "regionId", required = false) String regionId) {
        return ResponseEntity.ok(courseRequestService.getEducationCompetencies(regionId));
    }

    @GetMapping("/educational-organizations")
    private ResponseEntity getEducationCompetencies(
            @RequestParam(value = "regionId", required = false) String regionId,
            @RequestParam(value = "educationCompetenceId", required = false) String educationCompetenceId,
            @RequestParam(value = "isDistanceLearning", required = false) Boolean isDistanceLearning) {
        return ResponseEntity.ok(courseRequestService.getEducationalOrganizations(regionId, educationCompetenceId, isDistanceLearning));
    }
}
