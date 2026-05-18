package com.subscription.dto;

public class MemberDTO {
    private int memberNo;
    private String userId;
    private String password;
    private String name;
    private String email;
    private String regdate;

    public MemberDTO() {
    }

    public MemberDTO(int memberNo, String userId, String password, String name, String email, String regdate) {
        this.memberNo = memberNo;
        this.userId = userId;
        this.password = password;
        this.name = name;
        this.email = email;
        this.regdate = regdate;
    }

    public int getMemberNo() {
        return memberNo;
    }

    public void setMemberNo(int memberNo) {
        this.memberNo = memberNo;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }
}