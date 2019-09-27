<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/pharmacy";%>
<%!String user = "root";%>
<%!String psw = "sliit@123";%>
<%
	String sOrderID = String.valueOf(request.getParameter("sOrderID"));
	java.sql.Date sOrderDate=java.sql.Date.valueOf(request.getParameter("sOrderDate"));
	String supplierID=String.valueOf(request.getParameter("supplierID"));
	String supplierName=String.valueOf(request.getParameter("supplierName"));
	String itemID=String.valueOf(request.getParameter("itemID"));
	String itemName=String.valueOf(request.getParameter("itemName"));
	Integer NOSunits=Integer.valueOf(request.getParameter("NOSunits"));
	java.sql.Date arrivingDate=java.sql.Date.valueOf(request.getParameter("arrivingDate"));
	Double unitPrice=Double.valueOf(request.getParameter("unitPrice"));
	Double totalPrice = (Double) unitPrice * NOSunits;

if(sOrderID != null)
{
Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update supplierorders set sOrderID=?,sOrderDate=?,supplierID=?,supplierName=?,itemID=?,itemName=?,NOSunits=?,arrivingDate=?,unitPrice=?,totalPrice=?,status=? where sOrderID='"+sOrderID + "'";
ps = con.prepareStatement(sql);
ps.setString(1, sOrderID);
ps.setDate(2, sOrderDate);
ps.setString(3, String.valueOf(request.getParameter("supplierID")));
ps.setString(4, String.valueOf(request.getParameter("supplierName")));
ps.setString(5, String.valueOf(request.getParameter("itemID")));
ps.setString(6, String.valueOf(request.getParameter("itemName")));
ps.setInt(7, Integer.valueOf(request.getParameter("NOSunits")));
ps.setDate(8,java.sql.Date.valueOf(request.getParameter("arrivingDate")));
ps.setDouble(9, unitPrice);
ps.setDouble(10, totalPrice);
ps.setString(11, "not arrived");
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