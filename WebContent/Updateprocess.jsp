<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/customer";%>
<%!String user = "root";%>
<%!String psw = "bawwa";%>
<%
String invoicenumber= request.getParameter("invoicenumber");
Date date=java.sql.Date.valueOf(request.getParameter("date"));
String customername=request.getParameter("customername");
Integer mobilenumber=Integer.valueOf(request.getParameter("mobilenumber"));
String medicinename=request.getParameter("medicinename");
String quantity=request.getParameter("quantity");
String gram=request.getParameter("gram");

if(invoicenumber != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(invoicenumber);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update neworder set ,date=?,customername=?,mobilenumber=?,medname=?,quan=?,gram=? where invoicenum="+invoicenumber;
ps = con.prepareStatement(sql);
ps.setDate(1, date);
ps.setString(2, customername);
ps.setInt(3, mobilenumber);
ps.setString(4, medicinename);
ps.setString(5, quantity);
ps.setString(6, gram);
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
RequestDispatcher rd = request.getRequestDispatcher("ManageInovoice.jsp");
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