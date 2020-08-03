package com.zhangwenyu.bean;

public class Preach {
    private Integer preachId;

    private String companyId;

    private String companyName;

    private String sendId;

    private String snedName;

    private String school;

    private String address;

    private String introduction;

    private String content;

    private String creatTime;

    private String startTime;

    private String endTime;

    private Integer status;

    private Integer click;

    private String remark;

    private String backup;

    public Integer getPreachId() {
        return preachId;
    }

    public void setPreachId(Integer preachId) {
        this.preachId = preachId;
    }

    public String getCompanyId() {
        return companyId;
    }

    public void setCompanyId(String companyId) {
        this.companyId = companyId == null ? null : companyId.trim();
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName == null ? null : companyName.trim();
    }

    public String getSendId() {
        return sendId;
    }

    public void setSendId(String sendId) {
        this.sendId = sendId == null ? null : sendId.trim();
    }

    public String getSnedName() {
        return snedName;
    }

    public void setSnedName(String snedName) {
        this.snedName = snedName == null ? null : snedName.trim();
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school == null ? null : school.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(String creatTime) {
        this.creatTime = creatTime == null ? null : creatTime.trim();
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime == null ? null : startTime.trim();
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime == null ? null : endTime.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getClick() {
        return click;
    }

    public void setClick(Integer click) {
        this.click = click;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getBackup() {
        return backup;
    }

    public void setBackup(String backup) {
        this.backup = backup == null ? null : backup.trim();
    }


    @Override
    public String toString() {
        return "Preach{" +
                "preachId=" + preachId +
                ", companyId='" + companyId + '\'' +
                ", companyName='" + companyName + '\'' +
                ", sendId='" + sendId + '\'' +
                ", snedName='" + snedName + '\'' +
                ", school='" + school + '\'' +
                ", address='" + address + '\'' +
                ", introduction='" + introduction + '\'' +
                ", content='" + content + '\'' +
                ", creatTime='" + creatTime + '\'' +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", status=" + status +
                ", click=" + click +
                ", remark='" + remark + '\'' +
                ", backup='" + backup + '\'' +
                '}';
    }
}