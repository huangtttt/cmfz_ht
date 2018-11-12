package com.baizhi.service;

import com.baizhi.entity.Album;

import java.util.List;

public interface AlbumService {

        List<Album> findAll();

        void add(Album album);

        Album findOne(String id);

        void motify(String id);
        /*List<Album> findAllByPage(Integer page,Integer rows);

        long findTotals();*/

}
