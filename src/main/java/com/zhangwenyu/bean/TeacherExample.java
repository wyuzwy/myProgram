package com.zhangwenyu.bean;

import java.util.ArrayList;
import java.util.List;

public class TeacherExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TeacherExample() {
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

        public Criteria andTeacherIdIsNull() {
            addCriterion("teacher_id is null");
            return (Criteria) this;
        }

        public Criteria andTeacherIdIsNotNull() {
            addCriterion("teacher_id is not null");
            return (Criteria) this;
        }

        public Criteria andTeacherIdEqualTo(String value) {
            addCriterion("teacher_id =", value, "teacherId");
            return (Criteria) this;
        }

        public Criteria andTeacherIdNotEqualTo(String value) {
            addCriterion("teacher_id <>", value, "teacherId");
            return (Criteria) this;
        }

        public Criteria andTeacherIdGreaterThan(String value) {
            addCriterion("teacher_id >", value, "teacherId");
            return (Criteria) this;
        }

        public Criteria andTeacherIdGreaterThanOrEqualTo(String value) {
            addCriterion("teacher_id >=", value, "teacherId");
            return (Criteria) this;
        }

        public Criteria andTeacherIdLessThan(String value) {
            addCriterion("teacher_id <", value, "teacherId");
            return (Criteria) this;
        }

        public Criteria andTeacherIdLessThanOrEqualTo(String value) {
            addCriterion("teacher_id <=", value, "teacherId");
            return (Criteria) this;
        }

        public Criteria andTeacherIdLike(String value) {
            addCriterion("teacher_id like", value, "teacherId");
            return (Criteria) this;
        }

        public Criteria andTeacherIdNotLike(String value) {
            addCriterion("teacher_id not like", value, "teacherId");
            return (Criteria) this;
        }

        public Criteria andTeacherIdIn(List<String> values) {
            addCriterion("teacher_id in", values, "teacherId");
            return (Criteria) this;
        }

        public Criteria andTeacherIdNotIn(List<String> values) {
            addCriterion("teacher_id not in", values, "teacherId");
            return (Criteria) this;
        }

        public Criteria andTeacherIdBetween(String value1, String value2) {
            addCriterion("teacher_id between", value1, value2, "teacherId");
            return (Criteria) this;
        }

        public Criteria andTeacherIdNotBetween(String value1, String value2) {
            addCriterion("teacher_id not between", value1, value2, "teacherId");
            return (Criteria) this;
        }

        public Criteria andTeacherNameIsNull() {
            addCriterion("teacher_name is null");
            return (Criteria) this;
        }

        public Criteria andTeacherNameIsNotNull() {
            addCriterion("teacher_name is not null");
            return (Criteria) this;
        }

        public Criteria andTeacherNameEqualTo(String value) {
            addCriterion("teacher_name =", value, "teacherName");
            return (Criteria) this;
        }

        public Criteria andTeacherNameNotEqualTo(String value) {
            addCriterion("teacher_name <>", value, "teacherName");
            return (Criteria) this;
        }

        public Criteria andTeacherNameGreaterThan(String value) {
            addCriterion("teacher_name >", value, "teacherName");
            return (Criteria) this;
        }

        public Criteria andTeacherNameGreaterThanOrEqualTo(String value) {
            addCriterion("teacher_name >=", value, "teacherName");
            return (Criteria) this;
        }

        public Criteria andTeacherNameLessThan(String value) {
            addCriterion("teacher_name <", value, "teacherName");
            return (Criteria) this;
        }

        public Criteria andTeacherNameLessThanOrEqualTo(String value) {
            addCriterion("teacher_name <=", value, "teacherName");
            return (Criteria) this;
        }

        public Criteria andTeacherNameLike(String value) {
            addCriterion("teacher_name like", value, "teacherName");
            return (Criteria) this;
        }

