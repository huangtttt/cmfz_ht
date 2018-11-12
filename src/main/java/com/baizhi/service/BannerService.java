package com.baizhi.service;

import com.baizhi.entity.Banner;

import java.util.List;

public interface BannerService {
    void add(Banner banner);
    void remove(String id);
    void motify(Banner banner);
    List<Banner> findAll();
    Banner findOne(String id);
}
