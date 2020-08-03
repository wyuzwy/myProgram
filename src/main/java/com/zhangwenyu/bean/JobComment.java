package com.zhangwenyu.bean;

public class JobComment {
    private Integer commentId;

    private Integer jobId;

    private String sendId;

    private String sendName;

    private String commentText;

    private String createTime;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }

    public String getSendId() {
        return sendId;
    }

    public void setSendId(String sendId) {
        this.sendId = sendId == null ? null : sendId.trim();
    }

    public String getSendName() {
        return sendName;
    }

    public void setSendName(String sendName) {
        this.sendName = sendName == null ? null : sendName.trim();
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText == null ? null : commentText.trim();
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime == null ? null : createTime.trim();
    }

    @Override
    public String toString() {
        return "JobComment{" +
                "commentId=" + commentId +
                ", jobId=" + jobId +
                ", sendId='" + sendId + '\'' +
                ", sendName='" + sendName + '\'' +
                ", commentText='" + commentText + '\'' +
                ", createTime='" + createTime + '\'' +
                '}';
    }
}