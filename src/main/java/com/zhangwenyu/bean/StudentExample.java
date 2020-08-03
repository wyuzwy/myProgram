package com.zhangwenyu.bean;

import java.util.ArrayList;
import java.util.List;

public class StudentExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public StudentExample() {
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

        public Criteria andXhIsNull() {
            addCriterion("xh is null");
            return (Criteria) this;
        }

        public Criteria andXhIsNotNull() {
            addCriterion("xh is not null");
            return (Criteria) this;
        }

        public Criteria andXhEqualTo(String value) {
            addCriterion("xh =", value, "xh");
            return (Criteria) this;
        }

        public Criteria andXhNotEqualTo(String value) {
            addCriterion("xh <>", value, "xh");
            return (Criteria) this;
        }

        public Criteria andXhGreaterThan(String value) {
            addCriterion("xh >", value, "xh");
            return (Criteria) this;
        }

        public Criteria andXhGreaterThanOrEqualTo(String value) {
            addCriterion("xh >=", value, "xh");
            return (Criteria) this;
        }

        public Criteria andXhLessThan(String value) {
            addCriterion("xh <", value, "xh");
            return (Criteria) this;
        }

        public Criteria andXhLessThanOrEqualTo(String value) {
            addCriterion("xh <=", value, "xh");
            return (Criteria) this;
        }

        public Criteria andXhLike(String value) {
            addCriterion("xh like", value, "xh");
            return (Criteria) this;
        }

        public Criteria andXhNotLike(String value) {
            addCriterion("xh not like", value, "xh");
            return (Criteria) this;
        }

        public Criteria andXhIn(List<String> values) {
            addCriterion("xh in", values, "xh");
            return (Criteria) this;
        }

        public Criteria andXhNotIn(List<String> values) {
            addCriterion("xh not in", values, "xh");
            return (Criteria) this;
        }

        public Criteria andXhBetween(String value1, String value2) {
            addCriterion("xh between", value1, value2, "xh");
            return (Criteria) this;
        }

        public Criteria andXhNotBetween(String value1, String value2) {
            addCriterion("xh not between", value1, value2, "xh");
            return (Criteria) this;
        }

        public Criteria andXmIsNull() {
            addCriterion("xm is null");
            return (Criteria) this;
        }

        public Criteria andXmIsNotNull() {
            addCriterion("xm is not null");
            return (Criteria) this;
        }

        public Criteria andXmEqualTo(String value) {
            addCriterion("xm =", value, "xm");
            return (Criteria) this;
        }

        public Criteria andXmNotEqualTo(String value) {
            addCriterion("xm <>", value, "xm");
            return (Criteria) this;
        }

        public Criteria andXmGreaterThan(String value) {
            addCriterion("xm >", value, "xm");
            return (Criteria) this;
        }

        public Criteria andXmGreaterThanOrEqualTo(String value) {
            addCriterion("xm >=", value, "xm");
            return (Criteria) this;
        }

        public Criteria andXmLessThan(String value) {
            addCriterion("xm <", value, "xm");
            return (Criteria) this;
        }

        public Criteria andXmLessThanOrEqualTo(String value) {
            addCriterion("xm <=", value, "xm");
            return (Criteria) this;
        }

        public Criteria andXmLike(String value) {
            addCriterion("xm like", value, "xm");
            return (Criteria) this;
        }

        public Criteria andXmNotLike(String value) {
            addCriterion("xm not like", value, "xm");
            return (Criteria) this;
        }

        public Criteria andXmIn(List<String> values) {
            addCriterion("xm in", values, "xm");
            return (Criteria) this;
        }

        public Criteria andXmNotIn(List<String> values) {
            addCriterion("xm not in", values, "xm");
            return (Criteria) this;
        }

        public Criteria andXmBetween(String value1, String value2) {
            addCriterion("xm between", value1, value2, "xm");
            return (Criteria) this;
        }

        public Criteria andXmNotBetween(String value1, String value2) {
            addCriterion("xm not between", value1, value2, "xm");
            return (Criteria) this;
        }

        public Criteria andXbIsNull() {
            addCriterion("xb is null");
            return (Criteria) this;
        }

        public Criteria andXbIsNotNull() {
            addCriterion("xb is not null");
            return (Criteria) this;
        }

        public Criteria andXbEqualTo(Integer value) {
            addCriterion("xb =", value, "xb");
            return (Criteria) this;
        }

        public Criteria andXbNotEqualTo(Integer value) {
            addCriterion("xb <>", value, "xb");
            return (Criteria) this;
        }

        public Criteria andXbGreaterThan(Integer value) {
            addCriterion("xb >", value, "xb");
            return (Criteria) this;
        }

        public Criteria andXbGreaterThanOrEqualTo(Integer value) {
            addCriterion("xb >=", value, "xb");
            return (Criteria) this;
        }

        public Criteria andXbLessThan(Integer value) {
            addCriterion("xb <", value, "xb");
            return (Criteria) this;
        }

        public Criteria andXbLessThanOrEqualTo(Integer value) {
            addCriterion("xb <=", value, "xb");
            return (Criteria) this;
        }

        public Criteria andXbIn(List<Integer> values) {
            addCriterion("xb in", values, "xb");
            return (Criteria) this;
        }

        public Criteria andXbNotIn(List<Integer> values) {
            addCriterion("xb not in", values, "xb");
            return (Criteria) this;
        }

        public Criteria andXbBetween(Integer value1, Integer value2) {
            addCriterion("xb between", value1, value2, "xb");
            return (Criteria) this;
        }

