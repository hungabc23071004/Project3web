package com.javaweb.service;

import java.util.List;

public interface AssignmentBuildingService {
    void deleteByBuildingIds(List<Long> ids);
    void assignmentBuilding(Long buildingId, List<Long> staffIds);
}
