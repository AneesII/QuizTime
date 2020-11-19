package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.QuizInfo;

/**
 * Servlet implementation class CreateQuiz
 */
@WebServlet("/CreateQuiz")
public class CreateQuiz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateQuiz() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String subject = request.getParameter("Subject");

		String qzNm = request.getParameter("QuizName");
		
		String Author = null;
		if(request.getSession().getAttribute("Name")!=null){
			Author = (String) request.getSession().getAttribute("Name");
			
		}
		
		QuizInfo ob = new QuizInfo();
		boolean saved = ob.saveQuizInfo(qzNm,subject, Author);
		if(saved) {
			request.getSession().setAttribute("qzNm", qzNm);
			request.getSession().setAttribute("Restart",1);	
			response.sendRedirect("insertQ.jsp");
			
		} else {
			request.getSession().setAttribute("QuizExists", "Quiz exists");
			response.sendRedirect("createQuiz.jsp");
		}
		
	}

}
