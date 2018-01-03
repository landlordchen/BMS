<style type="text/css">
.cls-data-table-detail{
    width:90%;
    BORDER-COLLAPSE:   collapse;
    border:1px solid #999;
}
.cls-data-th-detail{ 
    background-color: #ACCCFF;
    height:33px;
    text-align: center;
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
<span>&nbsp;&nbsp;&nbsp;&nbsp;您有<#if TASK_NUM ??>${TASK_NUM}</#if>条待办任务：</span>
<table class='cls-data-table-detail' cellspacing='0' cellpadding='0'>
  <tr>
    <td class="cls-data-th-detail">任务名称 </td>
    <td class="cls-data-th-detail">任务名类型</td>
    <td class="cls-data-th-detail">发布人</td>
    <td class="cls-data-th-detail"发布时间 </td>
    <td class="cls-data-th-detail">任务时限</td>
    <td class="cls-data-th-detail">提醒次数</td>
    <td class="cls-data-th-detail">处理</td>

  </tr>
  <#list tasks as map> 
  <tr>
    <td class="cls-data-td-detail"><#if map.TASK_NAME ??>${map.TASK_NAME}</#if></td>  
    <td class="cls-data-td-detail"><#if map.TASK_CLASS_NAME ??>${map.TASK_CLASS_NAME}</#if></td>  
    <td class="cls-data-td-detail"><#if map.PUBLISH_USER ??>${map.PUBLISH_USER}</#if></td>  
    <td class="cls-data-td-detail"><#if map.PUBLISH_TIME ??>${map.PUBLISH_TIME}</#if></td>  
    <td class="cls-data-td-detail"><#if map.TASK_ENDTIME ??>${map.TASK_ENDTIME}</#if></td>  
    <td class="cls-data-td-detail"><#if map.REMIND_COUNT ??>${map.REMIND_COUNT}</#if></td>  
    <td class="cls-data-td-detail"><a href="${ContextPath}<#if map.TASK_URL ??>${map.TASK_URL}</#if>" target="_blank">处理</a></td>  
  </tr>
  </#list>
</table>  
<BR>
<span>系统自动发送邮件，请勿回复！</span>