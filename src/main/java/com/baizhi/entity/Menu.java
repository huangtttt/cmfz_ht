package com.baizhi.entity;

import java.util.ArrayList;
import java.util.List;

public class Menu {
    private String id;
    private String name;
    private String icon;
    private String href;
    private String f_id;
    private List<Menu> children=new ArrayList<Menu>();

    public Menu() {
    }

    @Override
    public String toString() {
        return "Menu{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", icon='" + icon + '\'' +
                ", href='" + href + '\'' +
                ", f_id='" + f_id + '\'' +
                ", children=" + children +
                '}';
    }

    public Menu(String id, String name, String icon, String href, String f_id, List<Menu> children) {
        this.id = id;
        this.name = name;
        this.icon = icon;
        this.href = href;
        this.f_id = f_id;
        this.children = children;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getF_id() {
        return f_id;
    }

    public void setF_id(String f_id) {
        this.f_id = f_id;
    }

    public List<Menu> getChildren() {
        return children;
    }

    public void setChildren(List<Menu> children) {
        this.children = children;
    }
}
