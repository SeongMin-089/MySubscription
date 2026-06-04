package com.subscription.dto;

public class SubscriptionDTO {
    private int subNo;
    private int memberNo;
    private String serviceName;
    private String category;
    private int price;
    private int paymentDay;
    private String memo;
    private String status;
    private String regdate;

    public SubscriptionDTO() {
    }

    public SubscriptionDTO(int subNo, int memberNo, String serviceName, String category,
                           int price, int paymentDay, String memo, String status, String regdate) {
        this.subNo = subNo;
        this.memberNo = memberNo;
        this.serviceName = serviceName;
        this.category = category;
        this.price = price;
        this.paymentDay = paymentDay;
        this.memo = memo;
        this.status = status;
        this.regdate = regdate;
    }

    public int getSubNo() {
        return subNo;
    }

    public void setSubNo(int subNo) {
        this.subNo = subNo;
    }

    public int getMemberNo() {
        return memberNo;
    }

    public void setMemberNo(int memberNo) {
        this.memberNo = memberNo;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getPaymentDay() {
        return paymentDay;
    }

    public void setPaymentDay(int paymentDay) {
        this.paymentDay = paymentDay;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }
}