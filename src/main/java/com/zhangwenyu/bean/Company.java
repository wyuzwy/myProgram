package com.zhangwenyu.bean;

public class Company {
    private String companyEmail;

    private String companyName;

    private String userName;

    private String phone;

    private String provinces;

    private String city;

    private String address;

    private String telephone;

    private String jobEmail;

    private String companyProperty;

    private String companyCategory;

    private String scale;

    private String registerMoney;

    private String logo;

    private String companyLicense;

    private String introduction;

    private Integer status;

    private String createTime;

    private String updateTime;

    private String backup;

    public String getCompanyEmail() {
        return companyEmail;
    }

    public void setCompanyEmail(String companyEmail) {
        this.companyEmail = companyEmail == null ? null : companyEmail.trim();
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName == null ? null : companyName.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getProvinces() {
        return provinces;
    }

    public void setProvinces(String provinces) {
        this.provinces = provinces == null ? null : provinces.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public String getJobEmail() {
        return jobEmail;
    }

    public void setJobEmail(String jobEmail) {
        this.jobEmail = jobEmail == null ? null : jobEmail.trim();
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

    public String getScale() {
        return scale;
    }

    public void setScale(String scale) {
        this.scale = scale == null ? null : scale.trim();
    }

    public String getRegisterMoney() {
        return registerMoney;
    }

    public void setRegisterMoney(String registerMoney) {
        this.registerMoney = registerMoney == null ? null : registerMoney.trim();
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo == null ? null : logo.trim();
    }

    public String getCompanyLicense() {
        return companyLicense;
    }

    public void setCompanyLicense(String companyLicense) {
        this.companyLicense = companyLicense == null ? null : companyLicense.trim();
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime == null ? null : createTime.trim();
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime == null ? null : updateTime.trim();
    }

    public String getBackup() {
        return backup;
    }

    public void setBackup(String backup) {
        this.backup = backup == null ? null : backup.trim();
    }

    @Override
    public String toString() {
        return "Company{" +
                "companyEmail='" + companyEmail + '\'' +
                ", companyName='" + companyName + '\'' +
                ", userName='" + userName + '\'' +
                ", phone='" + phone + '\'' +
                ", provinces='" + provinces + '\'' +
                ", city='" + city + '\'' +
                ", address='" + address + '\'' +
                ", telephone='" + telephone + '\'' +
                ", jobEmail='" + jobEmail + '\'' +
                ", companyProperty='" + companyProperty + '\'' +
                ", companyCategory='" + companyCategory + '\'' +
                ", scale='" + scale + '\'' +
                ", registerMoney='" + registerMoney + '\'' +
                ", logo='" + logo + '\'' +
                ", companyLicense='" + companyLicense + '\'' +
                ", introduction='" + introduction + '\'' +
                ", status=" + status +
                ", createTime='" + createTime + '\'' +
                ", updateTime='" + updateTime + '\'' +
                ", backup='" + backup + '\'' +
                '}';
    }
}