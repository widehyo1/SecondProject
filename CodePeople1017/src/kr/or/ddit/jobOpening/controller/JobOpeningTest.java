package kr.or.ddit.jobOpening.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.jobOpening.service.IJobOpeningService;
import kr.or.ddit.jobOpening.service.JobOpeningServiceImpl;

@WebServlet("/joSalTypeTest.do")
public class JobOpeningTest extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		IJobOpeningService jobOpeningService = JobOpeningServiceImpl.getInstance();
		
		List<Integer> list = jobOpeningService.joSalaryList();
		
		if(list == null) {
			System.out.println("null");
			System.exit(0);
		}
		
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("/test/joSalType.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
