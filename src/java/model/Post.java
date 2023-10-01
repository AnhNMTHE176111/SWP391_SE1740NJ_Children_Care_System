/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Post {
    private int PostId;
    private String title, content, createdAt, Avatar;
    private int Viewer, Rate;

    public Post() {
    }

    public Post(int PostId, String title, String content, String createdAt, String Avatar, int Viewer, int Rate) {
        this.PostId = PostId;
        this.title = title;
        this.content = content;
        this.createdAt = createdAt;
        this.Avatar = Avatar;
        this.Viewer = Viewer;
        this.Rate = Rate;
    }



    public int getPostId() {
        return PostId;
    }

    public void setPostId(int PostId) {
        this.PostId = PostId;
    }

    public int getViewer() {
        return Viewer;
    }

    public void setViewer(int Viewer) {
        this.Viewer = Viewer;
    }

    public int getRate() {
        return Rate;
    }

    public void setRate(int Rate) {
        this.Rate = Rate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getAvatar() {
        return Avatar;
    }

    public void setAvatar(String Avatar) {
        this.Avatar = Avatar;
    }
    
    
}

