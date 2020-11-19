package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class QuizInfo {
	
	String Subject, QuizName, Author;

	public boolean saveQuizInfo(String quizName, String subject, String author) {
		
		boolean exist = false;
		
		try{
			Connection conn = Connect.connectDB();
			PreparedStatement ps1 = conn.prepareStatement("select * from QuizInfo where QuizName = ? ");
			ps1.setString(1,quizName);
			ResultSet rs1 = ps1.executeQuery();
			exist = rs1.next();
			if(exist){
				exist = false;
				return exist;
			}
			else {
			PreparedStatement ps = conn.prepareStatement("insert into QuizInfo values(?,?,?)");
			ps.setString(1,quizName);
			ps.setString(2,subject);
			ps.setString(3,author);
			int s = ps.executeUpdate();
				if(s == 1){
					exist = true;
				}
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}

			return exist;
		
	}
	
}
