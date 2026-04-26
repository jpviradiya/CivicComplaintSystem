package com.project.civic.repository;

import com.project.civic.dto.ComplaintDTO;
import com.project.civic.model.Complaint;
import com.project.civic.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ComplaintRepository {

    public void save(Complaint complaint) {

        String sql = "INSERT INTO complaints (title, description, status, user_id) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, complaint.getTitle());
            stmt.setString(2, complaint.getDescription());
            stmt.setString(3, complaint.getStatus());
            stmt.setInt(4, complaint.getUserId());

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Complaint> findByUserId(int userId) {

        List<Complaint> complaints = new ArrayList<>();
        String sql = "SELECT * FROM complaints WHERE user_id=?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Complaint c = new Complaint();
                c.setId(rs.getInt("id"));
                c.setTitle(rs.getString("title"));
                c.setDescription(rs.getString("description"));
                c.setStatus(rs.getString("status"));
                complaints.add(c);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return complaints;
    }

    public java.util.Map<String, Integer> getComplaintReport() {

        java.util.Map<String, Integer> report = new java.util.HashMap<>();

        String sql = "SELECT status, COUNT(*) as count FROM complaints GROUP BY status";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                report.put(rs.getString("status"), rs.getInt("count"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return report;
    }

    public List<Complaint> findAll() {

        List<Complaint> complaints = new ArrayList<>();
        String sql = "SELECT * FROM complaints";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Complaint c = new Complaint();
                c.setId(rs.getInt("id"));
                c.setTitle(rs.getString("title"));
                c.setDescription(rs.getString("description"));
                c.setStatus(rs.getString("status"));
                complaints.add(c);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return complaints;
    }

    public void updateStatus(int id, String status) {

        String sql = "UPDATE complaints SET status=? WHERE id=?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, status);
            stmt.setInt(2, id);

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public java.util.List<ComplaintDTO> findAllWithUsers() {
        java.util.List<ComplaintDTO> complaints = new java.util.ArrayList<>();
        String sql = "SELECT c.id, c.title, c.description, c.status, u.name as user_name " +
                     "FROM complaints c JOIN users u ON c.user_id = u.id";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                ComplaintDTO dto = new ComplaintDTO();
                dto.setId(rs.getInt("id"));
                dto.setTitle(rs.getString("title"));
                dto.setDescription(rs.getString("description"));
                dto.setStatus(rs.getString("status"));
                dto.setUserName(rs.getString("user_name"));
                complaints.add(dto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return complaints;
    }

    public ComplaintDTO findByIdWithUser(int id) {
        String sql = "SELECT c.id, c.title, c.description, c.status, u.name as user_name " +
                     "FROM complaints c JOIN users u ON c.user_id = u.id WHERE c.id = ?";
        ComplaintDTO dto = null;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    dto = new ComplaintDTO();
                    dto.setId(rs.getInt("id"));
                    dto.setTitle(rs.getString("title"));
                    dto.setDescription(rs.getString("description"));
                    dto.setStatus(rs.getString("status"));
                    dto.setUserName(rs.getString("user_name"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return dto;
    }
}