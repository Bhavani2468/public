<%@ page language="java" import="java.util.*,java.sql.*,java.io.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="custom" uri="/WEB-INF/dbDD.tld" %>
<!DOCTYPE html>
<html>
<head>
    <title>Custom Tag Example</title>
</head>
<body>

	<custom:hello  table="chinnu_trains" displayColumn="trn_name" valueColumn="trn_no"/>
	
</body>
</html>
