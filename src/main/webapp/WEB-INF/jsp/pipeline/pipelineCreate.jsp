<%--
  Created by IntelliJ IDEA.
  User: hrjin
  Date: 2017-05-19
  Time: 오전 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 이동경로 :s -->
<div class="location">
    <div class="location_inner">
        <ul>
            <li><a href="javascript:void(0);" onclick="procMovePage('/');" class="home">홈으로</a></li>
            <li>파이프라인 신규생성</li>
        </ul>
    </div>
</div>
<!--//이동경로 :e -->

<!-- container :s -->
<div id="container">
    <!-- content :s -->
    <div class="contents">
        <!-- 타이틀 :s -->
        <h3 class="sub_title">파이프라인 신규생성</h3>
        <!--//타이틀 :e -->
        <!-- sub content :s -->
        <div class="sub_content">
            <%--<form action="#" method="post">--%>
                <!-- form (contBox) -->
                <div class="contBox">
                    <!-- 기본 영역 -->
                    <div class="form_info">
                        <!--타이틀 영역-->
                        <div class="form_left">
                            <p class="title">파이프라인 명 (<span class="essential">*필수</span>)</p>
                        </div>
                        <!--//타이틀 영역-->
                        <!--form 영역-->
                        <div class="form_right">
                            <div class="formBox">
                                <input class="input-large97" id="pipelineName" name="pipelineName" type="text" placeholder="" autofocus>
                            </div>
                        </div>
                        <!--//form 영역-->
                    </div>
                    <!--//기본 영역 -->
                    <!-- 기본 영역 -->
                    <div class="form_info">
                        <!--타이틀 영역-->
                        <div class="form_left">
                            <p class="title">파이프라인 설명 <span class="bold500">(선택)</span></p>
                        </div>
                        <!--//타이틀 영역-->
                        <!--form 영역-->
                        <div class="form_right">
                            <div class="formBox">
                                <textarea type="text" style="width:96%;" colos="20" rows="10" onfocus="resize(this)" id="description"></textarea>
                            </div>
                        </div>
                        <!--//form 영역-->
                    </div>
                    <!--//기본 영역 -->
                    <!-- 버튼 영역 -->
                    <div class="btn_Area plr20">
                        <div class="fr">
                            <button type="button" class="button btn_default" title="생성" id="btnCreate">생성</button>
                            <button type="button" class="button btn_default" title="취소" id="btnCancel">취소</button>
                        </div>
                    </div>
                    <!--//버튼 영역-->
                </div>
                <!--//form (contBox) -->
            <%--</form>--%>
        </div>
        <!--//sub content :e -->
    </div>
    <!--//content :e -->
</div>
<!--//container :e -->

<%--<br>--%>
<%--Pipeline 등록 페이지 :: PIPELINE CREATE PAGE--%>
<%--<br>--%>
<%--<ul>--%>
    <%--<li>이름 :: <input type="text" id="name" title="" value="파이프라인 이름"></li>--%>
<%--</ul>--%>
<%--<br>--%>
<%--<button type="button" id="btnCreate"> [ 등록 ] </button>--%>
<%--<br>--%>
<%--<h1>RESULT</h1>--%>
<%--<div id="resultArea" style="width: 90%; height: auto; min-height: 100px; padding: 10px; border: dotted #ff8c00 4px;">--%>
<%--</div>--%>
<input type="hidden" id="serviceInstancesId" name="serviceInstancesId" value="<c:out value='${suid}' default='' />" />

<script type="text/javascript">


    // CALLBACK
    var callbackCreatePipeline = function(data) {
        procCallSpinner(SPINNER_STOP);
        if (RESULT_STATUS_FAIL === data.resultStatus) return false;
        procPopupAlert('생성 되었습니다.', 'procMovePage("/pipeline/dashboard");');
    };

    // CREATE USER
    var createPipeline = function() {
        procCallSpinner(SPINNER_START);
        var reqParam = {
            name: document.getElementById('pipelineName').value,
            serviceInstancesId: document.getElementById('serviceInstancesId').value,
            description : document.getElementById('description').value
        };

        procCallAjax("/pipeline/pipelineCreate.do", reqParam, callbackCreatePipeline);
    };


    // BIND
    $("#btnCreate").on("click", function() {
        var name = document.getElementById('pipelineName').value;
        if(name =='' || name == null || name == undefined){
            procPopupAlert('파이프라인 명은 필수입니다.');
            return false;
        }
        procPopupConfirm('파이프라인 신규 생성', '생성 하시겠습니까?', 'createPipeline();');
    });


    // BIND
    $("#btnCancel").on("click", function() {
        procMovePage(-1);
    });


    // ON LOAD
    $(document.body).ready(function () {
        procCallSpinner(SPINNER_START);
        procCallSpinner(SPINNER_STOP);
    });

</script>
