package com.project.civic.dto;

public class ComplaintDTO {

    private int id;
    private String userName;
    private String title;
    private String description;
    private String status;

    public ComplaintDTO() {}

    public ComplaintDTO(int id, String userName, String title, String description, String status) {
        this.id = id;
        this.userName = userName;
        this.title = title;
        this.description = description;
        this.status = status;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
