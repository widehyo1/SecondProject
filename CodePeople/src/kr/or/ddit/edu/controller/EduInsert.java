package kr.or.ddit.edu.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.edu.service.EduServiceImpl;
import kr.or.ddit.edu.service.IEduService;
import kr.or.ddit.hr.service.HRServiceImpl;
import kr.or.ddit.hr.service.IHRService;
import kr.or.ddit.hr.vo.HRInfoVO;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

/**
 * Servlet implementation class EduInsert
 */
@WebServlet("/EduInsert.do")
public class EduInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String prefix = "/mainJsp/";
	String suffix = ".jsp";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EduInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		HttpSession session = request.getSession();
        MemberVO loginMember = session.getAttribute("memVO") == null?
                    null : (MemberVO)session.getAttribute("memVO");
        IMemberService memberService = MemberServiceImpl.getInstance();
        int memNo = loginMember.getMemNo();
		
		
		
		
		request.setCharacterEncoding("UTF-8");
		
		HRInfoVO hrInfoVO = new HRInfoVO();
		
		try {
			BeanUtils.populate(hrInfoVO,request.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		
	
		IHRService hrService = HRServiceImpl.getInstance();
		int hrNo = hrService.getHrNo(memNo);
		hrInfoVO.setHrNo(hrNo);
		
		
		IEduService eduService = EduServiceImpl.getInstance();
		int cnt = eduService.insertEdu(hrInfoVO);	

		request.setAttribute("result", cnt);
		
		request.getRequestDispatcher(prefix+"favResult"+suffix).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
