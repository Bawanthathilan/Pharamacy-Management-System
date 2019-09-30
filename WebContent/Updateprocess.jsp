<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/invoice1";%>
<%!String user = "root";%>
<%!String psw = "maleesha1234";%>
<%
String id= request.getParameter("id");
String date=request.getParameter("udate");
String customername=request.getParameter("ucustomername");
String mobilenumber=request.getParameter("umobilenumber");
String medicinename=request.getParameter("umedicinename");
Double quantity=Double.valueOf(request.getParameter("uquantity"));
String gram=request.getParameter("ugram");
Double unit= Double.valueOf(request.getParameter("uunit"));
Double amount = (Double) unit*quantity;


if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);

try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update neworder set invoicenum=?,customername=?,mobilenumber=?,medname=?,quan=?,gram=?,date=?,unitprice=?,amount=? where invoicenum='"+id+"'";
ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2,customername);
ps.setString(3,mobilenumber);
ps.setString(4,medicinename);
ps.setDouble(5,quantity);
ps.setString(6,gram);
ps.setString(7,date);
ps.setDouble(8,unit);
ps.setDouble(9,amount);
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
RequestDispatcher rd = request.getRequestDispatcher("ManageInvoice.jsp");
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