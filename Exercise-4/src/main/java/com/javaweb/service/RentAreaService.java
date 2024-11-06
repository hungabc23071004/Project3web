package com.javaweb.service;

import java.util.List;

public interface RentAreaService {
    void deleteByBuildingIds(List<Long> ids);
}
