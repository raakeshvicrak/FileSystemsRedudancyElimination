package home;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Dbmanipulation {
	
	Connection con;
	PreparedStatement ps;
	boolean b1 = false;
	public Dbmanipulation()
	{
	con= 	Dbconnection.conn();
	}
	
	public boolean logintest(String mail,String pass)
	{
		try
		{
			ps=con.prepareStatement("select * from login where uname=? and pwd=?");
			ps.setString(1, mail);
			ps.setString(2,pass);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				b1=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return b1;
	}
	int id;
	
	public int getUserId(String mail,String pass)
	{
		try
		{
			ps=con.prepareStatement("select * from login where uname=? and pwd=?");
			ps.setString(1, mail);
			ps.setString(2,pass);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				id=rs.getInt(1);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return id;
	}

}
