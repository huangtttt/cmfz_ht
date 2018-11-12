package com.baizhi.service;

import com.baizhi.entity.Chapter;

public interface ChapterService {
    void add(Chapter chapter);
    void remove(String id);
    void motify(Chapter chapter);
}
