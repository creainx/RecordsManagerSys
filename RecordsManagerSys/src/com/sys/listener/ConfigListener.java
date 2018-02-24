package com.sys.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ConfigListener implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent context) {
		
		ServletContext cont = context.getServletContext();
		
		String proName = "/RecordsManagerSys";
		
		cont.setAttribute("proName", proName);
		
		cont.setAttribute("css", proName + "/css");
		
		cont.setAttribute("js", proName + "/js");
		
		cont.setAttribute("img", proName + "/img");
		
		cont.setAttribute("page", "/WEB-INF/pages");

	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
	
		
	}
}
