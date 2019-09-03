<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/emp";%>
<%!String user = "root";%>
<%!String psw = "root";%>
<%
String Eid = request.getParameter("Eid");
String Ename=request.getParameter("Ename");
String EpayDay=request.getParameter("EpayDay");
String EmonthlySalary=request.getParameter("EmonthlySalary");


if(Eid != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(Eid);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update payments set Eid=?,Ename=?,EpayDay=?,EmonthlySalary=?  where Eid="+Eid;
ps = con.prepareStatement(sql);
ps.setString(1,Eid);
ps.setString(2,Ename);
ps.setString(3,EpayDay);
ps.setString(4,EmonthlySalary);

int i = ps.executeUpdate();
if(i > 0)
{
	
	out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
	out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
	out.println("<script>");
	out.println("$(document).ready(function(){");
	out.println("swal ( 'Payment Update Successfull' ,  '' ,  'success' );");
	out.println("});");
	out.println("</script>"); 
RequestDispatcher rd = request.getRequestDispatcher("Payment.jsp");
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