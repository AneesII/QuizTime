package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.QuizQuestion;

/**
 * Servlet implementation class InsertQuestion
 */
@WebServlet("/InsertQuestion")
public class InsertQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQuestion() {
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
		
		String qzNm = (String)request.getSession().getAttribute("qzNm");
		Integer qID = (Integer) request.getSession().getAttribute("counter");

		String Question = request.getParameter("Qstn");
		String option1 = request.getParameter("Option1");
		String option2 = request.getParameter("Option2");
		String option3 = request.getParameter("Option3");
		String option4 = request.getParameter("Option4");
		String answer = request.getParameter("ans");
		
		QuizQuestion ob = new QuizQuestion();
		boolean insert = ob.insertQ(qzNm, qID, Question, option1, option2, option3, option4, answer);
		if(insert) {
			response.sendRedirect("insertQ.jsp");
		}
		
	}

}
