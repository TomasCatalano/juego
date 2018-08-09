<%@ page import="java.io.*, java.util.*, java.net.*, java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<% 
Connection canal = null; 
ResultSet tabla= null; 
Statement instruccion=null; 
String strcon = "jdbc:mysql://localhost:3306/preguntados?user=root&password=admin"; 
String cadSQL = ""; 
ResultSet res= null; 
ResultSet nume= null; 


//String editar = request.getParameter("editar"); 


      // int dni = Integer.parseInt(request.getParameter("dni")); 
       //String nombre = request.getParameter("nombre"); 
       //String apellido = request.getParameter("apellido"); 
       //String cp = request.getParameter("cp"); 
    try  
      { Class.forName("com.mysql.jdbc.Driver").newInstance(); 
        canal=DriverManager.getConnection(strcon); 
        instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, 
        ResultSet.CONCUR_UPDATABLE); 
      } catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {}; 
   
       // try {tabla.close();instruccion.close();canal.close();}catch(SQLException e) {}; 

     String pregunta="";
     try
     {
        	int num_pre = 1; //(int) (Math.random() * 1) + 1;  
      		String num="Select * from preguntados.geografia where numero=num_pre;";
        	res=instruccion.executeQuery(num);
    		out.println("<center>");
    		out.println("<h2>");
    		if (res.next())
    		{
    		
    			pregunta=res.getString(2);
    			out.println(pregunta);
    			
    		
    		
    		out.println("</h2>");
    		out.println("</center>");
  		out.println("<br>");
  		  
    	
    	
 		 
		
         
 		
         
       		 out.println("<tr><td>"+res.getString(3)+"<a href=respuesta_geo.jsp?res="+res.getString(3)+",numero="+res.getString(1)+"> Respuesta </a></td></tr><tr><td>"+res.getString(4)+"<a href=respuesta_geo.jsp?res="+res.getString(4)+",numero="+res.getString(1)+"> Respuesta </a></td></tr><tr><td>"+res.getString(5)+"<a href=respuesta_geo.jsp?res="+res.getString(5)+",numero="+res.getString(1)+"> Respuesta </a></td></tr><tr><td>"+res.getString(6)+"<a href=respuesta_geo.jsp?res="+res.getString(6)+",numero="+res.getString(1)+"> Respuesta </a></td></tr>");
         
         	out.println("</table>");
    		}
    	}catch(SQLException e) {out.println(e);}; 
     
 %>

</body>
</html>