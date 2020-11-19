package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Human {
	
String name,password,type,email,userID;

	public boolean insertUser(String name,String username, String email,String pswd, String type ) {
		
		boolean status=false;
		
		try {
			Connection conn = Connect.connectDB();
			PreparedStatement ps1 = conn.prepareStatement("select * from ACCOUNT where UserID = ? or UserEmail = ?");
			ps1.setString(1,username);
			ps1.setString(2,email);
			ResultSet rs = ps1.executeQuery();
			status=rs.next();
			if(status) {
				status = false;
				return status;
			}
			else {
				PreparedStatement ps=conn.prepareStatement("insert into ACCOUNT values(?,?,?,?,?)");
				ps.setString(1,name);
				ps.setString(2,username);
				ps.setString(3,email);
				ps.setString(4,pswd);
				ps.setString(5,type);
				int s = ps.executeUpdate();
				if(s == 1){
					status = true;
					return status;
				} 
			}
			conn.close();
			} catch(Exception e){
				e.printStackTrace();
			}
		
			
		
		return status;
	}
	
	public boolean validateLogin(String userID, String password){
		
		boolean status = false;
		
		try{
			Connection conn = Connect.connectDB();
			PreparedStatement ps = conn.prepareStatement("select * from ACCOUNT where UserID = ? and UserPswd = ?");
			ps.setString(1,userID);
			ps.setString(2,password);
			ResultSet rs = ps.executeQuery();
			status = rs.next();
			if(status) {
				type = rs.getString("UserType");
				name = rs.getString("UserName");
				return status;
			}
			}
			catch(Exception e){
				e.printStackTrace();
			}
		return status;	
	}
	
	public String getType() {
		return type;
	}
	
	public String getName() {
		return name;
	}

}
