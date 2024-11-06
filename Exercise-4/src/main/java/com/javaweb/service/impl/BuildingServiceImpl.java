package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.AssignmentBuildingService;
import com.javaweb.service.BuildingService;
import com.javaweb.service.RentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class BuildingServiceImpl implements BuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BuildingConverter buildingConverter;
    @Autowired
    private RentAreaRepository rentAreaRepository;
    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;
    @Autowired
    private AssignmentBuildingService assignmentBuildingService;
    @Autowired
    private RentAreaService rentAreaService;
    @Override
    public ResponseDTO listStaffs(Long buildingId) {
       BuildingEntity buildingEntity = buildingRepository.findById(buildingId).get();
       List<UserEntity> stafss= userRepository.findByStatusAndRoles_Code(1,"STAFF");
       List<UserEntity> staffAssigment =userRepository.findByBuildingId(buildingId);
       List<StaffResponseDTO> staffResponseDTOList = new ArrayList<>();
       ResponseDTO responseDTO = new ResponseDTO();
       for(UserEntity it : stafss){
           StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
           staffResponseDTO.setFullName(it.getFullName());
           staffResponseDTO.setStaffId(it.getId());
           if(staffAssigment.contains(it)){
               staffResponseDTO.setChecked("checked");
           }
           else {
               staffResponseDTO.setChecked("");
           }
           staffResponseDTOList.add(staffResponseDTO);
       }
       responseDTO.setData(staffResponseDTOList);
       responseDTO.setMessage("success");
       return responseDTO;
    }

    @Override
    public List<BuildingSearchResponse> findBuildings(BuildingSearchRequest buildingSearchRequest) {
       List<BuildingEntity> buildingEntityList = buildingRepository.findBuilding(buildingSearchRequest);
       List<BuildingSearchResponse> buildingSearchResponseList = new ArrayList<>();
       for (BuildingEntity buildingEntity : buildingEntityList) {
           BuildingSearchResponse buildingSearchResponse = buildingConverter.buildingConvertor(buildingEntity);
           buildingSearchResponseList.add(buildingSearchResponse);
       }
       return buildingSearchResponseList;
    }

    @Override
    public void addAndUpdateBuilding(BuildingDTO buildingDTO) {
        if(buildingDTO.getId() != null && !buildingDTO.getId().toString().equals("") ){
            BuildingEntity buildingEntity = buildingRepository.findById(buildingDTO.getId()).get();
            for(RentAreaEntity rentAreaEntity : buildingEntity.getRentAreaItems()){
                rentAreaRepository.deleteById(rentAreaEntity.getId());
            }
        }
        BuildingEntity buildingEntity = buildingConverter.dtoToEntity(buildingDTO);
        buildingRepository.save(buildingEntity);
        for(RentAreaEntity rentAreaEntity : buildingEntity.getRentAreaItems()){
            rentAreaRepository.save(rentAreaEntity);
        }
    }

    @Override
    public void deleteBuilding(List<Long> ids) {

          assignmentBuildingService.deleteByBuildingIds(ids);
          rentAreaService.deleteByBuildingIds(ids);
          for(Long id:ids){
              buildingRepository.deleteById(id);
          }

    }
}
