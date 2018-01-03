<style type="text/css">
.cls-data-table-detail{
    width:90%;
    BORDER-COLLAPSE:   collapse;
    border:1px solid #999;
}
.cls-data-th-detail{ 
    background-color: #ACCCFF;
    height:33px;
    text-align: right;
    background-color: #EBF0FE;
    border:1px solid #999;
    padding:0 5px 0 0;
    font-size:12px;
}
.cls-data-td-detail{ 
    border:1px solid #999; 
    height:35px;min-height:23px;
    font-size:12px;
}

</style>
<B><#if NAME_CN ??>${NAME_CN}</#if>:</B><BR/>
<span>&nbsp;&nbsp;&nbsp;&nbsp;您刚收到一条待办任务：</span>
<table class='cls-data-table-detail' cellspacing='0' cellpadding='0'>
  <tr>
    <td class="cls-data-th-detail">
                        任务名称
    </td>
    <td class="cls-data-td-detail">
        <#if TASK_NAME ??>${TASK_NAME}</#if>
    </td>
  </tr>
  <tr>
    <td class="cls-data-th-detail">
                        任务类型
    </td>
    <td class="cls-data-td-detail">
        <#if TASK_CLASS_NAME ??>${TASK_CLASS_NAME}</#if>
    </td>
  </tr>  
  <tr>
    <td class="cls-data-th-detail">
                         发送人
    </td>
    <td class="cls-data-td-detail">
        <#if PUBLISH_USER ??>${PUBLISH_USER}</#if>
    </td>
  </tr>
  <tr>
    <td class="cls-data-th-detail">
                       发送时间
    </td>
    <td class="cls-data-td-detail">
        <#if PUBLISH_TIME ??>${PUBLISH_TIME}</#if>
    </td>
  </tr>
  <tr>
    <td class="cls-data-th-detail">
                      任务时限
    </td>
    <td class="cls-data-td-detail">
        <#if TASK_ENDTIME ??>${TASK_ENDTIME}</#if>
    </td>
  </tr>  
  <tr>
    <td colspan="2" class="cls-data-td-detail">
        <a href="${ContextPath}<#if TASK_URL ??>${TASK_URL}</#if>" target="_blank">点击处理</a>
    </td>
  </tr>
</table>  
<BR>
<span>系统自动发送邮件，请勿回复！</span>