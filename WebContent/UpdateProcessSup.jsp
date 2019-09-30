<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/supplier1";%>
<%!String user = "root";%>
<%!String psw = "yasiya";%>
<%
String sid = request.getParameter("sid");
String sname=request.getParameter("sname");
String cname=request.getParameter("cname");
String caddress=request.getParameter("caddress");
String ctelno=request.getParameter("ctelno");
String cemail=request.getParameter("cemail");
if(sid != null)
{
Connection con = null;
PreparedStatement ps = null;

try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update newsupplier set supplierID=?,supplierName=?,companyName=?,companyAddress=?,companyTelNo=?,companyEmail=? where supplierID='"+sid+"'";
ps = con.prepareStatement(sql);
ps.setString(1,sid);
ps.setString(2, sname);
ps.setString(3, cname);
ps.setString(4, caddress);
ps.setString(5, ctelno);
ps.setString(6, cemail);
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
RequestDispatcher rd = request.getRequestDispatcher("supProfile.jsp");
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