        public Criteria andXbNotBetween(Integer value1, Integer value2) {
            addCriterion("xb not between", value1, value2, "xb");
            return (Criteria) this;
        }

        public Criteria andSfzhIsNull() {
            addCriterion("sfzh is null");
            return (Criteria) this;
        }

        public Criteria andSfzhIsNotNull() {
            addCriterion("sfzh is not null");
            return (Criteria) this;
        }

        public Criteria andSfzhEqualTo(String value) {
            addCriterion("sfzh =", value, "sfzh");
            return (Criteria) this;
        }

        public Criteria andSfzhNotEqualTo(String value) {
            addCriterion("sfzh <>", value, "sfzh");
            return (Criteria) this;
        }

        public Criteria andSfzhGreaterThan(String value) {
            addCriterion("sfzh >", value, "sfzh");
            return (Criteria) this;
        }

        public Criteria andSfzhGreaterThanOrEqualTo(String value) {
            addCriterion("sfzh >=", value, "sfzh");
            return (Criteria) this;
        }

        public Criteria andSfzhLessThan(String value) {
            addCriterion("sfzh <", value, "sfzh");
            return (Criteria) this;
        }

        public Criteria andSfzhLessThanOrEqualTo(String value) {
            addCriterion("sfzh <=", value, "sfzh");
            return (Criteria) this;
        }

        public Criteria andSfzhLike(String value) {
            addCriterion("sfzh like", value, "sfzh");
            return (Criteria) this;
        }

        public Criteria andSfzhNotLike(String value) {
            addCriterion("sfzh not like", value, "sfzh");
            return (Criteria) this;
        }

        public Criteria andSfzhIn(List<String> values) {
            addCriterion("sfzh in", values, "sfzh");
            return (Criteria) this;
        }

        public Criteria andSfzhNotIn(List<String> values) {
            addCriterion("sfzh not in", values, "sfzh");
            return (Criteria) this;
        }

        public Criteria andSfzhBetween(String value1, String value2) {
            addCriterion("sfzh between", value1, value2, "sfzh");
            return (Criteria) this;
        }

        public Criteria andSfzhNotBetween(String value1, String value2) {
            addCriterion("sfzh not between", value1, value2, "sfzh");
            return (Criteria) this;
        }

        public Criteria andCsrqIsNull() {
            addCriterion("csrq is null");
            return (Criteria) this;
        }

        public Criteria andCsrqIsNotNull() {
            addCriterion("csrq is not null");
            return (Criteria) this;
        }

        public Criteria andCsrqEqualTo(String value) {
            addCriterion("csrq =", value, "csrq");
            return (Criteria) this;
        }

        public Criteria andCsrqNotEqualTo(String value) {
            addCriterion("csrq <>", value, "csrq");
            return (Criteria) this;
        }

        public Criteria andCsrqGreaterThan(String value) {
            addCriterion("csrq >", value, "csrq");
            return (Criteria) this;
        }

        public Criteria andCsrqGreaterThanOrEqualTo(String value) {
            addCriterion("csrq >=", value, "csrq");
            return (Criteria) this;
        }

        public Criteria andCsrqLessThan(String value) {
            addCriterion("csrq <", value, "csrq");
            return (Criteria) this;
        }

        public Criteria andCsrqLessThanOrEqualTo(String value) {
            addCriterion("csrq <=", value, "csrq");
            return (Criteria) this;
        }

        public Criteria andCsrqLike(String value) {
            addCriterion("csrq like", value, "csrq");
            return (Criteria) this;
        }

        public Criteria andCsrqNotLike(String value) {
            addCriterion("csrq not like", value, "csrq");
            return (Criteria) this;
        }

        public Criteria andCsrqIn(List<String> values) {
            addCriterion("csrq in", values, "csrq");
            return (Criteria) this;
        }

        public Criteria andCsrqNotIn(List<String> values) {
            addCriterion("csrq not in", values, "csrq");
            return (Criteria) this;
        }

        public Criteria andCsrqBetween(String value1, String value2) {
            addCriterion("csrq between", value1, value2, "csrq");
            return (Criteria) this;
        }

        public Criteria andCsrqNotBetween(String value1, String value2) {
            addCriterion("csrq not between", value1, value2, "csrq");
            return (Criteria) this;
        }

        public Criteria andZzmmIsNull() {
            addCriterion("zzmm is null");
            return (Criteria) this;
        }

        public Criteria andZzmmIsNotNull() {
            addCriterion("zzmm is not null");
            return (Criteria) this;
        }

        public Criteria andZzmmEqualTo(String value) {
            addCriterion("zzmm =", value, "zzmm");
            return (Criteria) this;
        }

        public Criteria andZzmmNotEqualTo(String value) {
            addCriterion("zzmm <>", value, "zzmm");
            return (Criteria) this;
        }

        public Criteria andZzmmGreaterThan(String value) {
            addCriterion("zzmm >", value, "zzmm");
            return (Criteria) this;
        }

        public Criteria andZzmmGreaterThanOrEqualTo(String value) {
            addCriterion("zzmm >=", value, "zzmm");
            return (Criteria) this;
        }

        public Criteria andZzmmLessThan(String value) {
            addCriterion("zzmm <", value, "zzmm");
            return (Criteria) this;
        }

        public Criteria andZzmmLessThanOrEqualTo(String value) {
            addCriterion("zzmm <=", value, "zzmm");
            return (Criteria) this;
        }