        public Criteria andTeacherNameNotLike(String value) {
            addCriterion("teacher_name not like", value, "teacherName");
            return (Criteria) this;
        }

        public Criteria andTeacherNameIn(List<String> values) {
            addCriterion("teacher_name in", values, "teacherName");
            return (Criteria) this;
        }

        public Criteria andTeacherNameNotIn(List<String> values) {
            addCriterion("teacher_name not in", values, "teacherName");
            return (Criteria) this;
        }

        public Criteria andTeacherNameBetween(String value1, String value2) {
            addCriterion("teacher_name between", value1, value2, "teacherName");
            return (Criteria) this;
        }

        public Criteria andTeacherNameNotBetween(String value1, String value2) {
            addCriterion("teacher_name not between", value1, value2, "teacherName");
            return (Criteria) this;
        }

        public Criteria andTeacherDeptIsNull() {
            addCriterion("teacher_dept is null");
            return (Criteria) this;
        }

        public Criteria andTeacherDeptIsNotNull() {
            addCriterion("teacher_dept is not null");
            return (Criteria) this;
        }

        public Criteria andTeacherDeptEqualTo(String value) {
            addCriterion("teacher_dept =", value, "teacherDept");
            return (Criteria) this;
        }

        public Criteria andTeacherDeptNotEqualTo(String value) {
            addCriterion("teacher_dept <>", value, "teacherDept");
            return (Criteria) this;
        }

        public Criteria andTeacherDeptGreaterThan(String value) {
            addCriterion("teacher_dept >", value, "teacherDept");
            return (Criteria) this;
        }

        public Criteria andTeacherDeptGreaterThanOrEqualTo(String value) {
            addCriterion("teacher_dept >=", value, "teacherDept");
            return (Criteria) this;
        }

        public Criteria andTeacherDeptLessThan(String value) {
            addCriterion("teacher_dept <", value, "teacherDept");
            return (Criteria) this;
        }

        public Criteria andTeacherDeptLessThanOrEqualTo(String value) {
            addCriterion("teacher_dept <=", value, "teacherDept");
            return (Criteria) this;
        }

        public Criteria andTeacherDeptLike(String value) {
            addCriterion("teacher_dept like", value, "teacherDept");
            return (Criteria) this;
        }

        public Criteria andTeacherDeptNotLike(String value) {
            addCriterion("teacher_dept not like", value, "teacherDept");
            return (Criteria) this;
        }

        public Criteria andTeacherDeptIn(List<String> values) {
            addCriterion("teacher_dept in", values, "teacherDept");
            return (Criteria) this;
        }

        public Criteria andTeacherDeptNotIn(List<String> values) {
            addCriterion("teacher_dept not in", values, "teacherDept");
            return (Criteria) this;
        }

        public Criteria andTeacherDeptBetween(String value1, String value2) {
            addCriterion("teacher_dept between", value1, value2, "teacherDept");
            return (Criteria) this;
        }

        public Criteria andTeacherDeptNotBetween(String value1, String value2) {
            addCriterion("teacher_dept not between", value1, value2, "teacherDept");
            return (Criteria) this;
        }

        public Criteria andTeacherPhoneIsNull() {
            addCriterion("teacher_phone is null");
            return (Criteria) this;
        }

        public Criteria andTeacherPhoneIsNotNull() {
            addCriterion("teacher_phone is not null");
            return (Criteria) this;
        }

        public Criteria andTeacherPhoneEqualTo(String value) {
            addCriterion("teacher_phone =", value, "teacherPhone");
            return (Criteria) this;
        }

        public Criteria andTeacherPhoneNotEqualTo(String value) {
            addCriterion("teacher_phone <>", value, "teacherPhone");
            return (Criteria) this;
        }

        public Criteria andTeacherPhoneGreaterThan(String value) {
            addCriterion("teacher_phone >", value, "teacherPhone");
            return (Criteria) this;
        }

