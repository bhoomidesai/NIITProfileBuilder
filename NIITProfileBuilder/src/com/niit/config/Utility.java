package com.niit.config;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Properties;

import com.niit.model.User;
import com.niit.model.UserRepository;

public class Utility {
	private static Connection con = null;
	private static String userName = null;
	private static String driverClass = null;
	private static String url = null;

	public static Connection createConnection() {
		try {

			String propFileName = "D:\\WS\\NIITResumeBuilder\\src\\db_config.properties";
			File file = new File(propFileName);
			FileInputStream fileInput = new FileInputStream(file);
			Properties properties = new Properties();
			properties.load(fileInput);
			fileInput.close();
			userName = properties.getProperty("user");
			driverClass = properties.getProperty("driver");
			url = properties.getProperty("url");
			Class.forName(driverClass);
			con = DriverManager.getConnection(url, userName, "");

			System.out.println("Connection Established");
			

		} catch (Exception e) {
			System.out.println("Exception :-- " + e);
			try {
				if (con != null)
					con.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		return con;
	}

	public static void main(String a[]) throws Exception {
		//Utility.createConnection();
		/*User user = new User();
		user.setName("hi");
		user.setPhoneNo("1234566989");
		user.setPassword("123");
		user.setAddress("baroda");
		user.setJobTitle("Ass");
		user.setProSkills("java, hbn");
		user.setPersonalSkills("singing");
		user.setEducation("BEIT");
		user.setEmail("abc@nni.com");
		user.setGender("Female");
		user.setMasterDegree("MSC");
		user.setStatus("experienced");
		user.setSscScore("56");
		user.setSscYear("2019");
		user.setHscScore("87");
		user.setHscYear("2019");
		user.setAchievement("");
		user.setProject("projects done!");
		
		UserRepository ur = new UserRepository();*/
		//ur.insertRecords(user);
		//ArrayList l = (ArrayList) ur.getAll();
		try {
			con.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
