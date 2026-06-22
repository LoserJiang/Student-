package dao;

import entity.ScoreStatResult;
import entity.Subject;
import util.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ScoreStatDAO {

    /**
     * 获取所有课程列表（用于下拉框）
     */
    public List<Subject> getAllSubjects() {
        List<Subject> list = new ArrayList<>();
        String sql = "SELECT sub_id, sub_name FROM subject";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DB.getConn();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Subject s = new Subject();
                // 修改为 setId 和 setName
                s.setId(rs.getInt("sub_id"));
                s.setName(rs.getString("sub_name"));
                list.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(conn, ps, rs);
        }
        return list;
    }

    /**
     * 根据课程ID统计成绩
     */
    public ScoreStatResult getStatBySubject(int subId) {
        ScoreStatResult result = new ScoreStatResult();
        String sql = "SELECT " +
                "COUNT(*) AS total, " +
                "AVG(sco_count) AS avg_score, " +
                "MAX(sco_count) AS max_score, " +
                "MIN(sco_count) AS min_score, " +
                "SUM(CASE WHEN sco_count BETWEEN 0 AND 59 THEN 1 ELSE 0 END) AS r1, " +
                "SUM(CASE WHEN sco_count BETWEEN 60 AND 69 THEN 1 ELSE 0 END) AS r2, " +
                "SUM(CASE WHEN sco_count BETWEEN 70 AND 79 THEN 1 ELSE 0 END) AS r3, " +
                "SUM(CASE WHEN sco_count BETWEEN 80 AND 89 THEN 1 ELSE 0 END) AS r4, " +
                "SUM(CASE WHEN sco_count BETWEEN 90 AND 100 THEN 1 ELSE 0 END) AS r5 " +
                "FROM score WHERE sub_id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = DB.getConn();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, subId);
            rs = ps.executeQuery();
            if (rs.next()) {
                result.setTotal(rs.getInt("total"));
                result.setAvgScore(rs.getDouble("avg_score"));
                result.setMaxScore(rs.getDouble("max_score"));
                result.setMinScore(rs.getDouble("min_score"));
                result.setRange1(rs.getInt("r1"));
                result.setRange2(rs.getInt("r2"));
                result.setRange3(rs.getInt("r3"));
                result.setRange4(rs.getInt("r4"));
                result.setRange5(rs.getInt("r5"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.close(conn, ps, rs);
        }
        return result;
    }
}