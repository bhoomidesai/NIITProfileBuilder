package com.niit.controller;

import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.niit.model.User;
import com.niit.model.UserRepository;


@WebServlet("/")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getServletPath();
		RequestDispatcher dispatcher;
		HttpSession session=request.getSession(true);
		switch(path)
		{
		case "/loginRedirect":		
				dispatcher = request.getRequestDispatcher("/login.jsp");
				dispatcher.forward(request, response);
	        break;
		case "/profile":
			User user = new User();
			UserRepository repository = new UserRepository();
			try {
				user = repository.getById(session.getAttribute("loggedUser").toString());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("user", user);
			dispatcher = request.getRequestDispatcher("/Profile.jsp");
			dispatcher.forward(request, response);
        break;
		case "/login":
				loginController(request,response);
			break;
		case "/regRedirect":
				dispatcher = request.getRequestDispatcher("/registration.jsp");
				dispatcher.forward(request, response);			
			break;
		case "/register":
				registrationController(request, response);
			break;
		case "/Admin":
				List<User> list = new ArrayList<User>();
				repository = new UserRepository();
			try {
				list = repository.getAll();
			} catch (Exception e) {
				e.printStackTrace();
			}
				request.setAttribute("userList", list);
				dispatcher = request.getRequestDispatcher("/Admin.jsp");
				dispatcher.forward(request, response);	
			break;
		case "/search":
				searchController(request, response);
			break;
		case "/edit":
				editController(request, response);
			break;
		case "/delete":
			 	repository = new UserRepository();
			try {
				repository.delete(request.getParameter("userEmail"));
				System.out.println("User Deleted : "+request.getParameter("userEmail"));
				} catch (Exception e) {
				e.printStackTrace();
				}
			 	dispatcher = request.getRequestDispatcher("/Admin.jsp");
			 	dispatcher.forward(request, response);
			break;
		case "/update":		
			updateController(request, response);
	        break;
		case "/templates":	
			dispatcher = request.getRequestDispatcher("/Templates.jsp");
		 	dispatcher.forward(request, response);
	        break;
		case "/fresherTemplate":		
			dispatcher = request.getRequestDispatcher("/fresherTemplate.jsp");
		 	dispatcher.forward(request, response);
	        break;   
		case "/experiencedTemplate":		
			dispatcher = request.getRequestDispatcher("/experiencedTemplate.jsp");
		 	dispatcher.forward(request, response);
	        break;   
		case "/logout":  
				session.invalidate(); 
				dispatcher = request.getRequestDispatcher("/index.jsp");
				dispatcher.forward(request, response);
			break;
		case "/PDFConverter":
			
			break;
		 default:
			 dispatcher = request.getRequestDispatcher("/index.jsp");
			 dispatcher.forward(request, response);
			 break;
		}	
		
	}
	
	public void loginController(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException

	{
		String email = request.getParameter("email");
		String employeePassword=request.getParameter("password");
		HttpSession session=request.getSession(true);  
         
		if(email.equalsIgnoreCase("admin@niit.com"))
		{
			session.setAttribute("loggedAdmin",request.getParameter("email")); 
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("/Admin");
		requestDispatcher.forward(request, response);
		}
		else {
		UserRepository repository = new UserRepository();
		int count=0;
		try {
			count = repository.validateUser(email,employeePassword);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		if(count>0)
		{
			User user = new User();
			try {
				user = repository.getById(email);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			request.setAttribute("user", user);
			session.setAttribute("loggedUser",request.getParameter("email"));
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("/Profile.jsp");
			requestDispatcher.forward(request, response);
		}
		else
		{
			request.setAttribute("invalid", "Wrong Username or Password try to login again");
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("/login.jsp");
			requestDispatcher.forward(request, response);
		}
		}
	}

	public void registrationController(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		List<String> errorList=new ArrayList<>();
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phoneNo=request.getParameter("phoneNo");
		String gender=request.getParameter("gender");
		String password=request.getParameter("password");
		
		User user=new User();
		user.setName(name);
		user.setPhoneNo(phoneNo);
		user.setPassword(password);
		user.setEmail(email);
		user.setGender(gender);

		errorList=user.getMap();
		UserRepository repository=new UserRepository();
		boolean status=false;
		try {
			if(errorList.size()==0)
			{
			status = repository.insertRecords(user);
			System.out.println("After inserting user....");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(status)
		{
			request.setAttribute("invalid", "Successfully registered Try to login");
			request.setAttribute("user", user);
			System.out.println("should redirect to login....");
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("/login.jsp");
			requestDispatcher.include(request, response);
		}
		else
		{
			request.setAttribute("error", errorList);
			System.out.println("should not be in else part....");
			RequestDispatcher requestDispatcher=request.getRequestDispatcher("/regRedirect");
			requestDispatcher.forward(request, response);
		}
	}
	public void searchController(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException

	{
		List<User> list = new ArrayList<User>();
		UserRepository repository = new UserRepository();
		String word = request.getParameter("word");
		try {
			list = repository.getSearch(word);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        request.setAttribute("userList", list);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/Admin.jsp");
	       
	        dispatcher.forward(request, response);

	}
	public void updateController(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String name=request.getParameter("name");
		String phoneNo=request.getParameter("phoneNo");
		String email=request.getParameter("email");
		String password = request.getParameter("password");
		String address=request.getParameter("address");
		String certifications=request.getParameter("certifications");
		String education=request.getParameter("education");
		String specialization = request.getParameter("specialization");
		String employer=request.getParameter("employer");
		String experience=request.getParameter("experience");
		String gender=request.getParameter("gender");
		String jobTitle = request.getParameter("jobTitle");
		String personalSkills = request.getParameter("personalSkills");
		String proSkills = request.getParameter("proSkills");
		String masterDegree = request.getParameter("masterDegree");
		String stts = request.getParameter("status");
		String sscScore = request.getParameter("sscScore");
		String sscYear = request.getParameter("sscYear");
		String hscScore = request.getParameter("hscScore");
		String hscYear = request.getParameter("hscYear");
		String achievement = request.getParameter("achievement");
		String project = request.getParameter("project");
		String profile = request.getParameter("profile");
		String expCertifications = request.getParameter("expCertifications");
		
		User user = new User();
		user.setName(name);
		user.setPhoneNo(phoneNo);
		user.setPassword(password);
		user.setAddress(address);
		user.setJobTitle(jobTitle);
		user.setEmployer(employer);
		if(experience==null)
			user.setExperience(0);
		else
			user.setExperience(Integer.parseInt(experience));
		user.setProSkills(proSkills);
		user.setPersonalSkills(personalSkills);
		user.setEducation(education);
		user.setCertifications(certifications);
		user.setGender(gender);
		user.setEmail(email);
		user.setMasterDegree(masterDegree);
		user.setStatus(stts);
		user.setSscScore(sscScore);
		user.setSscYear(sscYear);
		user.setHscScore(hscScore);
		user.setHscYear(hscYear);
		user.setAchievement(achievement);
		user.setProject(project);
		user.setSpecialization(specialization);
		user.setProfile(profile);
		user.setExpCertifications(expCertifications);
		
		ServletContext context=request.getServletContext();
		context.setAttribute("name",name);
		context.setAttribute("phoneNo",phoneNo);
		context.setAttribute("email",email);
		context.setAttribute("address",address);
		context.setAttribute("certifications",certifications);
		context.setAttribute("education",education);
		context.setAttribute("specialization",specialization);
		context.setAttribute("employer",employer);
		context.setAttribute("experience",experience);
		context.setAttribute("gender",gender);
		context.setAttribute("jobTitle",jobTitle);
		context.setAttribute("personalSkills",personalSkills);
		context.setAttribute("proSkills",proSkills);
		context.setAttribute("masterDegree",masterDegree);
		context.setAttribute("sscScore",sscScore);
		context.setAttribute("sscYear",sscYear);
		context.setAttribute("hscScore",hscScore);
		context.setAttribute("hscYear",hscYear);
		context.setAttribute("achievement",achievement);
		context.setAttribute("project",project);
		context.setAttribute("profile",profile);
		context.setAttribute("expCertifications", expCertifications);
		
		UserRepository repository=new UserRepository();
		try {
			 repository.update(user, email);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			RequestDispatcher dispatcher = request.getRequestDispatcher("/Templates.jsp");
	        request.setAttribute("user", user);
	        dispatcher.forward(request, response);
	}
	public void editController(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException

	{
		String email = request.getParameter("email");
        User user = new User();
		try {
			user = new UserRepository().getById(email);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Profile.jsp");
        request.setAttribute("user", user);
        dispatcher.forward(request, response);
	}
}