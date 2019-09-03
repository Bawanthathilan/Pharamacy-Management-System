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
String sql="Update supplierorders set sOrderID=sOrderID ,status='arrived'";
}catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
response.sendRedirect("manageSupplierOrders.jsp");
}
%>