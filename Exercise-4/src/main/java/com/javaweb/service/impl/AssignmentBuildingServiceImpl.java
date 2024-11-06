package com.javaweb.service.impl;

import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.AssignmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AssignmentBuildingServiceImpl implements AssignmentBuildingService {
    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;

    @Override
    public void deleteByBuildingIds(List<Long> ids) {
        for(Long id:ids){
            BuildingEntity buildingEntity= buildingRepository.findById(id).get();
            for(AssignmentBuildingEntity assignmentBuildingEntity :buildingEntity.getAssignmentBuildingItems()){
                assignmentBuildingRepository.deleteById(assignmentBuildingEntity.getId());
            }
        }
    }

    @Override
    public void assignmentBuilding(Long buildingId, List<Long> staffIds) {
        assignmentBuildingRepository.deleteByBuildingId(buildingId);
        BuildingEntity buildingEntity= buildingRepository.findById(buildingId).get();
        if(staffIds.size()>0 && staffIds!=null){
            for(Long staffId:staffIds){
                AssignmentBuildingEntity assignmentBuildingEntity = new AssignmentBuildingEntity();
                assignmentBuildingEntity.setBuilding(buildingEntity);
                UserEntity userEntity = userRepository.findById(staffId).get();
                assignmentBuildingEntity.setStaffs(userEntity);
                assignmentBuildingRepository.save(assignmentBuildingEntity);
            }
        }
    }
}
