<%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Slots</title>
<style>
  /* Style for centering and increasing button dimensions */
  #slot {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100vh;
  }
  .button-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center; /* Center content both horizontally and vertically */
    margin-top: 10px;
}
  button {
    padding: 10px 20px; /* Increase dimensions as needed */
    margin-left: 50px;
    background-color: green;
    color : white;
    font-size : 25px;
  }
  b
  {
  	font-size: 25px; 
  }
</style>
</head>
<body>
<div id="slot"></div>
<script>
  <%
    ArrayList<Integer> clist=null;
    if(request.getAttribute("scount")!=null)
    {
      clist=(ArrayList<Integer>)request.getAttribute("scount");
    }
    System.out.println(clist);
    for(int i=0;i<clist.size();i++)
    {%>
      var div=document.createElement("div");

        var count=document.createElement("b");
        count.textContent="Available slots : "+"<%=clist.get(i)%>";
        div.appendChild(count);

        div.appendChild(document.createElement("br"));
        div.appendChild(document.createElement("br"));
        div.appendChild(document.createElement("br"));
        div.appendChild(document.createElement("br"));
        
        var button=document.createElement("button");
        button.textContent="Book slot";
        button.onclick = function() {

            window.location.href="patients?slotdate="+"<%=request.getParameter("slotdate")%>"+"&did="+<%= request.getParameter("did")%>;
        }
        div.appendChild(button);
      document.getElementById("slot").appendChild(div);
    <%}
  %>
</script>
</body>
</html>
