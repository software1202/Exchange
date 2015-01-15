<%@page import="Biz.LocationBiz"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import = "hibernate.*,Biz.*,javax.servlet.http.HttpServletRequest"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   
    
     
    <title>My JSP 'tttt.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
     <script src="js/pccs.js"  type="text/javascript"></script>
     
     <script type="text/javascript">
     	function Dsy() {
    this.Items = {};
}
Dsy.prototype.add = function(id, iArray) {
    this.Items[id] = iArray;
}
Dsy.prototype.Exists = function(id) {
    if (typeof (this.Items[id]) == "undefined") return false;
    return true;
}

function change(v) {
    var str = "0";
    for (i = 0; i < v; i++) { str += ("_" + (document.getElementById(s[i]).selectedIndex - 1)); };
    var ss = document.getElementById(s[v]);
    with (ss) {
        length = 0;
        options[0] = new Option(opt0[v], opt0[v]);
        if (v && document.getElementById(s[v - 1]).selectedIndex > 0 || !v) {
            if (dsy.Exists(str)) {
                ar = dsy.Items[str];
                for (i = 0; i < ar.length; i++) options[length] = new Option(ar[i], ar[i]);
                if (v) options[1].selected = true;
            }
        }
        if (++v < s.length) { change(v); }
    }
}

var dsy = new Dsy();

<%LocationBiz addressBiz = new LocationBiz();
	Province pro = new Province();
	
	List proList = addressBiz.getProviceList();
	
	

	pro = (Province)proList.get(0);
	String tmpString = "dsy.add(\"0\",[\""+pro.getProName()+"\"" ;
	for(int i=1;i<proList.size();i++){
	
		 pro = (Province)proList.get(i);
		 tmpString +=",\""+pro.getProName()+"\""; 
		}
		tmpString +="]);";
	    out.print(tmpString);%>
        <% 
        City city = new City();
        District dis = new District();
        List cityList;
        List disList;
        String tmpString1 = "dsy.add(\"0_";
        String tmpString2="";
        String tmpString4="";
        String t1 ="]);";
        int j;
        int k;
       
	    for(int i=0;i<proList.size();i++){
	
		 pro = (Province)proList.get(i);
		 cityList=addressBiz.getCityList(pro.getProId());
		 for(j=1;j<cityList.size();j++) {
		 
		     city = (City)cityList.get(j);
		      tmpString2 = ",\""+city.getCityName()+"\"";
		 }
		 
		 String t =i+"\",[\""+((City)cityList.get(0)).getCityName()+"\"";
		 String tmpString3 = tmpString1+t+tmpString2+"]);";
		  out.print(tmpString3);
		 }
		
         for(int i=0;i<proList.size();i++){
	
		 pro = (Province)proList.get(i);
		 cityList=addressBiz.getCityList(pro.getProId());
		 for(j=0;j<cityList.size();j++) {
		 
		     city = (City)cityList.get(j);
		     disList=addressBiz.getdistList(city.getCityId());
		     for(k=1;k<disList.size();k++){
		      	
		      	dis=(District)disList.get(k);
		      	tmpString4 =  ",\""+dis.getDisName()+"\"";
		     }
		     String t2=i+"_"+j+"\",[\""+((District)disList.get(0)).getDisName()+"\"";
		     String tmpString5=tmpString1+t2+tmpString4+"]);";
		      out.print(tmpString5);
		     }
		     }
%>
        
        

     	var s = ["province", "city", "county"];
var opt0 = ["省份", "地级市", "市、县级市、县"];
function setup() {
    for (i = 0; i < s.length - 1; i++)
        document.getElementById(s[i]).onchange = new Function("change(" + (i + 1) + ")");
    change(0);
     	}
     
     </script>
  </head>
  





<body>
 <div class="t1">
        <div class="left f">
            地区</div>
        <div>
            <select name="province" id="province">
            </select>
            <select name="city" id="city">
            </select>
                <select name="county" id="county">
                </select>
        </div>
    </div>
    <script language="javascript">
        setup() 
    </script> 

  </body>
</html>
