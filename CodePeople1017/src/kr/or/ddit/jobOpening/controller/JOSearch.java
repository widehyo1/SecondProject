package kr.or.ddit.jobOpening.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.jobOpening.vo.JobOpeningVO;

@WebServlet("/joSearch.do")
public class JOSearch extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		JobOpeningVO vo = new JobOpeningVO();
		
		try {
			BeanUtils.populate(vo, req.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		System.out.println("jo_sal");
		System.out.println(vo.getJo_sal());
		System.out.println("jg_no");
		System.out.println(vo.getJg_code_no());
		System.out.println("jt_no");
		System.out.println(vo.getJt_code_no());
		System.out.println("pl_no");
		System.out.println(vo.getPl_code_no());
		
		
	}

}
