/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Department;
import model.Student;

/**
 *
 * @author sonnt
 */
public class StudentDAO extends BaseDAO {
//    public int update(Student s) {
//        int n = 0 ; 
//        try {
//            String sql = "Update Student set sname =? ,sdate = ?,gender=?,did = ? where sid  =?";
//            PreparedStatement statement = connection.prepareStatement(sql);
//            statement.setString(1, s.getName());
//            statement.setBoolean(3, s.isGender());
//            statement.setDate(2, s.getDob());
//            statement.setInt(4, s.getDept().getId());
//            statement.setInt(5, s.getId());
//            n = statement.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return n ; 
//    }

    public void update(Student s) {
        try {
            String sql = "Update Student set sname=? gender=?dob=?where sid=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, s.getName());
            statement.setBoolean(2, s.isGender());
            statement.setDate(3, s.getDob());

            statement.setInt(5, s.getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void Delete(int sid) {
        try {
            String sql = "DELETE from Student where sid=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, sid);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void insert(Student s) {
        try {
            String sql = "INSERT INTO [Student]\n"
                    + "           ([sname]\n"
                    + "           ,[gender]\n"
                    + "           ,[dob]\n"
                    + "           ,[did])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, s.getName());
            statement.setBoolean(2, s.isGender());
            statement.setDate(3, s.getDob());
            statement.setInt(4, s.getDept().getId());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ArrayList<Student> getStudents() {
        ArrayList<Student> students = new ArrayList<>();
        String sql = "SELECT s.sid,s.sname,s.gender,s.dob,d.did,d.dname FROM Student s INNER JOIN Department d\n"
                + "ON s.did = d.did";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);

            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("sname"));
                s.setGender(rs.getBoolean("gender"));
                s.setDob(rs.getDate("dob"));
                Department d = new Department();
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                s.setDept(d);
                students.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }

    public ArrayList<Student> search(String name, int did) {
        ArrayList<Student> students = new ArrayList<>();
        String sql = "SELECT s.sid,s.sname,s.gender,s.dob,d.did,d.dname FROM Student s INNER JOIN Department d\n"
                + "                 ON s.did = d.did WHERE s.did=? and s.sname like ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
//            statement.setString(2,"%"+name+"%");
            statement.setInt(1, did);
            statement.setString(2, "%" + name + "%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("sname"));
                s.setGender(rs.getBoolean("gender"));
                s.setDob(rs.getDate("dob"));
                Department d = new Department();
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                s.setDept(d);
                students.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }

    public ArrayList<Student> searchAll(String name) {
        ArrayList<Student> students = new ArrayList<>();
        String sql = "SELECT s.sid,s.sname,s.gender,s.dob,d.did,d.dname FROM Student s INNER JOIN Department d\n"
                + "                 ON s.did = d.did WHERE s.sname like ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + name + "%");
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("sname"));
                s.setGender(rs.getBoolean("gender"));
                s.setDob(rs.getDate("dob"));
                Department d = new Department();
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                s.setDept(d);
                students.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }

    public Student getStudent(int id) {
        String sql = "SELECT s.sid,s.sname,s.gender,s.dob,d.did,d.dname FROM Student s INNER JOIN Department d\n"
                + "ON s.did = d.did WHERE s.sid = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("sname"));
                s.setGender(rs.getBoolean("gender"));
                s.setDob(rs.getDate("dob"));
                Department d = new Department();
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                s.setDept(d);
                return s;
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
