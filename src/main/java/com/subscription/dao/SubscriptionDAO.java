package com.subscription.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import com.subscription.dto.SubscriptionDTO;
import com.subscription.util.DBconnect;

public class SubscriptionDAO {

    public int insertSubscription(SubscriptionDTO subscription) {
        int result = 0;

        String sql = "INSERT INTO subscription_tbl(member_no, service_name, category, price, payment_day, memo, status) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (
            Connection conn = DBconnect.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setInt(1, subscription.getMemberNo());
            pstmt.setString(2, subscription.getServiceName());
            pstmt.setString(3, subscription.getCategory());
            pstmt.setInt(4, subscription.getPrice());
            pstmt.setInt(5, subscription.getPaymentDay());
            pstmt.setString(6, subscription.getMemo());
            pstmt.setString(7, subscription.getStatus());

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public ArrayList<SubscriptionDTO> getSubscriptionList(int memberNo) {
        ArrayList<SubscriptionDTO> list = new ArrayList<>();

        String sql = "SELECT * FROM subscription_tbl WHERE member_no = ? ORDER BY sub_no DESC";

        try (
            Connection conn = DBconnect.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setInt(1, memberNo);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                SubscriptionDTO subscription = new SubscriptionDTO();

                subscription.setSubNo(rs.getInt("sub_no"));
                subscription.setMemberNo(rs.getInt("member_no"));
                subscription.setServiceName(rs.getString("service_name"));
                subscription.setCategory(rs.getString("category"));
                subscription.setPrice(rs.getInt("price"));
                subscription.setPaymentDay(rs.getInt("payment_day"));
                subscription.setMemo(rs.getString("memo"));
                subscription.setStatus(rs.getString("status"));
                subscription.setRegdate(rs.getString("regdate"));

                list.add(subscription);
            }

            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public ArrayList<SubscriptionDTO> getSubscriptionList(int memberNo, String sort) {
        ArrayList<SubscriptionDTO> list = new ArrayList<>();

        String orderBy = "sub_no DESC";

        if ("priceDesc".equals(sort)) {
            orderBy = "price DESC";
        } else if ("priceAsc".equals(sort)) {
            orderBy = "price ASC";
        } else if ("paymentDay".equals(sort)) {
            orderBy = "payment_day ASC";
        } else if ("recent".equals(sort)) {
            orderBy = "regdate DESC";
        }

        String sql = "SELECT * FROM subscription_tbl WHERE member_no = ? ORDER BY " + orderBy;

        try (
            Connection conn = DBconnect.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setInt(1, memberNo);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                SubscriptionDTO subscription = new SubscriptionDTO();

                subscription.setSubNo(rs.getInt("sub_no"));
                subscription.setMemberNo(rs.getInt("member_no"));
                subscription.setServiceName(rs.getString("service_name"));
                subscription.setCategory(rs.getString("category"));
                subscription.setPrice(rs.getInt("price"));
                subscription.setPaymentDay(rs.getInt("payment_day"));
                subscription.setMemo(rs.getString("memo"));
                subscription.setStatus(rs.getString("status"));
                subscription.setRegdate(rs.getString("regdate"));

                list.add(subscription);
            }

            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public int getTotalPrice(int memberNo) {
        int total = 0;

        String sql = "SELECT SUM(price) total_price "
                   + "FROM subscription_tbl "
                   + "WHERE member_no = ? AND status != '해지'";

        try (
            Connection conn = DBconnect.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setInt(1, memberNo);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                total = rs.getInt("total_price");
            }

            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return total;
    }

    public Map<String, Integer> getCategoryTotalPrice(int memberNo) {
        Map<String, Integer> categoryMap = new HashMap<>();

        String sql = "SELECT category, SUM(price) total_price "
                   + "FROM subscription_tbl "
                   + "WHERE member_no = ? AND status != '해지' "
                   + "GROUP BY category "
                   + "ORDER BY total_price DESC";

        try (
            Connection conn = DBconnect.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setInt(1, memberNo);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                categoryMap.put(rs.getString("category"), rs.getInt("total_price"));
            }

            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return categoryMap;
    }

    public int deleteSubscription(int subNo, int memberNo) {
        int result = 0;

        String sql = "DELETE FROM subscription_tbl WHERE sub_no = ? AND member_no = ?";

        try (
            Connection conn = DBconnect.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setInt(1, subNo);
            pstmt.setInt(2, memberNo);

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public SubscriptionDTO getSubscription(int subNo, int memberNo) {
        SubscriptionDTO subscription = null;

        String sql = "SELECT * FROM subscription_tbl WHERE sub_no = ? AND member_no = ?";

        try (
            Connection conn = DBconnect.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setInt(1, subNo);
            pstmt.setInt(2, memberNo);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                subscription = new SubscriptionDTO();

                subscription.setSubNo(rs.getInt("sub_no"));
                subscription.setMemberNo(rs.getInt("member_no"));
                subscription.setServiceName(rs.getString("service_name"));
                subscription.setCategory(rs.getString("category"));
                subscription.setPrice(rs.getInt("price"));
                subscription.setPaymentDay(rs.getInt("payment_day"));
                subscription.setMemo(rs.getString("memo"));
                subscription.setStatus(rs.getString("status"));
                subscription.setRegdate(rs.getString("regdate"));
            }

            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return subscription;
    }

    public int updateSubscription(SubscriptionDTO subscription) {
        int result = 0;

        String sql = "UPDATE subscription_tbl "
                   + "SET service_name = ?, category = ?, price = ?, payment_day = ?, memo = ?, status = ? "
                   + "WHERE sub_no = ? AND member_no = ?";

        try (
            Connection conn = DBconnect.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setString(1, subscription.getServiceName());
            pstmt.setString(2, subscription.getCategory());
            pstmt.setInt(3, subscription.getPrice());
            pstmt.setInt(4, subscription.getPaymentDay());
            pstmt.setString(5, subscription.getMemo());
            pstmt.setString(6, subscription.getStatus());
            pstmt.setInt(7, subscription.getSubNo());
            pstmt.setInt(8, subscription.getMemberNo());

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}