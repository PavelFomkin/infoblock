package com.example.demo;

import java.util.List;

import javax.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.HttpClientErrorException;

import com.example.demo.dto.Response;
import com.example.demo.dto.city.CityDTO;
import com.example.demo.dto.education.competence.EducationCompetenceDTO;
import com.example.demo.dto.education.organization.EducationalOrganizationDTO;
import com.example.demo.dto.education.organization.RegOperatorDTO;
import com.example.demo.dto.locality.LocalityDTO;
import com.example.demo.dto.request.StudentEnrollmentRequestDTO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class CourseRequestRestController2 {

    private final CourseRequestService courseRequestService;

    @PostMapping("/request")
    private ResponseEntity<Response<StudentEnrollmentRequestDTO>> request(@Valid @RequestBody StudentEnrollmentRequestDTO studentEnrollmentRequestDTO) {
        return Response.ok(courseRequestService.sendTrainingRequest(studentEnrollmentRequestDTO));
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
    private ResponseEntity<Response<List<EducationCompetenceDTO>>> getEducationCompetencies(
            @RequestParam(value = "regionId", required = false) String regionId,
            @RequestParam(value = "isDistanceLearning", required = false) Boolean isDistanceLearning) {
        return Response.ok(courseRequestService.getEducationCompetencies(regionId, isDistanceLearning));
    }

    @GetMapping("/educational-organizations")
    private ResponseEntity<Response<List<EducationalOrganizationDTO>>> getEducationCompetencies(
            @RequestParam(value = "regionId", required = false) String regionId,
            @RequestParam(value = "educationCompetenceId", required = false) String educationCompetenceId,
            @RequestParam(value = "isDistanceLearning", required = false) Boolean isDistanceLearning) {
        return Response.ok(courseRequestService.getEducationalOrganizations(regionId, educationCompetenceId, isDistanceLearning));
    }

    @GetMapping("/reg-operator")
    private ResponseEntity<Response<RegOperatorDTO>> getRegOperator(
            @RequestParam(value = "regionId", required = false) String regionId) {
        return Response.ok(courseRequestService.getRegOperator(regionId));
    }

//    @ExceptionHandler(HttpClientErrorException.class)
    //    public ResponseEntity<Response<Void>> internal(HttpClientErrorException e) {
    //        HttpStatus httpStatus;
    //        try {
    //            httpStatus = HttpStatus.valueOf(String.valueOf(e.getStatusCode().name()));
    //        } catch (IllegalArgumentException exception) {
    //            httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
    //        }
    //        return serverError(httpStatus, "[" + e.getStatusCode() + "] " + e.getMessage());
    //    }
    //
    //    @Override
    //    public boolean hasError(ClientHttpResponse clientHttpResponse) throws IOException {
    //        return !clientHttpResponse.getStatusCode().is2xxSuccessful();
    //    }
    //
    //    @Override
    //    public void handleError(ClientHttpResponse clientHttpResponse) throws IOException {
    //        Response.error(ResponseStatus.SERVER_ERROR, clientHttpResponse.getStatusCode(), "[" + clientHttpResponse.getStatusCode().value() + "] " + clientHttpResponse.getStatusText());
    //    }
}