        public Criteria andTeacherPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("teacher_phone >=", value, "teacherPhone");
            return (Criteria) this;
        }

        public Criteria andTeacherPhoneLessThan(String value) {
            addCriterion("teacher_phone <", value, "teacherPhone");
            return (Criteria) this;
        }

        public Criteria andTeacherPhoneLessThanOrEqualTo(String value) {
            addCriterion("teacher_phone <=", value, "teacherPhone");
            return (Criteria) this;
        }

        public Criteria andTeacherPhoneLike(String value) {
            addCriterion("teacher_phone like", value, "teacherPhone");
            return (Criteria) this;
        }

        public Criteria andTeacherPhoneNotLike(String value) {
            addCriterion("teacher_phone not like", value, "teacherPhone");
            return (Criteria) this;
        }

        public Criteria andTeacherPhoneIn(List<String> values) {
            addCriterion("teacher_phone in", values, "teacherPhone");
            return (Criteria) this;
        }

        public Criteria andTeacherPhoneNotIn(List<String> values) {
            addCriterion("teacher_phone not in", values, "teacherPhone");
            return (Criteria) this;
        }

        public Criteria andTeacherPhoneBetween(String value1, String value2) {
            addCriterion("teacher_phone between", value1, value2, "teacherPhone");
            return (Criteria) this;
        }

        public Criteria andTeacherPhoneNotBetween(String value1, String value2) {
            addCriterion("teacher_phone not between", value1, value2, "teacherPhone");
            return (Criteria) this;
        }

        public Criteria andTeacherTelephoneIsNull() {
            addCriterion("teacher_telephone is null");
            return (Criteria) this;
        }

        public Criteria andTeacherTelephoneIsNotNull() {
            addCriterion("teacher_telephone is not null");
            return (Criteria) this;
        }

        public Criteria andTeacherTelephoneEqualTo(String value) {
            addCriterion("teacher_telephone =", value, "teacherTelephone");
            return (Criteria) this;
        }

        public Criteria andTeacherTelephoneNotEqualTo(String value) {
            addCriterion("teacher_telephone <>", value, "teacherTelephone");
            return (Criteria) this;
        }

        public Criteria andTeacherTelephoneGreaterThan(String value) {
            addCriterion("teacher_telephone >", value, "teacherTelephone");
            return (Criteria) this;
        }

        public Criteria andTeacherTelephoneGreaterThanOrEqualTo(String value) {
            addCriterion("teacher_telephone >=", value, "teacherTelephone");
            return (Criteria) this;
        }

        public Criteria andTeacherTelephoneLessThan(String value) {
            addCriterion("teacher_telephone <", value, "teacherTelephone");
            return (Criteria) this;
        }

        public Criteria andTeacherTelephoneLessThanOrEqualTo(String value) {
            addCriterion("teacher_telephone <=", value, "teacherTelephone");
            return (Criteria) this;
        }

        public Criteria andTeacherTelephoneLike(String value) {
            addCriterion("teacher_telephone like", value, "teacherTelephone");
            return (Criteria) this;
        }

        public Criteria andTeacherTelephoneNotLike(String value) {
            addCriterion("teacher_telephone not like", value, "teacherTelephone");
            return (Criteria) this;
        }

        public Criteria andTeacherTelephoneIn(List<String> values) {
            addCriterion("teacher_telephone in", values, "teacherTelephone");
            return (Criteria) this;
        }

        public Criteria andTeacherTelephoneNotIn(List<String> values) {
            addCriterion("teacher_telephone not in", values, "teacherTelephone");
            return (Criteria) this;
        }

        public Criteria andTeacherTelephoneBetween(String value1, String value2) {
            addCriterion("teacher_telephone between", value1, value2, "teacherTelephone");
            return (Criteria) this;
        }

        public Criteria andTeacherTelephoneNotBetween(String value1, String value2) {
            addCriterion("teacher_telephone not between", value1, value2, "teacherTelephone");
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