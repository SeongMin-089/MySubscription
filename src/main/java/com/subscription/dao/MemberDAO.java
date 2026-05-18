package com.subscription.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.subscription.dto.MemberDTO;
import com.subscription.util.DBconnect;

public class MemberDAO {

    public int insertMember(MemberDTO member) {
        int result = 0;

        String sql = "INSERT INTO member_tbl(user_id, password, name, email) VALUES (?, ?, ?, ?)";

        try (
            Connection conn = DBconnect.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setString(1, member.getUserId());
            pstmt.setString(2, member.getPassword());
            pstmt.setString(3, member.getName());
            pstmt.setString(4, member.getEmail());

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public MemberDTO login(String userId, String password) {
        MemberDTO member = null;

        String sql = "SELECT * FROM member_tbl WHERE user_id = ? AND password = ?";

        try (
            Connection conn = DBconnect.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setString(1, userId);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                member = new MemberDTO();
                member.setMemberNo(rs.getInt("member_no"));
                member.setUserId(rs.getString("user_id"));
                member.setPassword(rs.getString("password"));
                member.setName(rs.getString("name"));
                member.setEmail(rs.getString("email"));
                member.setRegdate(rs.getString("regdate"));
            }

            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return member;
    }
}