        public Criteria andZzmmLike(String value) {
            addCriterion("zzmm like", value, "zzmm");
            return (Criteria) this;
        }

        public Criteria andZzmmNotLike(String value) {
            addCriterion("zzmm not like", value, "zzmm");
            return (Criteria) this;
        }

        public Criteria andZzmmIn(List<String> values) {
            addCriterion("zzmm in", values, "zzmm");
            return (Criteria) this;
        }

        public Criteria andZzmmNotIn(List<String> values) {
            addCriterion("zzmm not in", values, "zzmm");
            return (Criteria) this;
        }

        public Criteria andZzmmBetween(String value1, String value2) {
            addCriterion("zzmm between", value1, value2, "zzmm");
            return (Criteria) this;
        }

        public Criteria andZzmmNotBetween(String value1, String value2) {
            addCriterion("zzmm not between", value1, value2, "zzmm");
            return (Criteria) this;
        }

        public Criteria andMzIsNull() {
            addCriterion("mz is null");
            return (Criteria) this;
        }

        public Criteria andMzIsNotNull() {
            addCriterion("mz is not null");
            return (Criteria) this;
        }

        public Criteria andMzEqualTo(String value) {
            addCriterion("mz =", value, "mz");
            return (Criteria) this;
        }

        public Criteria andMzNotEqualTo(String value) {
            addCriterion("mz <>", value, "mz");
            return (Criteria) this;
        }

        public Criteria andMzGreaterThan(String value) {
            addCriterion("mz >", value, "mz");
            return (Criteria) this;
        }

        public Criteria andMzGreaterThanOrEqualTo(String value) {
            addCriterion("mz >=", value, "mz");
            return (Criteria) this;
        }

        public Criteria andMzLessThan(String value) {
            addCriterion("mz <", value, "mz");
            return (Criteria) this;
        }

        public Criteria andMzLessThanOrEqualTo(String value) {
            addCriterion("mz <=", value, "mz");
            return (Criteria) this;
        }

        public Criteria andMzLike(String value) {
            addCriterion("mz like", value, "mz");
            return (Criteria) this;
        }

        public Criteria andMzNotLike(String value) {
            addCriterion("mz not like", value, "mz");
            return (Criteria) this;
        }

        public Criteria andMzIn(List<String> values) {
            addCriterion("mz in", values, "mz");
            return (Criteria) this;
        }

        public Criteria andMzNotIn(List<String> values) {
            addCriterion("mz not in", values, "mz");
            return (Criteria) this;
        }

        public Criteria andMzBetween(String value1, String value2) {
            addCriterion("mz between", value1, value2, "mz");
            return (Criteria) this;
        }

        public Criteria andMzNotBetween(String value1, String value2) {
            addCriterion("mz not between", value1, value2, "mz");
            return (Criteria) this;
        }

        public Criteria andSydIsNull() {
            addCriterion("syd is null");
            return (Criteria) this;
        }

        public Criteria andSydIsNotNull() {
            addCriterion("syd is not null");
            return (Criteria) this;
        }

        public Criteria andSydEqualTo(String value) {
            addCriterion("syd =", value, "syd");
            return (Criteria) this;
        }

        public Criteria andSydNotEqualTo(String value) {
            addCriterion("syd <>", value, "syd");
            return (Criteria) this;
        }

        public Criteria andSydGreaterThan(String value) {
            addCriterion("syd >", value, "syd");
            return (Criteria) this;
        }

        public Criteria andSydGreaterThanOrEqualTo(String value) {
            addCriterion("syd >=", value, "syd");
            return (Criteria) this;
        }

        public Criteria andSydLessThan(String value) {
            addCriterion("syd <", value, "syd");
            return (Criteria) this;
        }

        public Criteria andSydLessThanOrEqualTo(String value) {
            addCriterion("syd <=", value, "syd");
            return (Criteria) this;
        }

        public Criteria andSydLike(String value) {
            addCriterion("syd like", value, "syd");
            return (Criteria) this;
        }

        public Criteria andSydNotLike(String value) {
            addCriterion("syd not like", value, "syd");
            return (Criteria) this;
        }

        public Criteria andSydIn(List<String> values) {
            addCriterion("syd in", values, "syd");
            return (Criteria) this;
        }

        public Criteria andSydNotIn(List<String> values) {
            addCriterion("syd not in", values, "syd");
            return (Criteria) this;
        }

        public Criteria andSydBetween(String value1, String value2) {
            addCriterion("syd between", value1, value2, "syd");
            return (Criteria) this;
        }

        public Criteria andSydNotBetween(String value1, String value2) {
            addCriterion("syd not between", value1, value2, "syd");
            return (Criteria) this;
        }

        public Criteria andSjhmIsNull() {
            addCriterion("sjhm is null");
            return (Criteria) this;
        }

        public Criteria andSjhmIsNotNull() {
            addCriterion("sjhm is not null");
            return (Criteria) this;
        }

        public Criteria andSjhmEqualTo(String value) {
            addCriterion("sjhm =", value, "sjhm");
            return (Criteria) this;
        }

        public Criteria andSjhmNotEqualTo(String value) {
            addCriterion("sjhm <>", value, "sjhm");
            return (Criteria) this;
        }

        public Criteria andSjhmGreaterThan(String value) {
            addCriterion("sjhm >", value, "sjhm");
            return (Criteria) this;
        }

        public Criteria andSjhmGreaterThanOrEqualTo(String value) {
            addCriterion("sjhm >=", value, "sjhm");
            return (Criteria) this;
        }

