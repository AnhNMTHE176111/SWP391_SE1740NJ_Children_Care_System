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
    private String PostId;
    private String title, content, createdAt, Avatar;
    private String Viewer, Rate;

    public Post() {
    }

    public Post(String PostId, String title, String content, String createdAt, String Avatar, String Viewer, String Rate) {
        this.PostId = PostId;
        this.title = title;
        this.content = content;
        this.createdAt = createdAt;
        this.Avatar = Avatar;
        this.Viewer = Viewer;
        this.Rate = Rate;
    }

    public String getPostId() {
        return PostId;
    }

    public void setPostId(String PostId) {
        this.PostId = PostId;
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

    public String getViewer() {
        return Viewer;
    }

    public void setViewer(String Viewer) {
        this.Viewer = Viewer;
    }

    public String getRate() {
        return Rate;
    }

    public void setRate(String Rate) {
        this.Rate = Rate;
    }

    @Override
    public String toString() {
        return "Post{" + "PostId=" + PostId + ", title=" + title + ", content=" + content + ", createdAt=" + createdAt + ", Avatar=" + Avatar + ", Viewer=" + Viewer + ", Rate=" + Rate + '}';
    }

}

