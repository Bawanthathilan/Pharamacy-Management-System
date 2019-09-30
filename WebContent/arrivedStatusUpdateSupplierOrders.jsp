<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/pharmacy";%>
<%!String user = "root";%>
<%!String psw = "sliit@123";%>
<%

String sOrderID = request.getParameter("sOrderID");

if(sOrderID != null)
{
Connection con = null;
PreparedStatement ps = null;
String ID = sOrderID;
try
{
	Class.forName(driverName);
	con = DriverManager.getConnection(url,user,psw);
	String sql="Update supplierorders set status=? where sOrderID='"+sOrderID + "'";
	ps = con.prepareStatement(sql);
	ps.setString(1, "arrived");
	int i = ps.executeUpdate();
	if(i > 0)
	{
		
		out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
		out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
		out.println("<script>");
		out.println("$(document).ready(function(){");
		out.println("swal ( 'Arrival confirmation Successful' ,  '' ,  'success' );");
		out.println("});");
		out.println("</script>"); 
	RequestDispatcher rd = request.getRequestDispatcher("manageSupplierOrders.jsp");
	rd.include(request, response);
	}
	else
	{
	out.print("There is a problem in updating Record.");
	}
	}
	catch(SQLException sql)
	{
	request.setAttribute("error", sql);
	out.println(sql);
	}
	}
	%>