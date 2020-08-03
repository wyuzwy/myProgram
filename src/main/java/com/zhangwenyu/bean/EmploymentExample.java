package com.zhangwenyu.bean;

import java.util.ArrayList;
import java.util.List;

public class EmploymentExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public EmploymentExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andStudentIdIsNull() {
            addCriterion("student_id is null");
            return (Criteria) this;
        }

        public Criteria andStudentIdIsNotNull() {
            addCriterion("student_id is not null");
            return (Criteria) this;
        }

        public Criteria andStudentIdEqualTo(String value) {
            addCriterion("student_id =", value, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdNotEqualTo(String value) {
            addCriterion("student_id <>", value, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdGreaterThan(String value) {
            addCriterion("student_id >", value, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdGreaterThanOrEqualTo(String value) {
            addCriterion("student_id >=", value, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdLessThan(String value) {
            addCriterion("student_id <", value, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdLessThanOrEqualTo(String value) {
            addCriterion("student_id <=", value, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdLike(String value) {
            addCriterion("student_id like", value, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdNotLike(String value) {
            addCriterion("student_id not like", value, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdIn(List<String> values) {
            addCriterion("student_id in", values, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdNotIn(List<String> values) {
            addCriterion("student_id not in", values, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdBetween(String value1, String value2) {
            addCriterion("student_id between", value1, value2, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentIdNotBetween(String value1, String value2) {
            addCriterion("student_id not between", value1, value2, "studentId");
            return (Criteria) this;
        }

        public Criteria andStudentNameIsNull() {
            addCriterion("student_name is null");
            return (Criteria) this;
        }

        public Criteria andStudentNameIsNotNull() {
            addCriterion("student_name is not null");
            return (Criteria) this;
        }

        public Criteria andStudentNameEqualTo(String value) {
            addCriterion("student_name =", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameNotEqualTo(String value) {
            addCriterion("student_name <>", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameGreaterThan(String value) {
            addCriterion("student_name >", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameGreaterThanOrEqualTo(String value) {
            addCriterion("student_name >=", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameLessThan(String value) {
            addCriterion("student_name <", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameLessThanOrEqualTo(String value) {
            addCriterion("student_name <=", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameLike(String value) {
            addCriterion("student_name like", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameNotLike(String value) {
            addCriterion("student_name not like", value, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameIn(List<String> values) {
            addCriterion("student_name in", values, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameNotIn(List<String> values) {
            addCriterion("student_name not in", values, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameBetween(String value1, String value2) {
            addCriterion("student_name between", value1, value2, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentNameNotBetween(String value1, String value2) {
            addCriterion("student_name not between", value1, value2, "studentName");
            return (Criteria) this;
        }

        public Criteria andStudentDeptIsNull() {
            addCriterion("student_dept is null");
            return (Criteria) this;
        }

        public Criteria andStudentDeptIsNotNull() {
            addCriterion("student_dept is not null");
            return (Criteria) this;
        }

        public Criteria andStudentDeptEqualTo(String value) {
            addCriterion("student_dept =", value, "studentDept");
            return (Criteria) this;
        }

        public Criteria andStudentDeptNotEqualTo(String value) {
            addCriterion("student_dept <>", value, "studentDept");
            return (Criteria) this;
        }

        public Criteria andStudentDeptGreaterThan(String value) {
            addCriterion("student_dept >", value, "studentDept");
            return (Criteria) this;
        }

        public Criteria andStudentDeptGreaterThanOrEqualTo(String value) {
            addCriterion("student_dept >=", value, "studentDept");
            return (Criteria) this;
        }

        public Criteria andStudentDeptLessThan(String value) {
            addCriterion("student_dept <", value, "studentDept");
            return (Criteria) this;
        }

        public Criteria andStudentDeptLessThanOrEqualTo(String value) {
            addCriterion("student_dept <=", value, "studentDept");
            return (Criteria) this;
        }

        public Criteria andStudentDeptLike(String value) {
            addCriterion("student_dept like", value, "studentDept");
            return (Criteria) this;
        }

        public Criteria andStudentDeptNotLike(String value) {
            addCriterion("student_dept not like", value, "studentDept");
            return (Criteria) this;
        }

        public Criteria andStudentDeptIn(List<String> values) {
            addCriterion("student_dept in", values, "studentDept");
            return (Criteria) this;
        }

        public Criteria andStudentDeptNotIn(List<String> values) {
            addCriterion("student_dept not in", values, "studentDept");
            return (Criteria) this;
        }

        public Criteria andStudentDeptBetween(String value1, String value2) {
            addCriterion("student_dept between", value1, value2, "studentDept");
            return (Criteria) this;
        }

        public Criteria andStudentDeptNotBetween(String value1, String value2) {
            addCriterion("student_dept not between", value1, value2, "studentDept");
            return (Criteria) this;
        }

        public Criteria andStudentMajorIsNull() {
            addCriterion("student_major is null");
            return (Criteria) this;
        }

        public Criteria andStudentMajorIsNotNull() {
            addCriterion("student_major is not null");
            return (Criteria) this;
        }

        public Criteria andStudentMajorEqualTo(String value) {
            addCriterion("student_major =", value, "studentMajor");
            return (Criteria) this;
        }

        public Criteria andStudentMajorNotEqualTo(String value) {
            addCriterion("student_major <>", value, "studentMajor");
            return (Criteria) this;
        }

        public Criteria andStudentMajorGreaterThan(String value) {
            addCriterion("student_major >", value, "studentMajor");
            return (Criteria) this;
        }

        public Criteria andStudentMajorGreaterThanOrEqualTo(String value) {
            addCriterion("student_major >=", value, "studentMajor");
            return (Criteria) this;
        }

        public Criteria andStudentMajorLessThan(String value) {
            addCriterion("student_major <", value, "studentMajor");
            return (Criteria) this;
        }

        public Criteria andStudentMajorLessThanOrEqualTo(String value) {
            addCriterion("student_major <=", value, "studentMajor");
            return (Criteria) this;
        }

        public Criteria andStudentMajorLike(String value) {
            addCriterion("student_major like", value, "studentMajor");
            return (Criteria) this;
        }

        public Criteria andStudentMajorNotLike(String value) {
            addCriterion("student_major not like", value, "studentMajor");
            return (Criteria) this;
        }

        public Criteria andStudentMajorIn(List<String> values) {
            addCriterion("student_major in", values, "studentMajor");
            return (Criteria) this;
        }

        public Criteria andStudentMajorNotIn(List<String> values) {
            addCriterion("student_major not in", values, "studentMajor");
            return (Criteria) this;
        }

        public Criteria andStudentMajorBetween(String value1, String value2) {
            addCriterion("student_major between", value1, value2, "studentMajor");
            return (Criteria) this;
        }

        public Criteria andStudentMajorNotBetween(String value1, String value2) {
            addCriterion("student_major not between", value1, value2, "studentMajor");
            return (Criteria) this;
        }

        public Criteria andCompanyNameIsNull() {
            addCriterion("company_name is null");
            return (Criteria) this;
        }

        public Criteria andCompanyNameIsNotNull() {
            addCriterion("company_name is not null");
            return (Criteria) this;
        }

        public Criteria andCompanyNameEqualTo(String value) {
            addCriterion("company_name =", value, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameNotEqualTo(String value) {
            addCriterion("company_name <>", value, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameGreaterThan(String value) {
            addCriterion("company_name >", value, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameGreaterThanOrEqualTo(String value) {
            addCriterion("company_name >=", value, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameLessThan(String value) {
            addCriterion("company_name <", value, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameLessThanOrEqualTo(String value) {
            addCriterion("company_name <=", value, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameLike(String value) {
            addCriterion("company_name like", value, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameNotLike(String value) {
            addCriterion("company_name not like", value, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameIn(List<String> values) {
            addCriterion("company_name in", values, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameNotIn(List<String> values) {
            addCriterion("company_name not in", values, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameBetween(String value1, String value2) {
            addCriterion("company_name between", value1, value2, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyNameNotBetween(String value1, String value2) {
            addCriterion("company_name not between", value1, value2, "companyName");
            return (Criteria) this;
        }

        public Criteria andCompanyPropertyIsNull() {
            addCriterion("company_property is null");
            return (Criteria) this;
        }

        public Criteria andCompanyPropertyIsNotNull() {
            addCriterion("company_property is not null");
            return (Criteria) this;
        }

        public Criteria andCompanyPropertyEqualTo(String value) {
            addCriterion("company_property =", value, "companyProperty");
            return (Criteria) this;
        }

        public Criteria andCompanyPropertyNotEqualTo(String value) {
            addCriterion("company_property <>", value, "companyProperty");
            return (Criteria) this;
        }

        public Criteria andCompanyPropertyGreaterThan(String value) {
            addCriterion("company_property >", value, "companyProperty");
            return (Criteria) this;
        }

        public Criteria andCompanyPropertyGreaterThanOrEqualTo(String value) {
            addCriterion("company_property >=", value, "companyProperty");
            return (Criteria) this;
        }

        public Criteria andCompanyPropertyLessThan(String value) {
            addCriterion("company_property <", value, "companyProperty");
            return (Criteria) this;
        }

        public Criteria andCompanyPropertyLessThanOrEqualTo(String value) {
            addCriterion("company_property <=", value, "companyProperty");
            return (Criteria) this;
        }

        public Criteria andCompanyPropertyLike(String value) {
            addCriterion("company_property like", value, "companyProperty");
            return (Criteria) this;
        }

        public Criteria andCompanyPropertyNotLike(String value) {
            addCriterion("company_property not like", value, "companyProperty");
            return (Criteria) this;
        }

        public Criteria andCompanyPropertyIn(List<String> values) {
            addCriterion("company_property in", values, "companyProperty");
            return (Criteria) this;
        }

        public Criteria andCompanyPropertyNotIn(List<String> values) {
            addCriterion("company_property not in", values, "companyProperty");
            return (Criteria) this;
        }

        public Criteria andCompanyPropertyBetween(String value1, String value2) {
            addCriterion("company_property between", value1, value2, "companyProperty");
            return (Criteria) this;
        }

        public Criteria andCompanyPropertyNotBetween(String value1, String value2) {
            addCriterion("company_property not between", value1, value2, "companyProperty");
            return (Criteria) this;
        }

        public Criteria andCompanyCategoryIsNull() {
            addCriterion("company_category is null");
            return (Criteria) this;
        }

        public Criteria andCompanyCategoryIsNotNull() {
            addCriterion("company_category is not null");
            return (Criteria) this;
        }

        public Criteria andCompanyCategoryEqualTo(String value) {
            addCriterion("company_category =", value, "companyCategory");
            return (Criteria) this;
        }

        public Criteria andCompanyCategoryNotEqualTo(String value) {
            addCriterion("company_category <>", value, "companyCategory");
            return (Criteria) this;
        }

        public Criteria andCompanyCategoryGreaterThan(String value) {
            addCriterion("company_category >", value, "companyCategory");
            return (Criteria) this;
        }

        public Criteria andCompanyCategoryGreaterThanOrEqualTo(String value) {
            addCriterion("company_category >=", value, "companyCategory");
            return (Criteria) this;
        }

        public Criteria andCompanyCategoryLessThan(String value) {
            addCriterion("company_category <", value, "companyCategory");
            return (Criteria) this;
        }

        public Criteria andCompanyCategoryLessThanOrEqualTo(String value) {
            addCriterion("company_category <=", value, "companyCategory");
            return (Criteria) this;
        }

        public Criteria andCompanyCategoryLike(String value) {
            addCriterion("company_category like", value, "companyCategory");
            return (Criteria) this;
        }

        public Criteria andCompanyCategoryNotLike(String value) {
            addCriterion("company_category not like", value, "companyCategory");
            return (Criteria) this;
        }

        public Criteria andCompanyCategoryIn(List<String> values) {
            addCriterion("company_category in", values, "companyCategory");
            return (Criteria) this;
        }

        public Criteria andCompanyCategoryNotIn(List<String> values) {
            addCriterion("company_category not in", values, "companyCategory");
            return (Criteria) this;
        }

        public Criteria andCompanyCategoryBetween(String value1, String value2) {
            addCriterion("company_category between", value1, value2, "companyCategory");
            return (Criteria) this;
        }

        public Criteria andCompanyCategoryNotBetween(String value1, String value2) {
            addCriterion("company_category not between", value1, value2, "companyCategory");
            return (Criteria) this;
        }

        public Criteria andCompanyProvincesIsNull() {
            addCriterion("company_provinces is null");
            return (Criteria) this;
        }

        public Criteria andCompanyProvincesIsNotNull() {
            addCriterion("company_provinces is not null");
            return (Criteria) this;
        }

        public Criteria andCompanyProvincesEqualTo(String value) {
            addCriterion("company_provinces =", value, "companyProvinces");
            return (Criteria) this;
        }

        public Criteria andCompanyProvincesNotEqualTo(String value) {
            addCriterion("company_provinces <>", value, "companyProvinces");
            return (Criteria) this;
        }

        public Criteria andCompanyProvincesGreaterThan(String value) {
            addCriterion("company_provinces >", value, "companyProvinces");
            return (Criteria) this;
        }

        public Criteria andCompanyProvincesGreaterThanOrEqualTo(String value) {
            addCriterion("company_provinces >=", value, "companyProvinces");
            return (Criteria) this;
        }

        public Criteria andCompanyProvincesLessThan(String value) {
            addCriterion("company_provinces <", value, "companyProvinces");
            return (Criteria) this;
        }

        public Criteria andCompanyProvincesLessThanOrEqualTo(String value) {
            addCriterion("company_provinces <=", value, "companyProvinces");
            return (Criteria) this;
        }

        public Criteria andCompanyProvincesLike(String value) {
            addCriterion("company_provinces like", value, "companyProvinces");
            return (Criteria) this;
        }

        public Criteria andCompanyProvincesNotLike(String value) {
            addCriterion("company_provinces not like", value, "companyProvinces");
            return (Criteria) this;
        }

        public Criteria andCompanyProvincesIn(List<String> values) {
            addCriterion("company_provinces in", values, "companyProvinces");
            return (Criteria) this;
        }

        public Criteria andCompanyProvincesNotIn(List<String> values) {
            addCriterion("company_provinces not in", values, "companyProvinces");
            return (Criteria) this;
        }

        public Criteria andCompanyProvincesBetween(String value1, String value2) {
            addCriterion("company_provinces between", value1, value2, "companyProvinces");
            return (Criteria) this;
        }

        public Criteria andCompanyProvincesNotBetween(String value1, String value2) {
            addCriterion("company_provinces not between", value1, value2, "companyProvinces");
            return (Criteria) this;
        }

        public Criteria andCompanyCityIsNull() {
            addCriterion("company_city is null");
            return (Criteria) this;
        }

        public Criteria andCompanyCityIsNotNull() {
            addCriterion("company_city is not null");
            return (Criteria) this;
        }

        public Criteria andCompanyCityEqualTo(String value) {
            addCriterion("company_city =", value, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityNotEqualTo(String value) {
            addCriterion("company_city <>", value, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityGreaterThan(String value) {
            addCriterion("company_city >", value, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityGreaterThanOrEqualTo(String value) {
            addCriterion("company_city >=", value, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityLessThan(String value) {
            addCriterion("company_city <", value, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityLessThanOrEqualTo(String value) {
            addCriterion("company_city <=", value, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityLike(String value) {
            addCriterion("company_city like", value, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityNotLike(String value) {
            addCriterion("company_city not like", value, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityIn(List<String> values) {
            addCriterion("company_city in", values, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityNotIn(List<String> values) {
            addCriterion("company_city not in", values, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityBetween(String value1, String value2) {
            addCriterion("company_city between", value1, value2, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyCityNotBetween(String value1, String value2) {
            addCriterion("company_city not between", value1, value2, "companyCity");
            return (Criteria) this;
        }

        public Criteria andCompanyAddressIsNull() {
            addCriterion("company_address is null");
            return (Criteria) this;
        }

        public Criteria andCompanyAddressIsNotNull() {
            addCriterion("company_address is not null");
            return (Criteria) this;
        }

        public Criteria andCompanyAddressEqualTo(String value) {
            addCriterion("company_address =", value, "companyAddress");
            return (Criteria) this;
        }

        public Criteria andCompanyAddressNotEqualTo(String value) {
            addCriterion("company_address <>", value, "companyAddress");
            return (Criteria) this;
        }

        public Criteria andCompanyAddressGreaterThan(String value) {
            addCriterion("company_address >", value, "companyAddress");
            return (Criteria) this;
        }

        public Criteria andCompanyAddressGreaterThanOrEqualTo(String value) {
            addCriterion("company_address >=", value, "companyAddress");
            return (Criteria) this;
        }

        public Criteria andCompanyAddressLessThan(String value) {
            addCriterion("company_address <", value, "companyAddress");
            return (Criteria) this;
        }

        public Criteria andCompanyAddressLessThanOrEqualTo(String value) {
            addCriterion("company_address <=", value, "companyAddress");
            return (Criteria) this;
        }

        public Criteria andCompanyAddressLike(String value) {
            addCriterion("company_address like", value, "companyAddress");
            return (Criteria) this;
        }

        public Criteria andCompanyAddressNotLike(String value) {
            addCriterion("company_address not like", value, "companyAddress");
            return (Criteria) this;
        }

        public Criteria andCompanyAddressIn(List<String> values) {
            addCriterion("company_address in", values, "companyAddress");
            return (Criteria) this;
        }

        public Criteria andCompanyAddressNotIn(List<String> values) {
            addCriterion("company_address not in", values, "companyAddress");
            return (Criteria) this;
        }

        public Criteria andCompanyAddressBetween(String value1, String value2) {
            addCriterion("company_address between", value1, value2, "companyAddress");
            return (Criteria) this;
        }

        public Criteria andCompanyAddressNotBetween(String value1, String value2) {
            addCriterion("company_address not between", value1, value2, "companyAddress");
            return (Criteria) this;
        }

        public Criteria andJobNameIsNull() {
            addCriterion("job_name is null");
            return (Criteria) this;
        }

        public Criteria andJobNameIsNotNull() {
            addCriterion("job_name is not null");
            return (Criteria) this;
        }

        public Criteria andJobNameEqualTo(String value) {
            addCriterion("job_name =", value, "jobName");
            return (Criteria) this;
        }

        public Criteria andJobNameNotEqualTo(String value) {
            addCriterion("job_name <>", value, "jobName");
            return (Criteria) this;
        }

        public Criteria andJobNameGreaterThan(String value) {
            addCriterion("job_name >", value, "jobName");
            return (Criteria) this;
        }

        public Criteria andJobNameGreaterThanOrEqualTo(String value) {
            addCriterion("job_name >=", value, "jobName");
            return (Criteria) this;
        }

        public Criteria andJobNameLessThan(String value) {
            addCriterion("job_name <", value, "jobName");
            return (Criteria) this;
        }

        public Criteria andJobNameLessThanOrEqualTo(String value) {
            addCriterion("job_name <=", value, "jobName");
            return (Criteria) this;
        }

        public Criteria andJobNameLike(String value) {
            addCriterion("job_name like", value, "jobName");
            return (Criteria) this;
        }

        public Criteria andJobNameNotLike(String value) {
            addCriterion("job_name not like", value, "jobName");
            return (Criteria) this;
        }

        public Criteria andJobNameIn(List<String> values) {
            addCriterion("job_name in", values, "jobName");
            return (Criteria) this;
        }

        public Criteria andJobNameNotIn(List<String> values) {
            addCriterion("job_name not in", values, "jobName");
            return (Criteria) this;
        }

        public Criteria andJobNameBetween(String value1, String value2) {
            addCriterion("job_name between", value1, value2, "jobName");
            return (Criteria) this;
        }

        public Criteria andJobNameNotBetween(String value1, String value2) {
            addCriterion("job_name not between", value1, value2, "jobName");
            return (Criteria) this;
        }

        public Criteria andJobCounterpartIsNull() {
            addCriterion("job_counterpart is null");
            return (Criteria) this;
        }

        public Criteria andJobCounterpartIsNotNull() {
            addCriterion("job_counterpart is not null");
            return (Criteria) this;
        }

        public Criteria andJobCounterpartEqualTo(Integer value) {
            addCriterion("job_counterpart =", value, "jobCounterpart");
            return (Criteria) this;
        }

        public Criteria andJobCounterpartNotEqualTo(Integer value) {
            addCriterion("job_counterpart <>", value, "jobCounterpart");
            return (Criteria) this;
        }

        public Criteria andJobCounterpartGreaterThan(Integer value) {
            addCriterion("job_counterpart >", value, "jobCounterpart");
            return (Criteria) this;
        }

        public Criteria andJobCounterpartGreaterThanOrEqualTo(Integer value) {
            addCriterion("job_counterpart >=", value, "jobCounterpart");
            return (Criteria) this;
        }

        public Criteria andJobCounterpartLessThan(Integer value) {
            addCriterion("job_counterpart <", value, "jobCounterpart");
            return (Criteria) this;
        }

        public Criteria andJobCounterpartLessThanOrEqualTo(Integer value) {
            addCriterion("job_counterpart <=", value, "jobCounterpart");
            return (Criteria) this;
        }

        public Criteria andJobCounterpartIn(List<Integer> values) {
            addCriterion("job_counterpart in", values, "jobCounterpart");
            return (Criteria) this;
        }

        public Criteria andJobCounterpartNotIn(List<Integer> values) {
            addCriterion("job_counterpart not in", values, "jobCounterpart");
            return (Criteria) this;
        }

        public Criteria andJobCounterpartBetween(Integer value1, Integer value2) {
            addCriterion("job_counterpart between", value1, value2, "jobCounterpart");
            return (Criteria) this;
        }

        public Criteria andJobCounterpartNotBetween(Integer value1, Integer value2) {
            addCriterion("job_counterpart not between", value1, value2, "jobCounterpart");
            return (Criteria) this;
        }

        public Criteria andSignTimeIsNull() {
            addCriterion("sign_time is null");
            return (Criteria) this;
        }

        public Criteria andSignTimeIsNotNull() {
            addCriterion("sign_time is not null");
            return (Criteria) this;
        }

        public Criteria andSignTimeEqualTo(String value) {
            addCriterion("sign_time =", value, "signTime");
            return (Criteria) this;
        }

        public Criteria andSignTimeNotEqualTo(String value) {
            addCriterion("sign_time <>", value, "signTime");
            return (Criteria) this;
        }

        public Criteria andSignTimeGreaterThan(String value) {
            addCriterion("sign_time >", value, "signTime");
            return (Criteria) this;
        }

        public Criteria andSignTimeGreaterThanOrEqualTo(String value) {
            addCriterion("sign_time >=", value, "signTime");
            return (Criteria) this;
        }

        public Criteria andSignTimeLessThan(String value) {
            addCriterion("sign_time <", value, "signTime");
            return (Criteria) this;
        }

        public Criteria andSignTimeLessThanOrEqualTo(String value) {
            addCriterion("sign_time <=", value, "signTime");
            return (Criteria) this;
        }

        public Criteria andSignTimeLike(String value) {
            addCriterion("sign_time like", value, "signTime");
            return (Criteria) this;
        }

        public Criteria andSignTimeNotLike(String value) {
            addCriterion("sign_time not like", value, "signTime");
            return (Criteria) this;
        }

        public Criteria andSignTimeIn(List<String> values) {
            addCriterion("sign_time in", values, "signTime");
            return (Criteria) this;
        }

        public Criteria andSignTimeNotIn(List<String> values) {
            addCriterion("sign_time not in", values, "signTime");
            return (Criteria) this;
        }

        public Criteria andSignTimeBetween(String value1, String value2) {
            addCriterion("sign_time between", value1, value2, "signTime");
            return (Criteria) this;
        }

        public Criteria andSignTimeNotBetween(String value1, String value2) {
            addCriterion("sign_time not between", value1, value2, "signTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("create_time is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("create_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(String value) {
            addCriterion("create_time =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(String value) {
            addCriterion("create_time <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(String value) {
            addCriterion("create_time >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(String value) {
            addCriterion("create_time >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(String value) {
            addCriterion("create_time <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(String value) {
            addCriterion("create_time <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLike(String value) {
            addCriterion("create_time like", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotLike(String value) {
            addCriterion("create_time not like", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<String> values) {
            addCriterion("create_time in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<String> values) {
            addCriterion("create_time not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(String value1, String value2) {
            addCriterion("create_time between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(String value1, String value2) {
            addCriterion("create_time not between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCompanyManIsNull() {
            addCriterion("company_man is null");
            return (Criteria) this;
        }

        public Criteria andCompanyManIsNotNull() {
            addCriterion("company_man is not null");
            return (Criteria) this;
        }

        public Criteria andCompanyManEqualTo(String value) {
            addCriterion("company_man =", value, "companyMan");
            return (Criteria) this;
        }

        public Criteria andCompanyManNotEqualTo(String value) {
            addCriterion("company_man <>", value, "companyMan");
            return (Criteria) this;
        }

        public Criteria andCompanyManGreaterThan(String value) {
            addCriterion("company_man >", value, "companyMan");
            return (Criteria) this;
        }

        public Criteria andCompanyManGreaterThanOrEqualTo(String value) {
            addCriterion("company_man >=", value, "companyMan");
            return (Criteria) this;
        }

        public Criteria andCompanyManLessThan(String value) {
            addCriterion("company_man <", value, "companyMan");
            return (Criteria) this;
        }

        public Criteria andCompanyManLessThanOrEqualTo(String value) {
            addCriterion("company_man <=", value, "companyMan");
            return (Criteria) this;
        }

        public Criteria andCompanyManLike(String value) {
            addCriterion("company_man like", value, "companyMan");
            return (Criteria) this;
        }

        public Criteria andCompanyManNotLike(String value) {
            addCriterion("company_man not like", value, "companyMan");
            return (Criteria) this;
        }

        public Criteria andCompanyManIn(List<String> values) {
            addCriterion("company_man in", values, "companyMan");
            return (Criteria) this;
        }

        public Criteria andCompanyManNotIn(List<String> values) {
            addCriterion("company_man not in", values, "companyMan");
            return (Criteria) this;
        }

        public Criteria andCompanyManBetween(String value1, String value2) {
            addCriterion("company_man between", value1, value2, "companyMan");
            return (Criteria) this;
        }

        public Criteria andCompanyManNotBetween(String value1, String value2) {
            addCriterion("company_man not between", value1, value2, "companyMan");
            return (Criteria) this;
        }

        public Criteria andManPhoneIsNull() {
            addCriterion("man_phone is null");
            return (Criteria) this;
        }

        public Criteria andManPhoneIsNotNull() {
            addCriterion("man_phone is not null");
            return (Criteria) this;
        }

        public Criteria andManPhoneEqualTo(String value) {
            addCriterion("man_phone =", value, "manPhone");
            return (Criteria) this;
        }

        public Criteria andManPhoneNotEqualTo(String value) {
            addCriterion("man_phone <>", value, "manPhone");
            return (Criteria) this;
        }

        public Criteria andManPhoneGreaterThan(String value) {
            addCriterion("man_phone >", value, "manPhone");
            return (Criteria) this;
        }

        public Criteria andManPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("man_phone >=", value, "manPhone");
            return (Criteria) this;
        }

        public Criteria andManPhoneLessThan(String value) {
            addCriterion("man_phone <", value, "manPhone");
            return (Criteria) this;
        }

        public Criteria andManPhoneLessThanOrEqualTo(String value) {
            addCriterion("man_phone <=", value, "manPhone");
            return (Criteria) this;
        }

        public Criteria andManPhoneLike(String value) {
            addCriterion("man_phone like", value, "manPhone");
            return (Criteria) this;
        }

        public Criteria andManPhoneNotLike(String value) {
            addCriterion("man_phone not like", value, "manPhone");
            return (Criteria) this;
        }

        public Criteria andManPhoneIn(List<String> values) {
            addCriterion("man_phone in", values, "manPhone");
            return (Criteria) this;
        }

        public Criteria andManPhoneNotIn(List<String> values) {
            addCriterion("man_phone not in", values, "manPhone");
            return (Criteria) this;
        }

        public Criteria andManPhoneBetween(String value1, String value2) {
            addCriterion("man_phone between", value1, value2, "manPhone");
            return (Criteria) this;
        }

        public Criteria andManPhoneNotBetween(String value1, String value2) {
            addCriterion("man_phone not between", value1, value2, "manPhone");
            return (Criteria) this;
        }

        public Criteria andManTelephoneIsNull() {
            addCriterion("man_telephone is null");
            return (Criteria) this;
        }

        public Criteria andManTelephoneIsNotNull() {
            addCriterion("man_telephone is not null");
            return (Criteria) this;
        }

        public Criteria andManTelephoneEqualTo(String value) {
            addCriterion("man_telephone =", value, "manTelephone");
            return (Criteria) this;
        }

        public Criteria andManTelephoneNotEqualTo(String value) {
            addCriterion("man_telephone <>", value, "manTelephone");
            return (Criteria) this;
        }

        public Criteria andManTelephoneGreaterThan(String value) {
            addCriterion("man_telephone >", value, "manTelephone");
            return (Criteria) this;
        }

        public Criteria andManTelephoneGreaterThanOrEqualTo(String value) {
            addCriterion("man_telephone >=", value, "manTelephone");
            return (Criteria) this;
        }

        public Criteria andManTelephoneLessThan(String value) {
            addCriterion("man_telephone <", value, "manTelephone");
            return (Criteria) this;
        }

        public Criteria andManTelephoneLessThanOrEqualTo(String value) {
            addCriterion("man_telephone <=", value, "manTelephone");
            return (Criteria) this;
        }

        public Criteria andManTelephoneLike(String value) {
            addCriterion("man_telephone like", value, "manTelephone");
            return (Criteria) this;
        }

        public Criteria andManTelephoneNotLike(String value) {
            addCriterion("man_telephone not like", value, "manTelephone");
            return (Criteria) this;
        }

        public Criteria andManTelephoneIn(List<String> values) {
            addCriterion("man_telephone in", values, "manTelephone");
            return (Criteria) this;
        }

        public Criteria andManTelephoneNotIn(List<String> values) {
            addCriterion("man_telephone not in", values, "manTelephone");
            return (Criteria) this;
        }

        public Criteria andManTelephoneBetween(String value1, String value2) {
            addCriterion("man_telephone between", value1, value2, "manTelephone");
            return (Criteria) this;
        }

        public Criteria andManTelephoneNotBetween(String value1, String value2) {
            addCriterion("man_telephone not between", value1, value2, "manTelephone");
            return (Criteria) this;
        }

        public Criteria andManEmailIsNull() {
            addCriterion("man_email is null");
            return (Criteria) this;
        }

        public Criteria andManEmailIsNotNull() {
            addCriterion("man_email is not null");
            return (Criteria) this;
        }

        public Criteria andManEmailEqualTo(String value) {
            addCriterion("man_email =", value, "manEmail");
            return (Criteria) this;
        }

        public Criteria andManEmailNotEqualTo(String value) {
            addCriterion("man_email <>", value, "manEmail");
            return (Criteria) this;
        }

        public Criteria andManEmailGreaterThan(String value) {
            addCriterion("man_email >", value, "manEmail");
            return (Criteria) this;
        }

        public Criteria andManEmailGreaterThanOrEqualTo(String value) {
            addCriterion("man_email >=", value, "manEmail");
            return (Criteria) this;
        }

        public Criteria andManEmailLessThan(String value) {
            addCriterion("man_email <", value, "manEmail");
            return (Criteria) this;
        }

        public Criteria andManEmailLessThanOrEqualTo(String value) {
            addCriterion("man_email <=", value, "manEmail");
            return (Criteria) this;
        }

        public Criteria andManEmailLike(String value) {
            addCriterion("man_email like", value, "manEmail");
            return (Criteria) this;
        }

        public Criteria andManEmailNotLike(String value) {
            addCriterion("man_email not like", value, "manEmail");
            return (Criteria) this;
        }

        public Criteria andManEmailIn(List<String> values) {
            addCriterion("man_email in", values, "manEmail");
            return (Criteria) this;
        }

        public Criteria andManEmailNotIn(List<String> values) {
            addCriterion("man_email not in", values, "manEmail");
            return (Criteria) this;
        }

        public Criteria andManEmailBetween(String value1, String value2) {
            addCriterion("man_email between", value1, value2, "manEmail");
            return (Criteria) this;
        }

        public Criteria andManEmailNotBetween(String value1, String value2) {
            addCriterion("man_email not between", value1, value2, "manEmail");
            return (Criteria) this;
        }

        public Criteria andCompanyPostcodeIsNull() {
            addCriterion("company_postcode is null");
            return (Criteria) this;
        }

        public Criteria andCompanyPostcodeIsNotNull() {
            addCriterion("company_postcode is not null");
            return (Criteria) this;
        }

        public Criteria andCompanyPostcodeEqualTo(String value) {
            addCriterion("company_postcode =", value, "companyPostcode");
            return (Criteria) this;
        }

        public Criteria andCompanyPostcodeNotEqualTo(String value) {
            addCriterion("company_postcode <>", value, "companyPostcode");
            return (Criteria) this;
        }

        public Criteria andCompanyPostcodeGreaterThan(String value) {
            addCriterion("company_postcode >", value, "companyPostcode");
            return (Criteria) this;
        }

        public Criteria andCompanyPostcodeGreaterThanOrEqualTo(String value) {
            addCriterion("company_postcode >=", value, "companyPostcode");
            return (Criteria) this;
        }

        public Criteria andCompanyPostcodeLessThan(String value) {
            addCriterion("company_postcode <", value, "companyPostcode");
            return (Criteria) this;
        }

        public Criteria andCompanyPostcodeLessThanOrEqualTo(String value) {
            addCriterion("company_postcode <=", value, "companyPostcode");
            return (Criteria) this;
        }

        public Criteria andCompanyPostcodeLike(String value) {
            addCriterion("company_postcode like", value, "companyPostcode");
            return (Criteria) this;
        }

        public Criteria andCompanyPostcodeNotLike(String value) {
            addCriterion("company_postcode not like", value, "companyPostcode");
            return (Criteria) this;
        }

        public Criteria andCompanyPostcodeIn(List<String> values) {
            addCriterion("company_postcode in", values, "companyPostcode");
            return (Criteria) this;
        }

        public Criteria andCompanyPostcodeNotIn(List<String> values) {
            addCriterion("company_postcode not in", values, "companyPostcode");
            return (Criteria) this;
        }

        public Criteria andCompanyPostcodeBetween(String value1, String value2) {
            addCriterion("company_postcode between", value1, value2, "companyPostcode");
            return (Criteria) this;
        }

        public Criteria andCompanyPostcodeNotBetween(String value1, String value2) {
            addCriterion("company_postcode not between", value1, value2, "companyPostcode");
            return (Criteria) this;
        }

        public Criteria andMoneyIsNull() {
            addCriterion("money is null");
            return (Criteria) this;
        }

        public Criteria andMoneyIsNotNull() {
            addCriterion("money is not null");
            return (Criteria) this;
        }

        public Criteria andMoneyEqualTo(String value) {
            addCriterion("money =", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyNotEqualTo(String value) {
            addCriterion("money <>", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyGreaterThan(String value) {
            addCriterion("money >", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyGreaterThanOrEqualTo(String value) {
            addCriterion("money >=", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyLessThan(String value) {
            addCriterion("money <", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyLessThanOrEqualTo(String value) {
            addCriterion("money <=", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyLike(String value) {
            addCriterion("money like", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyNotLike(String value) {
            addCriterion("money not like", value, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyIn(List<String> values) {
            addCriterion("money in", values, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyNotIn(List<String> values) {
            addCriterion("money not in", values, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyBetween(String value1, String value2) {
            addCriterion("money between", value1, value2, "money");
            return (Criteria) this;
        }

        public Criteria andMoneyNotBetween(String value1, String value2) {
            addCriterion("money not between", value1, value2, "money");
            return (Criteria) this;
        }

        public Criteria andCheckManIsNull() {
            addCriterion("check_man is null");
            return (Criteria) this;
        }

        public Criteria andCheckManIsNotNull() {
            addCriterion("check_man is not null");
            return (Criteria) this;
        }

        public Criteria andCheckManEqualTo(String value) {
            addCriterion("check_man =", value, "checkMan");
            return (Criteria) this;
        }

        public Criteria andCheckManNotEqualTo(String value) {
            addCriterion("check_man <>", value, "checkMan");
            return (Criteria) this;
        }

        public Criteria andCheckManGreaterThan(String value) {
            addCriterion("check_man >", value, "checkMan");
            return (Criteria) this;
        }

        public Criteria andCheckManGreaterThanOrEqualTo(String value) {
            addCriterion("check_man >=", value, "checkMan");
            return (Criteria) this;
        }

        public Criteria andCheckManLessThan(String value) {
            addCriterion("check_man <", value, "checkMan");
            return (Criteria) this;
        }

        public Criteria andCheckManLessThanOrEqualTo(String value) {
            addCriterion("check_man <=", value, "checkMan");
            return (Criteria) this;
        }

        public Criteria andCheckManLike(String value) {
            addCriterion("check_man like", value, "checkMan");
            return (Criteria) this;
        }

        public Criteria andCheckManNotLike(String value) {
            addCriterion("check_man not like", value, "checkMan");
            return (Criteria) this;
        }

        public Criteria andCheckManIn(List<String> values) {
            addCriterion("check_man in", values, "checkMan");
            return (Criteria) this;
        }

        public Criteria andCheckManNotIn(List<String> values) {
            addCriterion("check_man not in", values, "checkMan");
            return (Criteria) this;
        }

        public Criteria andCheckManBetween(String value1, String value2) {
            addCriterion("check_man between", value1, value2, "checkMan");
            return (Criteria) this;
        }

        public Criteria andCheckManNotBetween(String value1, String value2) {
            addCriterion("check_man not between", value1, value2, "checkMan");
            return (Criteria) this;
        }

        public Criteria andChaeckTimeIsNull() {
            addCriterion("chaeck_time is null");
            return (Criteria) this;
        }

        public Criteria andChaeckTimeIsNotNull() {
            addCriterion("chaeck_time is not null");
            return (Criteria) this;
        }

        public Criteria andChaeckTimeEqualTo(String value) {
            addCriterion("chaeck_time =", value, "chaeckTime");
            return (Criteria) this;
        }

        public Criteria andChaeckTimeNotEqualTo(String value) {
            addCriterion("chaeck_time <>", value, "chaeckTime");
            return (Criteria) this;
        }

        public Criteria andChaeckTimeGreaterThan(String value) {
            addCriterion("chaeck_time >", value, "chaeckTime");
            return (Criteria) this;
        }

        public Criteria andChaeckTimeGreaterThanOrEqualTo(String value) {
            addCriterion("chaeck_time >=", value, "chaeckTime");
            return (Criteria) this;
        }

        public Criteria andChaeckTimeLessThan(String value) {
            addCriterion("chaeck_time <", value, "chaeckTime");
            return (Criteria) this;
        }

        public Criteria andChaeckTimeLessThanOrEqualTo(String value) {
            addCriterion("chaeck_time <=", value, "chaeckTime");
            return (Criteria) this;
        }

        public Criteria andChaeckTimeLike(String value) {
            addCriterion("chaeck_time like", value, "chaeckTime");
            return (Criteria) this;
        }

        public Criteria andChaeckTimeNotLike(String value) {
            addCriterion("chaeck_time not like", value, "chaeckTime");
            return (Criteria) this;
        }

        public Criteria andChaeckTimeIn(List<String> values) {
            addCriterion("chaeck_time in", values, "chaeckTime");
            return (Criteria) this;
        }

        public Criteria andChaeckTimeNotIn(List<String> values) {
            addCriterion("chaeck_time not in", values, "chaeckTime");
            return (Criteria) this;
        }

        public Criteria andChaeckTimeBetween(String value1, String value2) {
            addCriterion("chaeck_time between", value1, value2, "chaeckTime");
            return (Criteria) this;
        }

        public Criteria andChaeckTimeNotBetween(String value1, String value2) {
            addCriterion("chaeck_time not between", value1, value2, "chaeckTime");
            return (Criteria) this;
        }

        public Criteria andStatusIsNull() {
            addCriterion("status is null");
            return (Criteria) this;
        }

        public Criteria andStatusIsNotNull() {
            addCriterion("status is not null");
            return (Criteria) this;
        }

        public Criteria andStatusEqualTo(Integer value) {
            addCriterion("status =", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotEqualTo(Integer value) {
            addCriterion("status <>", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThan(Integer value) {
            addCriterion("status >", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("status >=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThan(Integer value) {
            addCriterion("status <", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusLessThanOrEqualTo(Integer value) {
            addCriterion("status <=", value, "status");
            return (Criteria) this;
        }

        public Criteria andStatusIn(List<Integer> values) {
            addCriterion("status in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotIn(List<Integer> values) {
            addCriterion("status not in", values, "status");
            return (Criteria) this;
        }

        public Criteria andStatusBetween(Integer value1, Integer value2) {
            addCriterion("status between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("status not between", value1, value2, "status");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNull() {
            addCriterion("remark is null");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNotNull() {
            addCriterion("remark is not null");
            return (Criteria) this;
        }

        public Criteria andRemarkEqualTo(String value) {
            addCriterion("remark =", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotEqualTo(String value) {
            addCriterion("remark <>", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThan(String value) {
            addCriterion("remark >", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThanOrEqualTo(String value) {
            addCriterion("remark >=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThan(String value) {
            addCriterion("remark <", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThanOrEqualTo(String value) {
            addCriterion("remark <=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLike(String value) {
            addCriterion("remark like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotLike(String value) {
            addCriterion("remark not like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkIn(List<String> values) {
            addCriterion("remark in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotIn(List<String> values) {
            addCriterion("remark not in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkBetween(String value1, String value2) {
            addCriterion("remark between", value1, value2, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotBetween(String value1, String value2) {
            addCriterion("remark not between", value1, value2, "remark");
            return (Criteria) this;
        }

        public Criteria andBackupIsNull() {
            addCriterion("backup is null");
            return (Criteria) this;
        }

        public Criteria andBackupIsNotNull() {
            addCriterion("backup is not null");
            return (Criteria) this;
        }

        public Criteria andBackupEqualTo(String value) {
            addCriterion("backup =", value, "backup");
            return (Criteria) this;
        }

        public Criteria andBackupNotEqualTo(String value) {
            addCriterion("backup <>", value, "backup");
            return (Criteria) this;
        }

        public Criteria andBackupGreaterThan(String value) {
            addCriterion("backup >", value, "backup");
            return (Criteria) this;
        }

        public Criteria andBackupGreaterThanOrEqualTo(String value) {
            addCriterion("backup >=", value, "backup");
            return (Criteria) this;
        }

        public Criteria andBackupLessThan(String value) {
            addCriterion("backup <", value, "backup");
            return (Criteria) this;
        }

        public Criteria andBackupLessThanOrEqualTo(String value) {
            addCriterion("backup <=", value, "backup");
            return (Criteria) this;
        }

        public Criteria andBackupLike(String value) {
            addCriterion("backup like", value, "backup");
            return (Criteria) this;
        }

        public Criteria andBackupNotLike(String value) {
            addCriterion("backup not like", value, "backup");
            return (Criteria) this;
        }

        public Criteria andBackupIn(List<String> values) {
            addCriterion("backup in", values, "backup");
            return (Criteria) this;
        }

        public Criteria andBackupNotIn(List<String> values) {
            addCriterion("backup not in", values, "backup");
            return (Criteria) this;
        }

        public Criteria andBackupBetween(String value1, String value2) {
            addCriterion("backup between", value1, value2, "backup");
            return (Criteria) this;
        }

        public Criteria andBackupNotBetween(String value1, String value2) {
            addCriterion("backup not between", value1, value2, "backup");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}