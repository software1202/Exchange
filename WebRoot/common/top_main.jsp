<%@ page language="java" pageEncoding="UTF-8"import="java.util.*,hibernate.*" %>
	<%
		if(session.getAttribute("userId")==null){
			%>
				<jsp:forward page="noLogin.jsp"/>
			<%
		}
		String userId = (String)session.getAttribute("userId");
		int pageIndex =1;
		int pageNum = 0; //显示的分页数目
		int singlePageNum = 3;
		if(request.getParameter("pageIndex")!=null){
			pageIndex= Integer.parseInt((String)request.getParameter("pageIndex"));
		}
		String oper = (String)request.getAttribute("operator");
		if(oper!=null&&"yes".equals(oper)){
			%>
				<script language="javascript">
					alert("操作成功！");
				</script>
			<%
		}
	 %>
	 
	<!--n-->
    <header class="mt-header">
    <article>
    <!----    <div class="mt-logo">
            <a title="换享网" href="index.jsp" class="mt-tblogo" >换享网</a>
        </div>	--->
        <nav class="mt-nav">
            <ul id="J_MtMainNav">
                <li>
                    <a href="index.jsp" >首页</a>
                    <i class="mt-arrow"></i>
                </li>
                <li class="selected">
                    <a href="wantChange.do">个人空间</a>
                    <i class="mt-arrow"></i>
                </li> 
                <li class="">
                    <a class="mt-nav-parent" href="" ></a>
                    <i class="mt-arrow"></i>
                </li>
            </ul> 
                <div class="search" >
                    <div class="search-panel search-sns-panel-field">
                        <form target="_blank" action="searchGoods.do" method="get" name="search" >
                        	<input type="text" name="keyWord" style="width:77%;height:100%;"/>
                            <div class="search-button">
                                <button class="btn-search" type="submit">搜 索</button>
                            </div>

                        </form>
                    </div>
                </div>
        </nav>
    </article>
	</header>
	<!-- end vmcommon/mytaobao -->