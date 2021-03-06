package com.fundmaster.mss.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fundmaster.mss.common.Common;
import com.fundmaster.mss.model.Banner;
import com.fundmaster.mss.model.Company;
import com.fundmaster.mss.model.Country;
import com.fundmaster.mss.model.Gender;
import com.fundmaster.mss.model.Help;
import com.fundmaster.mss.model.MaritalStatus;
import com.fundmaster.mss.model.Menu;
import com.fundmaster.mss.model.PageContent;
import com.fundmaster.mss.model.Setting;
import com.fundmaster.mss.model.Social;
import com.fundmaster.mss.model.Theme;
import com.fundmaster.mss.model.User;
import com.fundmaster.mss.service.UserService;

@WebServlet(name = "ActivateController", urlPatterns = {"/activate/*"})
public class ActivateController extends GenericController {
	/**
	 * 
	 */
	private static final long serialVersionUID = -347116347501412506L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {  
		UserService uService = new UserService();
		User u = uService.findBySecurityCode(request.getQueryString());
		if(u != null && !u.isStatus())
		{
			u.setStatus(true);
			uService.update(u);
			request.setAttribute("success", true);
			if(u.getUserProfile().equals(Common.MEMBER_PROFILE))
				request.setAttribute("page", "sign-in");
			else
				request.setAttribute("page", "login");
		}
		else
		{
			request.setAttribute("success", false);
		}

		List<Country> countries = getCountries();
		request.setAttribute("countries",  countries);
		List<Gender> genders = getGenders();
		request.setAttribute("genders",  genders);
		List<MaritalStatus> marital_statuses = getMaritalStatuses();
		request.setAttribute("maritalStatuses",  marital_statuses);
		Company company = getCompany();
		request.setAttribute("company", company);
		Social social = getSocial();
		request.setAttribute("social", social);
		Setting settings = getSettings();
		request.setAttribute("settings", settings);
		String plf = getLoginField(Common.MEMBER_PROFILE);
		request.setAttribute("plf", plf);
		Menu menu = getMenu();
		request.setAttribute("menu", menu);
		List<Banner> banners = getBanners();
		request.setAttribute("banners", banners);
		Theme theme = getTheme();
		request.setAttribute("theme", theme);
		Help help = getHelpByPage(Common.PAGE_HOME);
		request.setAttribute("help", help);
		PageContent content = getPageContentByPage(Common.PAGE_HOME);
		request.setAttribute("content", content);
		request.setAttribute("noMenu", false);
		request.getRequestDispatcher("activate.jsp").forward(request, response);
	}
}
