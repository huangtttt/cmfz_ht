package com.baizhi.service;

import com.baizhi.dao.AlbumDao;
import com.baizhi.entity.Album;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;


@Service
@Transactional
public class AlbumServiceImpl implements AlbumService {
    @Autowired
    private AlbumDao albumDao;



    @Override
    public List<Album> findAll() {
        return albumDao.queryAll();
    }

    @Override
    public void add(Album album) {
        album.setPublishDate(new Date());
        albumDao.insert(album);
    }

    @Override
    public Album findOne(String id) {
        Album album = albumDao.queryOne(id);
        return album;
    }

    @Override
    public void motify(String id) {
        albumDao.delete(id);
    }

    /*@Transactional(propagation = Propagation.SUPPORTS)
    public List<Album> findAllByPage(Integer page,Integer rows) {
        int start = (page-1)*rows;
        return albumDao.queryAllByPage(start,rows);
    }

    @Override
    public long findTotals() {
        return albumDao.queryTotals();
    }*/

}
