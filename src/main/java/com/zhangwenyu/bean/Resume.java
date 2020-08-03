package com.zhangwenyu.bean;

public class Resume {
    private String studentId;

    private String resumeName;

    private String resumeUrl;

    private String createTime;

    private String backup;

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId == null ? null : studentId.trim();
    }

    public String getResumeName() {
        return resumeName;
    }

    public void setResumeName(String resumeName) {
        this.resumeName = resumeName == null ? null : resumeName.trim();
    }

    public String getResumeUrl() {
        return resumeUrl;
    }

    public void setResumeUrl(String resumeUrl) {
        this.resumeUrl = resumeUrl == null ? null : resumeUrl.trim();
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime == null ? null : createTime.trim();
    }

    public String getBackup() {
        return backup;
    }

    public void setBackup(String backup) {
        this.backup = backup == null ? null : backup.trim();
    }

    @Override
    public String toString() {
        return "Resume{" +
                "studentId='" + studentId + '\'' +
                ", resumeName='" + resumeName + '\'' +
                ", resumeUrl='" + resumeUrl + '\'' +
                ", createTime='" + createTime + '\'' +
                ", backup='" + backup + '\'' +
                '}';
    }
}