<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.cj.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/customer";%>
<%!String user = "root";%>
<%!String psw = "bawwa";%>
<%
String snum = request.getParameter("Snumber");
String inum=request.getParameter("Inumber");
String qty=request.getParameter("Qnumber");
String mdate=request.getParameter("Mdate");
String edate=request.getParameter("Edate");
String rdate=request.getParameter("Rdate");
String sprise=request.getParameter("SPrise");
String iprise=request.getParameter("iPrise");
if(snum != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(snum);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update stock set Snumber=?,Inumber=?,Qnumber=?,Mdate=?,Edate=?,Rdate=?,SPrise=?,iPrise=? where Snumber="+snum;
ps = con.prepareStatement(sql);
ps.setString(1,snum);
ps.setString(2, inum);
ps.setString(3, qty);
ps.setString(4, mdate);
ps.setString(5, edate);
ps.setString(6, rdate);
ps.setString(7, sprise);
ps.setString(8, iprise);
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
RequestDispatcher rd = request.getRequestDispatcher("ManageStocks.jsp");
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