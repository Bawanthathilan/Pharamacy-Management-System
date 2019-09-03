<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/customer";%>
<%!String user = "root";%>
<%!String psw = "bawwa";%>
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
String sql="Update supplierorders set sOrderID=?,sOrderDate=?,supplierID=?,supplierName=?,itemID=?,itemName=?,NOSunits=?,arrivingDate=?,unitPrice=?,totalPrice=? where sOrderID="+ID;
ps = con.prepareStatement(sql);
ps.setString(1, String.valueOf(request.getParameter("sOrderID")));
ps.setDate(2, java.sql.Date.valueOf(request.getParameter("sOrderDate")));
ps.setString(3, String.valueOf(request.getParameter("supplierID")));
ps.setString(4, String.valueOf(request.getParameter("supplierName")));
ps.setString(5, String.valueOf(request.getParameter("itemID")));
ps.setString(6, String.valueOf(request.getParameter("itemName")));
ps.setInt(7, Integer.valueOf(request.getParameter("NOSunits")));
ps.setDate(8,java.sql.Date.valueOf(request.getParameter("arrivingDate")));
ps.setString(9, request.getParameter("unitPrice"));
ps.setString(10, request.getParameter("totalPrice"));


int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
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
response.sendRedirect("manageSupplierOrders.jsp");
}
%>