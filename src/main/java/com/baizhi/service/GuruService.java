package com.baizhi.service;

import com.baizhi.entity.Guru;

import java.util.List;

public interface GuruService {
    void add(Guru guru);
    void remove(String id);
    void motify(Guru guru);
    List<Guru> findAll();
    Guru findOne(String id);

}
