package com.javaweb.service.impl;

import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.service.AssignmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AssignmentBuildingServiceImpl implements AssignmentBuildingService {
    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;
    @Autowired
    private BuildingRepository buildingRepository;
    @Override
    public void deleteByBuildingIds(List<Long> ids) {
        for(Long id:ids){
            BuildingEntity buildingEntity= buildingRepository.findById(id).get();
            for(AssignmentBuildingEntity assignmentBuildingEntity :buildingEntity.getAssignmentBuildingItems()){
                assignmentBuildingRepository.deleteById(assignmentBuildingEntity.getId());
            }
        }
    }
}
