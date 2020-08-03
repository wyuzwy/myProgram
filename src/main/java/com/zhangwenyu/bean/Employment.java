package com.zhangwenyu.bean;

public class Employment {
    private String studentId;

    private String studentName;

    private String studentDept;

    private String studentMajor;

    private String companyName;

    private String companyProperty;

    private String companyCategory;

    private String companyProvinces;

    private String companyCity;

    private String companyAddress;

    private String jobName;

    private Integer jobCounterpart;

    private String signTime;

    private String createTime;

    private String companyMan;

    private String manPhone;

    private String manTelephone;

    private String manEmail;

    private String companyPostcode;

    private String money;

    private String checkMan;

    private String chaeckTime;

    private Integer status;

    private String remark;

    private String backup;

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId == null ? null : studentId.trim();
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName == null ? null : studentName.trim();
    }

    public String getStudentDept() {
        return studentDept;
    }

    public void setStudentDept(String studentDept) {
        this.studentDept = studentDept == null ? null : studentDept.trim();
    }

    public String getStudentMajor() {
        return studentMajor;
    }

    public void setStudentMajor(String studentMajor) {
        this.studentMajor = studentMajor == null ? null : studentMajor.trim();
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName == null ? null : companyName.trim();
    }

    public String getCompanyProperty() {
        return companyProperty;
    }

    public void setCompanyProperty(String companyProperty) {
        this.companyProperty = companyProperty == null ? null : companyProperty.trim();
    }

    public String getCompanyCategory() {
        return companyCategory;
    }

    public void setCompanyCategory(String companyCategory) {
        this.companyCategory = companyCategory == null ? null : companyCategory.trim();
    }

    public String getCompanyProvinces() {
        return companyProvinces;
    }

    public void setCompanyProvinces(String companyProvinces) {
        this.companyProvinces = companyProvinces == null ? null : companyProvinces.trim();
    }

    public String getCompanyCity() {
        return companyCity;
    }

    public void setCompanyCity(String companyCity) {
        this.companyCity = companyCity == null ? null : companyCity.trim();
    }

    public String getCompanyAddress() {
        return companyAddress;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress == null ? null : companyAddress.trim();
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName == null ? null : jobName.trim();
    }

    public Integer getJobCounterpart() {
        return jobCounterpart;
    }

    public void setJobCounterpart(Integer jobCounterpart) {
        this.jobCounterpart = jobCounterpart;
    }

    public String getSignTime() {
        return signTime;
    }

    public void setSignTime(String signTime) {
        this.signTime = signTime == null ? null : signTime.trim();
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime == null ? null : createTime.trim();
    }

    public String getCompanyMan() {
        return companyMan;
    }

    public void setCompanyMan(String companyMan) {
        this.companyMan = companyMan == null ? null : companyMan.trim();
    }

    public String getManPhone() {
        return manPhone;
    }

    public void setManPhone(String manPhone) {
        this.manPhone = manPhone == null ? null : manPhone.trim();
    }

    public String getManTelephone() {
        return manTelephone;
    }

    public void setManTelephone(String manTelephone) {
        this.manTelephone = manTelephone == null ? null : manTelephone.trim();
    }

    public String getManEmail() {
        return manEmail;
    }

    public void setManEmail(String manEmail) {
        this.manEmail = manEmail == null ? null : manEmail.trim();
    }

    public String getCompanyPostcode() {
        return companyPostcode;
    }

    public void setCompanyPostcode(String companyPostcode) {
        this.companyPostcode = companyPostcode == null ? null : companyPostcode.trim();
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money == null ? null : money.trim();
    }

    public String getCheckMan() {
        return checkMan;
    }

    public void setCheckMan(String checkMan) {
        this.checkMan = checkMan == null ? null : checkMan.trim();
    }

    public String getChaeckTime() {
        return chaeckTime;
    }

    public void setChaeckTime(String chaeckTime) {
        this.chaeckTime = chaeckTime == null ? null : chaeckTime.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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
        return "Employment{" +
                "studentId='" + studentId + '\'' +
                ", studentName='" + studentName + '\'' +
                ", studentDept='" + studentDept + '\'' +
                ", studentMajor='" + studentMajor + '\'' +
                ", companyName='" + companyName + '\'' +
                ", companyProperty='" + companyProperty + '\'' +
                ", companyCategory='" + companyCategory + '\'' +
                ", companyProvinces='" + companyProvinces + '\'' +
                ", companyCity='" + companyCity + '\'' +
                ", companyAddress='" + companyAddress + '\'' +
                ", jobName='" + jobName + '\'' +
                ", jobCounterpart=" + jobCounterpart +
                ", signTime='" + signTime + '\'' +
                ", createTime='" + createTime + '\'' +
                ", companyMan='" + companyMan + '\'' +
                ", manPhone='" + manPhone + '\'' +
                ", manTelephone='" + manTelephone + '\'' +
                ", manEmail='" + manEmail + '\'' +
                ", companyPostcode='" + companyPostcode + '\'' +
                ", money='" + money + '\'' +
                ", checkMan='" + checkMan + '\'' +
                ", chaeckTime='" + chaeckTime + '\'' +
                ", status=" + status +
                ", remark='" + remark + '\'' +
                ", backup='" + backup + '\'' +
                '}';
    }
}