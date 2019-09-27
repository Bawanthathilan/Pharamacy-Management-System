<%@page import="javax.swing.border.TitledBorder"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.lowagie.text.DocumentException"%>
<%@page import="com.lowagie.text.Paragraph"%>
<%@page import="com.lowagie.text.html.HtmlWriter"%>
<%@page import="com.lowagie.text.pdf.PdfWriter"%>
<%@page import="com.lowagie.text.Document"%>
<%@page import="java.io.*"%>;
<%@page import="java.awt.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.*"%>
<%@page import="com.lowagie.text.html.*"%>
<%@page import="java.awt.*"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.*"%>
<%@page import="com.lowagie.text.html.*"%>
<%
String str="pdf";


PreparedStatement ps=null;
ResultSet rs=null;
try
{ 
    Document document=new Document();
    if(str.equals("pdf"))
    {
        response.setContentType("application/pdf");
        PdfWriter.getInstance(document,response.getOutputStream());
    }
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacy?useSSL=false","root","sliit@123");
    


    	String query = "select * from supplierorders"; 
    	ps=connection.prepareStatement(query);	//Fetching data from table
                       							// executing query
       rs=ps.executeQuery();
       
    document.open();

    /* new paragraph instance initialized and add function write in pdf file*/
    document.add(new Paragraph("---------------------------------------------------------REPORT---------------------------------------------------------\n\n"));
    document.add(new Paragraph("                              CREATED REPORT BY-LUCKYLAND PHARMACY\n\n"));
    document.add(new Paragraph("                                                         SUPPLIER ORDERS\n\n"));
    document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------"));
    document.addCreationDate();
    
    while(rs.next())
    {
          // fetch & writing records in pdf files
        document.add(new Paragraph("ORDER ID ::"+rs.getString(1)+"\nORDER DATE ::"+rs.getString(2)+"\nSUPPLIER NAME ::"+rs.getString(4)+"\nITEM NAME ::"+rs.getString(6)+"\nNO.OF UNITS ::"+rs.getString(7)+"\nTOTAL PRICE ::"+rs.getString(10)+"\nSTATUS ::"+rs.getString(11)+"\n\n"));
    }
    document.add(new Paragraph("---------------------------------------------------------PAGE NO::"+document.getPageNumber()+"------------------------------------------------------"));
    
    document.close(); //document instance closed
    connection.close();  //db connection close
}
catch(Exception de) 
{
        de.printStackTrace();
            System.err.println("document: " + de.getMessage());
            
}


%>