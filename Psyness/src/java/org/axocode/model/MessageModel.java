package org.axocode.model;

public class MessageModel {
    
    private String touser;
    private String tonom;
    private String content;
    private String username;
    private String usernom;

    public MessageModel(String touser, String tonom, String content, String username, String usernom) {
        this.touser = touser;
        this.tonom = tonom;
        this.content = content;
        this.username = username;
        this.usernom = usernom;
    }

    @Override
    public String toString() {
        return "MessageModel{" + "touser=" + touser + ", tonom=" + tonom + ", content=" + content + ", username=" + username + ", usernom=" + usernom + '}';
    }

    public String getTouser() {
        return touser;
    }

    public void setTouser(String touser) {
        this.touser = touser;
    }

    public String getTonom() {
        return tonom;
    }

    public void setTonom(String tonom) {
        this.tonom = tonom;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsernom() {
        return usernom;
    }

    public void setUsernom(String usernom) {
        this.usernom = usernom;
    }

}
