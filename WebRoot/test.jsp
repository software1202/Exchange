<!doctype html>
<!--STATUS OK-->
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
        <title>javascript如何实现div分页呢？_百度知道     </title>
        <style type="text/css">
        	#main div{width:490px;height:350px;border: 1px solid #000000;}
        	#main span{border: 1px solid #000000;cursor: pointer;margin-left: 30px;}
        </style>
        <script type="text/javascript" src="js/jquery_1.9.js"></script>
        <script type="text/javascript">
        	var index=0;
        	$(document).ready(function(){
        		$('#main div').hide().eq(0).show();
        		$('#prv').click(function(){
        			if(--index>=0){
        				$('#main div').hide().eq(index).show();
        				}
        		});
        		$('#next').click(function(){
        			if(++index<5){
        				$('#main div').hide().eq(index).show();
        				}
        		});
        	});
        </script>
        <body>
            <table id="main" >
                <tr><div id=page1><h1>第一页</h1></div></tr>
                <div id=page2><h1>第二页</h1></div>
                <div id=page3><h1>第三页</h1></div>
                <div id=page4><h1>第四页</h1></div>
                <div id=page5><h1>第五页</h1></div>
                <p style="text-align: center;"><span id=prv>prv</span><span id=next>next</span></p>
            </table>
            
        </body>
</html>