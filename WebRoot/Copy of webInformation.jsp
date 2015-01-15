<%@page import="Biz.TradeBiz"%>
<%@ page language="java" pageEncoding="UTF-8"import="java.util.*,hibernate.*" %>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested" prefix="nested" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<!doctype html>
<html lang="en">
<head>
    <title>站内消息</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/style.css"/>
	
	<link rel="stylesheet" href="css/trade.css"/>
	<link rel="stylesheet" href="css/global-min.css" type="text/css">
    <link rel="stylesheet" href="css/base.css" type="text/css" />
	<script type="text/javascript" src="js/deps.js"></script>
	
	<script language="javascript">
    	function formSubmit(formName){
    		//alert(formName);
    		if(confirm("确认执行此操作？")){
    			document.getElementById(formName).submit();
    		}
    	}
    </script>
    
</head>
<body>
	<%@ include file="common/top_main.jsp" %>

	

<div id="layout-center">
    <div class="grid-c2">
        <div id="J_Col_Main" class="col-main">
            <div class="main-wrap">
                <div class="mt-ml-c1" >
					<!--薄膜，垫片-->
					<div class="mt-ml-shim"></div>
					<div id="wunai">
						<div id="main-content">
	
	

	</div>
					</div>
				</div>
			</div>
		</div>
	<%@ include file="common/left.jsp" %>
	
	<%@ include file="common/footer.jsp" %>
	
	</div>
</div>
</div>
</body>
</html>