        public Criteria andSjhmLessThan(String value) {
            addCriterion("sjhm <", value, "sjhm");
            return (Criteria) this;
        }

        public Criteria andSjhmLessThanOrEqualTo(String value) {
            addCriterion("sjhm <=", value, "sjhm");
            return (Criteria) this;
        }

        public Criteria andSjhmLike(String value) {
            addCriterion("sjhm like", value, "sjhm");
            return (Criteria) this;
        }

        public Criteria andSjhmNotLike(String value) {
            addCriterion("sjhm not like", value, "sjhm");
            return (Criteria) this;
        }

        public Criteria andSjhmIn(List<String> values) {
            addCriterion("sjhm in", values, "sjhm");
            return (Criteria) this;
        }

        public Criteria andSjhmNotIn(List<String> values) {
            addCriterion("sjhm not in", values, "sjhm");
            return (Criteria) this;
        }

        public Criteria andSjhmBetween(String value1, String value2) {
            addCriterion("sjhm between", value1, value2, "sjhm");
            return (Criteria) this;
        }

        public Criteria andSjhmNotBetween(String value1, String value2) {
            addCriterion("sjhm not between", value1, value2, "sjhm");
            return (Criteria) this;
        }

        public Criteria andDzyxIsNull() {
            addCriterion("dzyx is null");
            return (Criteria) this;
        }

        public Criteria andDzyxIsNotNull() {
            addCriterion("dzyx is not null");
            return (Criteria) this;
        }

        public Criteria andDzyxEqualTo(String value) {
            addCriterion("dzyx =", value, "dzyx");
            return (Criteria) this;
        }

        public Criteria andDzyxNotEqualTo(String value) {
            addCriterion("dzyx <>", value, "dzyx");
            return (Criteria) this;
        }

        public Criteria andDzyxGreaterThan(String value) {
            addCriterion("dzyx >", value, "dzyx");
            return (Criteria) this;
        }

        public Criteria andDzyxGreaterThanOrEqualTo(String value) {
            addCriterion("dzyx >=", value, "dzyx");
            return (Criteria) this;
        }

        public Criteria andDzyxLessThan(String value) {
            addCriterion("dzyx <", value, "dzyx");
            return (Criteria) this;
        }

        public Criteria andDzyxLessThanOrEqualTo(String value) {
            addCriterion("dzyx <=", value, "dzyx");
            return (Criteria) this;
        }

        public Criteria andDzyxLike(String value) {
            addCriterion("dzyx like", value, "dzyx");
            return (Criteria) this;
        }

        public Criteria andDzyxNotLike(String value) {
            addCriterion("dzyx not like", value, "dzyx");
            return (Criteria) this;
        }

        public Criteria andDzyxIn(List<String> values) {
            addCriterion("dzyx in", values, "dzyx");
            return (Criteria) this;
        }

        public Criteria andDzyxNotIn(List<String> values) {
            addCriterion("dzyx not in", values, "dzyx");
            return (Criteria) this;
        }

        public Criteria andDzyxBetween(String value1, String value2) {
            addCriterion("dzyx between", value1, value2, "dzyx");
            return (Criteria) this;
        }

        public Criteria andDzyxNotBetween(String value1, String value2) {
            addCriterion("dzyx not between", value1, value2, "dzyx");
            return (Criteria) this;
        }

        public Criteria andJtdzIsNull() {
            addCriterion("jtdz is null");
            return (Criteria) this;
        }

        public Criteria andJtdzIsNotNull() {
            addCriterion("jtdz is not null");
            return (Criteria) this;
        }

        public Criteria andJtdzEqualTo(String value) {
            addCriterion("jtdz =", value, "jtdz");
            return (Criteria) this;
        }

        public Criteria andJtdzNotEqualTo(String value) {
            addCriterion("jtdz <>", value, "jtdz");
            return (Criteria) this;
        }

        public Criteria andJtdzGreaterThan(String value) {
            addCriterion("jtdz >", value, "jtdz");
            return (Criteria) this;
        }

        public Criteria andJtdzGreaterThanOrEqualTo(String value) {
            addCriterion("jtdz >=", value, "jtdz");
            return (Criteria) this;
        }

        public Criteria andJtdzLessThan(String value) {
            addCriterion("jtdz <", value, "jtdz");
            return (Criteria) this;
        }

        public Criteria andJtdzLessThanOrEqualTo(String value) {
            addCriterion("jtdz <=", value, "jtdz");
            return (Criteria) this;
        }

        public Criteria andJtdzLike(String value) {
            addCriterion("jtdz like", value, "jtdz");
            return (Criteria) this;
        }

        public Criteria andJtdzNotLike(String value) {
            addCriterion("jtdz not like", value, "jtdz");
            return (Criteria) this;
        }

        public Criteria andJtdzIn(List<String> values) {
            addCriterion("jtdz in", values, "jtdz");
            return (Criteria) this;
        }

        public Criteria andJtdzNotIn(List<String> values) {
            addCriterion("jtdz not in", values, "jtdz");
            return (Criteria) this;
        }

        public Criteria andJtdzBetween(String value1, String value2) {
            addCriterion("jtdz between", value1, value2, "jtdz");
            return (Criteria) this;
        }

        public Criteria andJtdzNotBetween(String value1, String value2) {
            addCriterion("jtdz not between", value1, value2, "jtdz");
            return (Criteria) this;
        }

        public Criteria andJtybIsNull() {
            addCriterion("jtyb is null");
            return (Criteria) this;
        }

