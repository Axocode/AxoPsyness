/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.axocode.dao;

import java.io.Serializable;

/**
 *
 * @author chump
 */
public class InterImages implements Serializable{
    private int ImagesNum;
    private int ImagesPubNumId;
    private byte[] Images;
    private String ImageName;

    public InterImages(int ImagesNum, int ImagesPubNumId, byte[] Images, String ImageName) {
        this.ImagesNum = ImagesNum;
        this.ImagesPubNumId = ImagesPubNumId;
        this.Images = Images;
        this.ImageName = ImageName;
    }

    public InterImages() {
    }
    
    public int getImagesNum() {
        return ImagesNum;
    }

    public void setImagesNum(int ImagesNum) {
        this.ImagesNum = ImagesNum;
    }

    public int getImagesPubNumId() {
        return ImagesPubNumId;
    }

    public void setImagesPubNumId(int ImagesPubNumId) {
        this.ImagesPubNumId = ImagesPubNumId;
    }

    public byte[] getImages() {
        return Images;
    }

    public void setImages(byte[] Images) {
        this.Images = Images;
    }

    public String getImageName() {
        return ImageName;
    }

    public void setImageName(String ImageName) {
        this.ImageName = ImageName;
    }
    
    
}
