package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class QuizQuestion {

	String QuizName, Question, Option1,Option2,Option3,Option4,Answer;
	
	int QID;
	
	public boolean insertQ(String QuizName,int qID, String Question,String option1,String option2, String option3,String option4, String Answer)
	{
		
		boolean inserted = false;
		try{
			Connection conn = Connect.connectDB();
			PreparedStatement ps = conn.prepareStatement("insert into QuizQuestion values(?,?,?,?,?,?,?,?)");
		
			ps.setInt(1,qID);
			ps.setString(2,Question);
			ps.setString(3,option1);
			ps.setString(4,option2);
			ps.setString(5,option3);
			ps.setString(6,option4);
			ps.setString(7,Answer);
			ps.setString(8,QuizName);

			int s= ps.executeUpdate();
			inserted = true;
			
			conn.close();
		
		}
		catch(Exception e){e.printStackTrace();}
		
		return inserted;
	}
	
	public ArrayList<String> getQuestion(int qNo, String QuizName){
		
		ArrayList<String> Qstn = new ArrayList<String>();
		
		try{
			Connection conn = Connect.connectDB();
			PreparedStatement ps=conn.prepareStatement("select * from QuizQuestion where QuizName='"+QuizName+"' AND QID=qNo ");
			
			ResultSet rs=ps.executeQuery();
		
				if(rs.next()){
					Qstn.add(rs.getString("Question"));
					Qstn.add(rs.getString("Option1"));
					Qstn.add(rs.getString("Option2"));
					Qstn.add(rs.getString("Option3"));
					Qstn.add(rs.getString("Option4"));
					Qstn.add(rs.getString("Answer"));
				}
			}
			catch(Exception e){e.printStackTrace();}
			
			return Qstn;
		}

	
}