        public Criteria andJtybIsNotNull() {
            addCriterion("jtyb is not null");
            return (Criteria) this;
        }

        public Criteria andJtybEqualTo(String value) {
            addCriterion("jtyb =", value, "jtyb");
            return (Criteria) this;
        }

        public Criteria andJtybNotEqualTo(String value) {
            addCriterion("jtyb <>", value, "jtyb");
            return (Criteria) this;
        }

        public Criteria andJtybGreaterThan(String value) {
            addCriterion("jtyb >", value, "jtyb");
            return (Criteria) this;
        }

        public Criteria andJtybGreaterThanOrEqualTo(String value) {
            addCriterion("jtyb >=", value, "jtyb");
            return (Criteria) this;
        }

        public Criteria andJtybLessThan(String value) {
            addCriterion("jtyb <", value, "jtyb");
            return (Criteria) this;
        }

        public Criteria andJtybLessThanOrEqualTo(String value) {
            addCriterion("jtyb <=", value, "jtyb");
            return (Criteria) this;
        }

        public Criteria andJtybLike(String value) {
            addCriterion("jtyb like", value, "jtyb");
            return (Criteria) this;
        }

        public Criteria andJtybNotLike(String value) {
            addCriterion("jtyb not like", value, "jtyb");
            return (Criteria) this;
        }

        public Criteria andJtybIn(List<String> values) {
            addCriterion("jtyb in", values, "jtyb");
            return (Criteria) this;
        }

        public Criteria andJtybNotIn(List<String> values) {
            addCriterion("jtyb not in", values, "jtyb");
            return (Criteria) this;
        }

        public Criteria andJtybBetween(String value1, String value2) {
            addCriterion("jtyb between", value1, value2, "jtyb");
            return (Criteria) this;
        }

        public Criteria andJtybNotBetween(String value1, String value2) {
            addCriterion("jtyb not between", value1, value2, "jtyb");
            return (Criteria) this;
        }

        public Criteria andXxmcIsNull() {
            addCriterion("xxmc is null");
            return (Criteria) this;
        }

        public Criteria andXxmcIsNotNull() {
            addCriterion("xxmc is not null");
            return (Criteria) this;
        }

        public Criteria andXxmcEqualTo(String value) {
            addCriterion("xxmc =", value, "xxmc");
            return (Criteria) this;
        }

        public Criteria andXxmcNotEqualTo(String value) {
            addCriterion("xxmc <>", value, "xxmc");
            return (Criteria) this;
        }

        public Criteria andXxmcGreaterThan(String value) {
            addCriterion("xxmc >", value, "xxmc");
            return (Criteria) this;
        }

        public Criteria andXxmcGreaterThanOrEqualTo(String value) {
            addCriterion("xxmc >=", value, "xxmc");
            return (Criteria) this;
        }

        public Criteria andXxmcLessThan(String value) {
            addCriterion("xxmc <", value, "xxmc");
            return (Criteria) this;
        }

        public Criteria andXxmcLessThanOrEqualTo(String value) {
            addCriterion("xxmc <=", value, "xxmc");
            return (Criteria) this;
        }

        public Criteria andXxmcLike(String value) {
            addCriterion("xxmc like", value, "xxmc");
            return (Criteria) this;
        }

        public Criteria andXxmcNotLike(String value) {
            addCriterion("xxmc not like", value, "xxmc");
            return (Criteria) this;
        }

        public Criteria andXxmcIn(List<String> values) {
            addCriterion("xxmc in", values, "xxmc");
            return (Criteria) this;
        }

        public Criteria andXxmcNotIn(List<String> values) {
            addCriterion("xxmc not in", values, "xxmc");
            return (Criteria) this;
        }

        public Criteria andXxmcBetween(String value1, String value2) {
            addCriterion("xxmc between", value1, value2, "xxmc");
            return (Criteria) this;
        }

        public Criteria andXxmcNotBetween(String value1, String value2) {
            addCriterion("xxmc not between", value1, value2, "xxmc");
            return (Criteria) this;
        }

        public Criteria andXqIsNull() {
            addCriterion("xq is null");
            return (Criteria) this;
        }

        public Criteria andXqIsNotNull() {
            addCriterion("xq is not null");
            return (Criteria) this;
        }

        public Criteria andXqEqualTo(String value) {
            addCriterion("xq =", value, "xq");
            return (Criteria) this;
        }

        public Criteria andXqNotEqualTo(String value) {
            addCriterion("xq <>", value, "xq");
            return (Criteria) this;
        }

        public Criteria andXqGreaterThan(String value) {
            addCriterion("xq >", value, "xq");
            return (Criteria) this;
        }

        public Criteria andXqGreaterThanOrEqualTo(String value) {
            addCriterion("xq >=", value, "xq");
            return (Criteria) this;
        }

        public Criteria andXqLessThan(String value) {
            addCriterion("xq <", value, "xq");
            return (Criteria) this;
        }

        public Criteria andXqLessThanOrEqualTo(String value) {
            addCriterion("xq <=", value, "xq");
            return (Criteria) this;
        }

        public Criteria andXqLike(String value) {
            addCriterion("xq like", value, "xq");
            return (Criteria) this;
        }

        public Criteria andXqNotLike(String value) {
            addCriterion("xq not like", value, "xq");
            return (Criteria) this;
        }

        public Criteria andXqIn(List<String> values) {
            addCriterion("xq in", values, "xq");
            return (Criteria) this;
        }

