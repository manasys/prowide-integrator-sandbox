<%@page import="com.prowidesoftware.swift.model.MtSwiftMessage"%>
<%@page import="com.prowidesoftware.xsd.html.gui.web.ResourceServlet"%>
<%@page import="servlet.MtServlet"%>
<%@page import="com.prowidesoftware.swift.gui.MtFormBuilder"%>
<%@page import="com.prowidesoftware.swift.model.mt.MtType"%>
<html>
	<head>
	<%=ResourceServlet.includeHeaders(request)%>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/xsd-gui.css"/>
	</head>
    <body>
<%
	MtType type = (MtType) request.getAttribute(MtServlet.TYPE);
	MtSwiftMessage msg = (MtSwiftMessage) request.getAttribute(type.name());
%>
        <h1><%=type%></h1>
        <a href="mt" class="boton-link">back</a>
        <form method="POST">
        <% 
        	/*
        	 * create the builder and optionally customize the renderer
        	 */
        	MtFormBuilder builder = new MtFormBuilder();
        
        	/*
        	 * Create the form passing the existign message (if any) as parameter
        	 * so the form is pre filled with content (emulatting message modification)
        	 */
        	builder.writeMTForm(type, out, msg);
        %>
        <button id="validate">validate</button>
        <button formnovalidate="formnovalidate" id="save">save</button>
        </form>
        <script>
	    	$("#validate").click(function (ev){
	    		buildMessage();
	    		$("form").valid();
	    	});
        	$("#save").click(function (ev){
        		buildMessage();
       			$("form").submit();
        	});
        </script>
    </body>
</html>