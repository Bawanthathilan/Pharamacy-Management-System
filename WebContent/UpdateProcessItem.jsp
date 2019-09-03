<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/customer";%>
<%!String user = "root";%>
<%!String psw = "bawwa";%>
<%
String id = request.getParameter("id");
String itemname=request.getParameter("itemname");
String category=request.getParameter("select11");
String subcategory=request.getParameter("select22");
String genname=request.getParameter("genname");
String unit=request.getParameter("unit");
Double price= Double.valueOf(request.getParameter("price"));
String manufac=request.getParameter("manufac");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int itemID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update item set itemid=?,name=?,category=?,subcategory=?,genericname=?,unit=?,price=?,manufacturer=? where itemid="+id;
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2,itemname);
ps.setString(3,category);
ps.setString(4,subcategory);
ps.setString(5,genname);
ps.setString(6,unit);
ps.setDouble(7,price);
ps.setString(8,manufac);
int i = ps.executeUpdate();
if(i > 0)
{
	
	out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
	out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
	out.println("<script>");
	out.println("$(document).ready(function(){");
	out.println("swal ( 'Updated Successfully' ,  '' ,  'success' );");
	out.println("});");
	out.println("</script>"); 
RequestDispatcher rd = request.getRequestDispatcher("manageItem.jsp");
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
