package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.javaweb.enums.DistrictCode;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper;
    public BuildingSearchResponse  buildingConvertor(BuildingEntity buildingEntity) {
        BuildingSearchResponse buildingSearchResponse = modelMapper.map(buildingEntity, BuildingSearchResponse.class);
        buildingSearchResponse.setAddress(buildingEntity.getStreet()+", "+buildingEntity.getWard()+", "+ DistrictCode.valueOf(buildingEntity.getDistrict()).getDistrictName() );
        buildingSearchResponse.setRentArea(buildingEntity.getRentAreaItems().stream().map(it ->it.getValue().toString()).collect(Collectors.joining(", ")));
        return buildingSearchResponse;
    }

    public BuildingEntity dtoToEntity(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
        buildingEntity.setType(buildingDTO.getTypeCode().stream().collect(Collectors.joining(",")));
        String[] rentAreaStringList = buildingDTO.getRentArea().split(",");
        List<RentAreaEntity> rentAreaEntityList = new ArrayList<>();
        for(String rentAreaString : rentAreaStringList) {
            RentAreaEntity rentAreaEntity = new RentAreaEntity();
            rentAreaEntity.setValue(Integer.parseInt(rentAreaString));
            rentAreaEntity.setBuilding(buildingEntity);
            rentAreaEntityList.add(rentAreaEntity);
        }
        buildingEntity.setRentAreaItems(rentAreaEntityList);
        return buildingEntity;
    }

}
