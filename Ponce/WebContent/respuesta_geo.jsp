<%@ page import="java.io.*, java.util.*, java.net.*, java.sql.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 
<% 
Connection canal = null; 
ResultSet tabla= null; 
ResultSet resultado= null;
Statement instruccion=null; 
String strcon = "jdbc:mysql://localhost:3306/preguntados?user=root&password=admin"; 
String cadSQL = ""; 
String res = request.getParameter("res");
String numero = request.getParameter("numero");
//String editar = request.getParameter("editar"); 


    
    try  
      { Class.forName("com.mysql.jdbc.Driver").newInstance(); 
        canal=DriverManager.getConnection(strcon); 
        instruccion = canal.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, 
        ResultSet.CONCUR_UPDATABLE); 
      } catch(java.lang.ClassNotFoundException e){} catch(SQLException e) {}; 
   
        //try {tabla.close();instruccion.close();canal.close();} catch(SQLException e) {}; 
	try{
		
		
		String SQL="Select respuesta_correcta From preguntados.geografia where numero='"+numero+"';";
		
		resultado=instruccion.executeQuery(SQL);
	
		if (resultado.next()){
			
		String respuesta=resultado.getString(1);
		if (respuesta.equals(res)){
			out.println("Correcto");
		}else{
			out.println("Incorrecto");
		}
		}
		
	}catch(SQLException e) {}; 
     
     
 %>
</body>
</html>