package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.RentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RentAreaServiceImpl implements RentAreaService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private RentAreaRepository rentAreaRepository;
    @Override
    public void deleteByBuildingIds(List<Long> ids) {
        for(Long id:ids){
            BuildingEntity buildingEntity= buildingRepository.findById(id).get();
            for(RentAreaEntity rentAreaEntity : buildingEntity.getRentAreaItems()) {
                rentAreaRepository.deleteById(rentAreaEntity.getId());
            };
        }
    }
}
