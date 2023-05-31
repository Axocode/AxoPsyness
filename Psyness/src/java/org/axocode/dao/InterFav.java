package org.axocode.dao;

import java.io.Serializable;

public class InterFav implements Serializable{
    private Integer FavIdPub;
    private Integer FavIdUser;

    public Integer getFavIdPub() {
        return FavIdPub;
    }

    public void setFavIdPub(Integer FavIdPub) {
        this.FavIdPub = FavIdPub;
    }

    public Integer getFavIdUser() {
        return FavIdUser;
    }

    public void setFavIdUser(Integer FavIdUser) {
        this.FavIdUser = FavIdUser;
    }
}
