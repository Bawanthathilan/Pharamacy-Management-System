<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

	<%! String driverName = "com.mysql.jdbc.Driver";%>
	<%!String url = "jdbc:mysql://localhost:3306/"+"customer";%>
	<%!String user = "root";%>
	<%!String psw = "bawwa";%>
	
		<%
			String uid = request.getParameter("utilityID");
			String uType=request.getParameter("utype");
			String udescription=request.getParameter("description");
			String udate=request.getParameter("date");
			String umethod=request.getParameter("method");
			String uamount=request.getParameter("amount");
			
				if(uid != null)
				{
					Connection con = null;
					PreparedStatement ps = null;
					int personID = Integer.parseInt(uid);
				try
				{
					Class.forName(driverName);
					con = DriverManager.getConnection(url,user,psw);
					String sql="Update utilitydetails set utilityID=?,utype=?,description=?,date=?,method=?,amount=? where utilityID ="+uid;
					ps = con.prepareStatement(sql);
					ps.setString(1, uid);
					ps.setString(2, uType);
					ps.setString(3, udescription);
					ps.setString(4, udate);
					ps.setString(5, umethod);
					ps.setString(6, uamount);
					
					
					int i = ps.executeUpdate();
					if(i > 0)
					{
	
						out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
						out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
						out.println("<script>");
						out.println("$(document).ready(function(){");
						out.println("swal ( 'Update Successfully' ,  '' ,  'success' );");
						out.println("});");
						out.println("</script>"); 
						
						RequestDispatcher rd = request.getRequestDispatcher("manageUtility.jsp");
						rd.include(request, response);
				    }
				    else
					{
						out.print("There is a problem in updating Record.");
					}
				 }catch(SQLException sql)
				{
				request.setAttribute("error", sql);
				out.println(sql);
			}
		}
	%> 