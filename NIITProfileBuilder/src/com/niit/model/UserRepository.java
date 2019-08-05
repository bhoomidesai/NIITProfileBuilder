package com.niit.model;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import com.niit.config.Utility;
import com.niit.model.User;

public class UserRepository {
	Connection con = null;
	Utility utility = null;
	User user = null;
	Statement st = null;
	PreparedStatement ps = null;
	public UserRepository() {
		utility=new Utility();
		con = utility.createConnection();
	}
	public boolean insertRecords(User user) throws ClassNotFoundException, SQLException, IOException, ParseException 
	{
		//con = utility.createConnection();
		ps = con.prepareStatement("insert into userdetail (name, phoneNo, email, password, address, jobTitle, employer, experience, proSkills, personalSkills, education, certifications,"
				+ "gender, masterDegree, status, sscScore, sscYear, hscScore, hscYear, achievement, project, specialization, profile, expCertifications) "
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
		ps.setString(1, user.getName());
		ps.setString(2, user.getPhoneNo());
		ps.setString(3, user.getEmail());
		ps.setString(4, user.getPassword());
		ps.setString(5, user.getAddress());
		ps.setString(6, user.getJobTitle());
		ps.setString(7, user.getEmployer());
		ps.setInt(8, user.getExperience());
		ps.setString(9, user.getProSkills());
		ps.setString(10, user.getPersonalSkills());
		ps.setString(11, user.getEducation());
		ps.setString(12, user.getCertifications());
		ps.setString(13, user.getGender());
		ps.setString(14, user.getMasterDegree());
		ps.setString(15, user.getStatus());
		ps.setString(16, user.getSscScore());
		ps.setString(17, user.getSscYear());
		ps.setString(18, user.getHscScore());
		ps.setString(19, user.getHscYear());
		ps.setString(20, user.getAchievement());
		ps.setString(21, user.getProject());
		ps.setString(22, user.getSpecialization());
		ps.setString(23, user.getProfile());
		ps.setString(24, user.getExpCertifications());
		int x = ps.executeUpdate();
		con.close();
		if (x > 0) {
			System.out.println("Row inserted");
			return true;
		} else {
			System.out.println("not inserted");
			return false;
		}
	}
	
	public boolean update(User user,String email) throws Exception 
	{
		
		PreparedStatement ps = con.prepareStatement("update USERDETAIL set 	"
				+ "name =?, 	phoneNo  =?, 	password  =?, 	address  =?, 	"
				+ "jobTitle   =?,	Employer   =?,	experience   =?, 	proSkills   =?,	"
				+ "personalSkills   =?,	education   =?, certifications =?, gender = ?, masterDegree = ?, "
				+ "status = ?, sscScore = ?, sscYear = ?, hscScore = ?, hscYear = ?, achievement = ?, project = ?, specialization = ?, profile = ?, expCertifications = ? "
				+ "where email = ? ");
		// accept data
		ps.setString(1, user.getName());	
		ps.setString(2, user.getPhoneNo());
		ps.setString(3, user.getPassword());
		ps.setString(4, user.getAddress());
		ps.setString(5, user.getJobTitle());
		ps.setString(6, user.getEmployer());
		ps.setInt(7, user.getExperience());
		ps.setString(8, user.getProSkills());
		ps.setString(9, user.getPersonalSkills());
		ps.setString(10, user.getEducation());
		ps.setString(11, user.getCertifications());
		ps.setString(12, user.getGender());
		ps.setString(13, user.getMasterDegree());
		ps.setString(14, user.getStatus());
		ps.setString(15, user.getSscScore());
		ps.setString(16, user.getSscYear());
		ps.setString(17, user.getHscScore());
		ps.setString(18, user.getHscYear());
		ps.setString(19, user.getAchievement());
		ps.setString(20, user.getProject());
		ps.setString(21, user.getSpecialization());
		ps.setString(22, user.getProfile());
		ps.setString(23,user.getExpCertifications());
		ps.setString(24, user.getEmail());
		
		int x = ps.executeUpdate();
		con.close();
		if (x > 0) {
			System.out.println("Row Updated");
			con.close();
			return true;
		} else {
			System.out.println("not Updated");
			con.close();
			return false;
		}
	}
	public boolean delete(String email) throws Exception
	{
		PreparedStatement ps = con.prepareStatement("delete from USERDETAIL where email = ?  ");
		ps.setString(1, email);
		int x = ps.executeUpdate();
		con.close();
		if (x > 0) {
			System.out.println("Row deleted");
			return true;
		} else {
			System.out.println("not deleted");
			return false;
		}
	}
	public User getById(String email) throws Exception
	{
		user = new User();
		PreparedStatement ps = con.prepareStatement("Select * from USERDETAIL where email = ?  ");
		ps.setString(1, email);
		ResultSet rs =  ps.executeQuery();
		while(rs.next())
		{
			user.setName(rs.getString("name"));
			user.setPhoneNo(rs.getString("phoneNo"));
			user.setPassword(rs.getString("password"));
			user.setAddress(rs.getString("address"));
			user.setJobTitle(rs.getString("jobTitle"));
			user.setEmployer(rs.getString("employer"));
			user.setExperience(rs.getInt("experience"));
			user.setProSkills(rs.getString("proSkills"));
			user.setPersonalSkills(rs.getString("personalSkills"));
			user.setEducation(rs.getString("education"));
			user.setCertifications(rs.getString("certifications"));
			user.setEmail(rs.getString("email"));
			user.setGender(rs.getString("gender"));
			user.setMasterDegree(rs.getString("masterDegree"));
			user.setStatus(rs.getString("status"));
			user.setSscScore(rs.getString("sscScore"));
			user.setSscYear(rs.getString("sscYear"));
			user.setHscScore(rs.getString("hscScore"));
			user.setHscYear(rs.getString("hscYear"));
			user.setAchievement(rs.getString("achievement"));
			user.setProject(rs.getString("project"));
			user.setSpecialization(rs.getString("specialization"));
			user.setProfile(rs.getString("profile"));
			user.setExpCertifications(rs.getString("expCertifications"));
		}
		con.close();
		return user;
	}
	public int validateUser (String email,String password) throws SQLException
	{
		user= new User();
		int count=0;
		try {
			st = con.createStatement();
			
			PreparedStatement ps = con.prepareStatement("select * from USERDETAIL where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
				count++;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			con.close();
		}
		return count;
	}
	public List<User> getAll() throws Exception
	{
		ps = con.prepareStatement("select * from USERDETAIL;");
		
		List<User> list=new ArrayList<User>();
		user= new User();
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			user.setName(rs.getString("name"));
			user.setPhoneNo(rs.getString("phoneNo"));
			user.setPassword(rs.getString("password"));
			user.setAddress(rs.getString("address"));
			user.setJobTitle(rs.getString("jobTitle"));
			user.setEmployer(rs.getString("employer"));
			user.setExperience(rs.getInt("experience"));
			user.setProSkills(rs.getString("proSkills"));
			user.setPersonalSkills(rs.getString("personalSkills"));
			user.setEducation(rs.getString("education"));
			user.setCertifications(rs.getString("certifications"));
			user.setEmail(rs.getString("email"));
			user.setGender(rs.getString("gender"));
			user.setMasterDegree(rs.getString("masterDegree"));
			user.setStatus(rs.getString("status"));
			user.setSscScore(rs.getString("sscScore"));
			user.setSscYear(rs.getString("sscYear"));
			user.setHscScore(rs.getString("hscScore"));
			user.setHscYear(rs.getString("hscYear"));
			user.setAchievement(rs.getString("achievement"));
			user.setProject(rs.getString("project"));
			user.setSpecialization(rs.getString("specialization"));
			user.setProfile(rs.getString("profile"));
			user.setExpCertifications(rs.getString("expCertifications"));
			list.add(user);
		}
		con.close();
		return list;
	}
	public List<User> getSearch(String word) throws Exception
	{
		ps = con.prepareStatement("select * from USERDETAIL where proskills like '"+word+"%' or personalSkills like '"+word+"%'");
		List<User> list=new ArrayList<User>();
		user= new User();
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			user.setName(rs.getString("name"));
			user.setPhoneNo(rs.getString("phoneNo"));
			user.setPassword(rs.getString("password"));
			user.setAddress(rs.getString("address"));
			user.setJobTitle(rs.getString("jobTitle"));
			user.setEmployer(rs.getString("employer"));
			user.setExperience(rs.getInt("experience"));
			user.setProSkills(rs.getString("proSkills"));
			user.setPersonalSkills(rs.getString("personalSkills"));
			user.setEducation(rs.getString("education"));
			user.setCertifications(rs.getString("certifications"));
			user.setEmail(rs.getString("email"));
			user.setGender(rs.getString("gender"));
			user.setMasterDegree(rs.getString("masterDegree"));
			user.setStatus(rs.getString("status"));
			user.setSscScore(rs.getString("sscScore"));
			user.setSscYear(rs.getString("sscYear"));
			user.setHscScore(rs.getString("hscScore"));
			user.setHscYear(rs.getString("hscYear"));
			user.setAchievement(rs.getString("achievement"));
			user.setProject(rs.getString("project"));
			user.setSpecialization(rs.getString("specialization"));
			user.setProfile(rs.getString("profile"));
			user.setExpCertifications(rs.getString("expCertifications"));
			list.add(user);
		}
		con.close();
		return list;
	}
}