        public Criteria andXqNotIn(List<String> values) {
            addCriterion("xq not in", values, "xq");
            return (Criteria) this;
        }

        public Criteria andXqBetween(String value1, String value2) {
            addCriterion("xq between", value1, value2, "xq");
            return (Criteria) this;
        }

        public Criteria andXqNotBetween(String value1, String value2) {
            addCriterion("xq not between", value1, value2, "xq");
            return (Criteria) this;
        }

        public Criteria andXyIsNull() {
            addCriterion("xy is null");
            return (Criteria) this;
        }

        public Criteria andXyIsNotNull() {
            addCriterion("xy is not null");
            return (Criteria) this;
        }

        public Criteria andXyEqualTo(String value) {
            addCriterion("xy =", value, "xy");
            return (Criteria) this;
        }

        public Criteria andXyNotEqualTo(String value) {
            addCriterion("xy <>", value, "xy");
            return (Criteria) this;
        }

        public Criteria andXyGreaterThan(String value) {
            addCriterion("xy >", value, "xy");
            return (Criteria) this;
        }

        public Criteria andXyGreaterThanOrEqualTo(String value) {
            addCriterion("xy >=", value, "xy");
            return (Criteria) this;
        }

        public Criteria andXyLessThan(String value) {
            addCriterion("xy <", value, "xy");
            return (Criteria) this;
        }

        public Criteria andXyLessThanOrEqualTo(String value) {
            addCriterion("xy <=", value, "xy");
            return (Criteria) this;
        }

        public Criteria andXyLike(String value) {
            addCriterion("xy like", value, "xy");
            return (Criteria) this;
        }

        public Criteria andXyNotLike(String value) {
            addCriterion("xy not like", value, "xy");
            return (Criteria) this;
        }

        public Criteria andXyIn(List<String> values) {
            addCriterion("xy in", values, "xy");
            return (Criteria) this;
        }

        public Criteria andXyNotIn(List<String> values) {
            addCriterion("xy not in", values, "xy");
            return (Criteria) this;
        }

        public Criteria andXyBetween(String value1, String value2) {
            addCriterion("xy between", value1, value2, "xy");
            return (Criteria) this;
        }

        public Criteria andXyNotBetween(String value1, String value2) {
            addCriterion("xy not between", value1, value2, "xy");
            return (Criteria) this;
        }

        public Criteria andXlIsNull() {
            addCriterion("xl is null");
            return (Criteria) this;
        }

        public Criteria andXlIsNotNull() {
            addCriterion("xl is not null");
            return (Criteria) this;
        }

        public Criteria andXlEqualTo(String value) {
            addCriterion("xl =", value, "xl");
            return (Criteria) this;
        }

        public Criteria andXlNotEqualTo(String value) {
            addCriterion("xl <>", value, "xl");
            return (Criteria) this;
        }

        public Criteria andXlGreaterThan(String value) {
            addCriterion("xl >", value, "xl");
            return (Criteria) this;
        }

        public Criteria andXlGreaterThanOrEqualTo(String value) {
            addCriterion("xl >=", value, "xl");
            return (Criteria) this;
        }

        public Criteria andXlLessThan(String value) {
            addCriterion("xl <", value, "xl");
            return (Criteria) this;
        }

        public Criteria andXlLessThanOrEqualTo(String value) {
            addCriterion("xl <=", value, "xl");
            return (Criteria) this;
        }

        public Criteria andXlLike(String value) {
            addCriterion("xl like", value, "xl");
            return (Criteria) this;
        }

        public Criteria andXlNotLike(String value) {
            addCriterion("xl not like", value, "xl");
            return (Criteria) this;
        }

        public Criteria andXlIn(List<String> values) {
            addCriterion("xl in", values, "xl");
            return (Criteria) this;
        }

        public Criteria andXlNotIn(List<String> values) {
            addCriterion("xl not in", values, "xl");
            return (Criteria) this;
        }

        public Criteria andXlBetween(String value1, String value2) {
            addCriterion("xl between", value1, value2, "xl");
            return (Criteria) this;
        }

        public Criteria andXlNotBetween(String value1, String value2) {
            addCriterion("xl not between", value1, value2, "xl");
            return (Criteria) this;
        }

        public Criteria andXzIsNull() {
            addCriterion("xz is null");
            return (Criteria) this;
        }

        public Criteria andXzIsNotNull() {
            addCriterion("xz is not null");
            return (Criteria) this;
        }

        public Criteria andXzEqualTo(String value) {
            addCriterion("xz =", value, "xz");
            return (Criteria) this;
        }

        public Criteria andXzNotEqualTo(String value) {
            addCriterion("xz <>", value, "xz");
            return (Criteria) this;
        }

        public Criteria andXzGreaterThan(String value) {
            addCriterion("xz >", value, "xz");
            return (Criteria) this;
        }

        public Criteria andXzGreaterThanOrEqualTo(String value) {
            addCriterion("xz >=", value, "xz");
            return (Criteria) this;
        }

        public Criteria andXzLessThan(String value) {
            addCriterion("xz <", value, "xz");
            return (Criteria) this;
        }

        public Criteria andXzLessThanOrEqualTo(String value) {
            addCriterion("xz <=", value, "xz");
            return (Criteria) this;
        }

        public Criteria andXzLike(String value) {
            addCriterion("xz like", value, "xz");
            return (Criteria) this;
        }

        public Criteria andXzNotLike(String value) {
            addCriterion("xz not like", value, "xz");
            return (Criteria) this;
        }

