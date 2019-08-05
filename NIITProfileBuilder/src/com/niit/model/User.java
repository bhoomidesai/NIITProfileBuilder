package com.niit.model;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class User 
{
	private int userId;
	private String name;
	private String phoneNo;
	private String email;
	private String password;
	private String address;
	private String jobTitle;
	private String employer;
	private int experience;
	private String proSkills;
	private String personalSkills;
	private String certifications;
	private String education;
	private String gender;
	private String masterDegree;
	private String status;
	private String sscScore;
	private String sscYear;
	private String hscScore;
	private String hscYear;
	private String achievement;
	private String specialization;
	private String project;
	private String profile;
	private String expCertifications;
	
	private  Pattern emailNamePtrn = Pattern.compile("^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
	private  Pattern contactptrn = Pattern.compile("^[0-9]{10}$");
	List<String>  errorMap=new ArrayList<>();
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		if(!name.isEmpty())
		{
			this.name = name;
		}else
		{
			errorMap.add("Name Cannot be left Blank");
		}
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		Matcher mtch = contactptrn.matcher(phoneNo);
		if (mtch.matches()) {
			System.out.println("phoneNo matches");
			this.phoneNo = phoneNo;
		}else
		{
			errorMap.add( "Phone no. should be 10 in numeric digits");
		}
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		Matcher mtch = emailNamePtrn.matcher(email);
		if (mtch.matches()) {
			this.email = email;
		}
		else
		{
			errorMap.add("Invalid | Email Cannot be left Blank");
		}
	}
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		if(password.isEmpty())
		{errorMap.add("password Cannot be left Blank");
			
		}else
		{this.password = password;
			
		}
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getEmployer() {
		return employer;
	}
	public void setEmployer(String employer) {
		this.employer = employer;
	}
	public int getExperience() {
		return experience;
	}
	public void setExperience(int experience) {
		this.experience = experience;
	}
	public String getProSkills() {
		return proSkills;
	}
	public void setProSkills(String proSkills) {
		this.proSkills = proSkills;
	}
	public String getPersonalSkills() {
		return personalSkills;
	}
	public void setPersonalSkills(String personalSkills) {
		this.personalSkills = personalSkills;
	}
	public String getEducation() {
		return education;
	}
	
	public String getCertifications() {
		return certifications;
	}
	public void setCertifications(String certifications) {
		this.certifications = certifications;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMasterDegree() {
		return masterDegree;
	}
	public void setMasterDegree(String masterDegree) {
		this.masterDegree = masterDegree;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSscScore() {
		return sscScore;
	}
	public void setSscScore(String sscScore) {
		this.sscScore = sscScore;
	}
	public String getSscYear() {
		return sscYear;
	}
	public void setSscYear(String sscYear) {
		this.sscYear = sscYear;
	}
	public String getHscScore() {
		return hscScore;
	}
	public void setHscScore(String hscScore) {
		this.hscScore = hscScore;
	}
	public String getHscYear() {
		return hscYear;
	}
	public void setHscYear(String hscYear) {
		this.hscYear = hscYear;
	}
	public String getAchievement() {
		return achievement;
	}
	public void setAchievement(String achievement) {
		this.achievement = achievement;
	}
	public String getProject() {
		return project;
	}
	public void setProject(String project) {
		this.project = project;
	}
	public void setEducation(String education) {
			this.education = education;
	}
	public String getSpecialization() {
		return specialization;
	}
	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getExpCertifications() {
		return expCertifications;
	}
	public void setExpCertifications(String expCertifications) {
		this.expCertifications = expCertifications;
	}
	public List<String> getMap() {
		// TODO Auto-generated method stub
		return this.errorMap;
	}
}
