<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/customer";%>
<%!String user = "root";%>
<%!String psw = "bawwa";%>
<%
String Eid = request.getParameter("Eid");
String Ename=request.getParameter("Ename");
String Eaddress=request.getParameter("Eaddress");
String Enic=request.getParameter("Enic");
String EBdate=request.getParameter("EBdate");
String Egender=request.getParameter("Egender");
String Etp=request.getParameter("Etp");

if(Eid != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(Eid);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update register set Eid=?,Ename=?,Eaddress=?,Enic=?,EBdate=?,Etp=?  where Eid="+Eid;
ps = con.prepareStatement(sql);
ps.setString(1,Eid);
ps.setString(2, Ename);
ps.setString(3, Eaddress);
ps.setString(4, Enic);
ps.setString(5, EBdate);
ps.setString(6, Etp);
int i = ps.executeUpdate();
if(i > 0)
{
	
	out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
	out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
	out.println("<script>");
	out.println("$(document).ready(function(){");
	out.println("swal ( 'Employee Details Update Successfull' ,  '' ,  'success' );");
	out.println("});");
	out.println("</script>"); 
RequestDispatcher rd = request.getRequestDispatcher("Details.jsp");
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