        public Criteria andXzIn(List<String> values) {
            addCriterion("xz in", values, "xz");
            return (Criteria) this;
        }

        public Criteria andXzNotIn(List<String> values) {
            addCriterion("xz not in", values, "xz");
            return (Criteria) this;
        }

        public Criteria andXzBetween(String value1, String value2) {
            addCriterion("xz between", value1, value2, "xz");
            return (Criteria) this;
        }

        public Criteria andXzNotBetween(String value1, String value2) {
            addCriterion("xz not between", value1, value2, "xz");
            return (Criteria) this;
        }

        public Criteria andZyIsNull() {
            addCriterion("zy is null");
            return (Criteria) this;
        }

        public Criteria andZyIsNotNull() {
            addCriterion("zy is not null");
            return (Criteria) this;
        }

        public Criteria andZyEqualTo(String value) {
            addCriterion("zy =", value, "zy");
            return (Criteria) this;
        }

        public Criteria andZyNotEqualTo(String value) {
            addCriterion("zy <>", value, "zy");
            return (Criteria) this;
        }

        public Criteria andZyGreaterThan(String value) {
            addCriterion("zy >", value, "zy");
            return (Criteria) this;
        }

        public Criteria andZyGreaterThanOrEqualTo(String value) {
            addCriterion("zy >=", value, "zy");
            return (Criteria) this;
        }

        public Criteria andZyLessThan(String value) {
            addCriterion("zy <", value, "zy");
            return (Criteria) this;
        }

        public Criteria andZyLessThanOrEqualTo(String value) {
            addCriterion("zy <=", value, "zy");
            return (Criteria) this;
        }

        public Criteria andZyLike(String value) {
            addCriterion("zy like", value, "zy");
            return (Criteria) this;
        }

        public Criteria andZyNotLike(String value) {
            addCriterion("zy not like", value, "zy");
            return (Criteria) this;
        }

        public Criteria andZyIn(List<String> values) {
            addCriterion("zy in", values, "zy");
            return (Criteria) this;
        }

        public Criteria andZyNotIn(List<String> values) {
            addCriterion("zy not in", values, "zy");
            return (Criteria) this;
        }

        public Criteria andZyBetween(String value1, String value2) {
            addCriterion("zy between", value1, value2, "zy");
            return (Criteria) this;
        }

        public Criteria andZyNotBetween(String value1, String value2) {
            addCriterion("zy not between", value1, value2, "zy");
            return (Criteria) this;
        }

        public Criteria andBjIsNull() {
            addCriterion("bj is null");
            return (Criteria) this;
        }

        public Criteria andBjIsNotNull() {
            addCriterion("bj is not null");
            return (Criteria) this;
        }

        public Criteria andBjEqualTo(String value) {
            addCriterion("bj =", value, "bj");
            return (Criteria) this;
        }

        public Criteria andBjNotEqualTo(String value) {
            addCriterion("bj <>", value, "bj");
            return (Criteria) this;
        }

        public Criteria andBjGreaterThan(String value) {
            addCriterion("bj >", value, "bj");
            return (Criteria) this;
        }

        public Criteria andBjGreaterThanOrEqualTo(String value) {
            addCriterion("bj >=", value, "bj");
            return (Criteria) this;
        }

        public Criteria andBjLessThan(String value) {
            addCriterion("bj <", value, "bj");
            return (Criteria) this;
        }

        public Criteria andBjLessThanOrEqualTo(String value) {
            addCriterion("bj <=", value, "bj");
            return (Criteria) this;
        }

        public Criteria andBjLike(String value) {
            addCriterion("bj like", value, "bj");
            return (Criteria) this;
        }

        public Criteria andBjNotLike(String value) {
            addCriterion("bj not like", value, "bj");
            return (Criteria) this;
        }

        public Criteria andBjIn(List<String> values) {
            addCriterion("bj in", values, "bj");
            return (Criteria) this;
        }

        public Criteria andBjNotIn(List<String> values) {
            addCriterion("bj not in", values, "bj");
            return (Criteria) this;
        }

        public Criteria andBjBetween(String value1, String value2) {
            addCriterion("bj between", value1, value2, "bj");
            return (Criteria) this;
        }

