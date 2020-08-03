package com.zhangwenyu.bean;

public class PreachComment {
    private Integer commentId;

    private Integer preachId;

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

    public Integer getPreachId() {
        return preachId;
    }

    public void setPreachId(Integer preachId) {
        this.preachId = preachId;
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
        return "PreachComment{" +
                "commentId=" + commentId +
                ", preachId=" + preachId +
                ", sendId='" + sendId + '\'' +
                ", sendName='" + sendName + '\'' +
                ", commentText='" + commentText + '\'' +
                ", createTime='" + createTime + '\'' +
                '}';
    }
}