package com.fundmaster.mss.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fundmaster.mss.common.Common;
import com.fundmaster.mss.model.Company;
import com.fundmaster.mss.model.Help;
import com.fundmaster.mss.model.Menu;
import com.fundmaster.mss.model.PageContent;
import com.fundmaster.mss.model.Setting;
import com.fundmaster.mss.model.Social;
import com.fundmaster.mss.model.Theme;
@WebServlet(name = "ContactUsController", urlPatterns = {"/contact-us"})
public class ContactUsController extends GenericController  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ContactUsController() {
		// TODO Auto-generated constructor stub
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  
		Company company = getCompany();
		request.setAttribute("company", company);
		Social social = getSocial();
		request.setAttribute("social", social);
		Menu menu = getMenu();
		request.setAttribute("menu", menu);
		Theme theme = getTheme();
		request.setAttribute("theme", theme);
		request.setAttribute("noMenu", false);
		Help help = getHelpByPage(Common.PAGE_CONTACT_US);
		request.setAttribute("help", help);
		Setting settings = getSettings();
		request.setAttribute("settings", settings);
		PageContent content = getPageContentByPage(Common.PAGE_CONTACT_US);
		request.setAttribute("content", content);
		logActivity(Common.PAGE_CONTACT_US, "accesed contact us page", "0", null, null);
		request.getRequestDispatcher("contact-us.jsp").forward(request, response);
	}
}