        public Criteria andBjNotBetween(String value1, String value2) {
            addCriterion("bj not between", value1, value2, "bj");
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

        public Criteria andConfirmDeptIsNull() {
            addCriterion("confirm_dept is null");
            return (Criteria) this;
        }

        public Criteria andConfirmDeptIsNotNull() {
            addCriterion("confirm_dept is not null");
            return (Criteria) this;
        }

        public Criteria andConfirmDeptEqualTo(String value) {
            addCriterion("confirm_dept =", value, "confirmDept");
            return (Criteria) this;
        }

        public Criteria andConfirmDeptNotEqualTo(String value) {
            addCriterion("confirm_dept <>", value, "confirmDept");
            return (Criteria) this;
        }

        public Criteria andConfirmDeptGreaterThan(String value) {
            addCriterion("confirm_dept >", value, "confirmDept");
            return (Criteria) this;
        }

        public Criteria andConfirmDeptGreaterThanOrEqualTo(String value) {
            addCriterion("confirm_dept >=", value, "confirmDept");
            return (Criteria) this;
        }

        public Criteria andConfirmDeptLessThan(String value) {
            addCriterion("confirm_dept <", value, "confirmDept");
            return (Criteria) this;
        }

        public Criteria andConfirmDeptLessThanOrEqualTo(String value) {
            addCriterion("confirm_dept <=", value, "confirmDept");
            return (Criteria) this;
        }

        public Criteria andConfirmDeptLike(String value) {
            addCriterion("confirm_dept like", value, "confirmDept");
            return (Criteria) this;
        }

        public Criteria andConfirmDeptNotLike(String value) {
            addCriterion("confirm_dept not like", value, "confirmDept");
            return (Criteria) this;
        }

        public Criteria andConfirmDeptIn(List<String> values) {
            addCriterion("confirm_dept in", values, "confirmDept");
            return (Criteria) this;
        }

        public Criteria andConfirmDeptNotIn(List<String> values) {
            addCriterion("confirm_dept not in", values, "confirmDept");
            return (Criteria) this;
        }

        public Criteria andConfirmDeptBetween(String value1, String value2) {
            addCriterion("confirm_dept between", value1, value2, "confirmDept");
            return (Criteria) this;
        }

        public Criteria andConfirmDeptNotBetween(String value1, String value2) {
            addCriterion("confirm_dept not between", value1, value2, "confirmDept");
            return (Criteria) this;
        }

        public Criteria andConfirmNameIsNull() {
            addCriterion("confirm_name is null");
            return (Criteria) this;
        }

        public Criteria andConfirmNameIsNotNull() {
            addCriterion("confirm_name is not null");
            return (Criteria) this;
        }

        public Criteria andConfirmNameEqualTo(String value) {
            addCriterion("confirm_name =", value, "confirmName");
            return (Criteria) this;
        }

        public Criteria andConfirmNameNotEqualTo(String value) {
            addCriterion("confirm_name <>", value, "confirmName");
            return (Criteria) this;
        }

        public Criteria andConfirmNameGreaterThan(String value) {
            addCriterion("confirm_name >", value, "confirmName");
            return (Criteria) this;
        }

        public Criteria andConfirmNameGreaterThanOrEqualTo(String value) {
            addCriterion("confirm_name >=", value, "confirmName");
            return (Criteria) this;
        }

        public Criteria andConfirmNameLessThan(String value) {
            addCriterion("confirm_name <", value, "confirmName");
            return (Criteria) this;
        }

        public Criteria andConfirmNameLessThanOrEqualTo(String value) {
            addCriterion("confirm_name <=", value, "confirmName");
            return (Criteria) this;
        }

        public Criteria andConfirmNameLike(String value) {
            addCriterion("confirm_name like", value, "confirmName");
            return (Criteria) this;
        }

        public Criteria andConfirmNameNotLike(String value) {
            addCriterion("confirm_name not like", value, "confirmName");
            return (Criteria) this;
        }

        public Criteria andConfirmNameIn(List<String> values) {
            addCriterion("confirm_name in", values, "confirmName");
            return (Criteria) this;
        }

        public Criteria andConfirmNameNotIn(List<String> values) {
            addCriterion("confirm_name not in", values, "confirmName");
            return (Criteria) this;
        }

        public Criteria andConfirmNameBetween(String value1, String value2) {
            addCriterion("confirm_name between", value1, value2, "confirmName");
            return (Criteria) this;
        }

        public Criteria andConfirmNameNotBetween(String value1, String value2) {
            addCriterion("confirm_name not between", value1, value2, "confirmName");
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

        public Criteria andEnsureTimeIsNull() {
            addCriterion("ensure_time is null");
            return (Criteria) this;
        }

        public Criteria andEnsureTimeIsNotNull() {
            addCriterion("ensure_time is not null");
            return (Criteria) this;
        }

        public Criteria andEnsureTimeEqualTo(String value) {
            addCriterion("ensure_time =", value, "ensureTime");
            return (Criteria) this;
        }

        public Criteria andEnsureTimeNotEqualTo(String value) {
            addCriterion("ensure_time <>", value, "ensureTime");
            return (Criteria) this;
        }

        public Criteria andEnsureTimeGreaterThan(String value) {
            addCriterion("ensure_time >", value, "ensureTime");
            return (Criteria) this;
        }

        public Criteria andEnsureTimeGreaterThanOrEqualTo(String value) {
            addCriterion("ensure_time >=", value, "ensureTime");
            return (Criteria) this;
        }

        public Criteria andEnsureTimeLessThan(String value) {
            addCriterion("ensure_time <", value, "ensureTime");
            return (Criteria) this;
        }

        public Criteria andEnsureTimeLessThanOrEqualTo(String value) {
            addCriterion("ensure_time <=", value, "ensureTime");
            return (Criteria) this;
        }

        public Criteria andEnsureTimeLike(String value) {
            addCriterion("ensure_time like", value, "ensureTime");
            return (Criteria) this;
        }

        public Criteria andEnsureTimeNotLike(String value) {
            addCriterion("ensure_time not like", value, "ensureTime");
            return (Criteria) this;
        }

        public Criteria andEnsureTimeIn(List<String> values) {
            addCriterion("ensure_time in", values, "ensureTime");
            return (Criteria) this;
        }

        public Criteria andEnsureTimeNotIn(List<String> values) {
            addCriterion("ensure_time not in", values, "ensureTime");
            return (Criteria) this;
        }

        public Criteria andEnsureTimeBetween(String value1, String value2) {
            addCriterion("ensure_time between", value1, value2, "ensureTime");
            return (Criteria) this;
        }

        public Criteria andEnsureTimeNotBetween(String value1, String value2) {
            addCriterion("ensure_time not between", value1, value2, "ensureTime");
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