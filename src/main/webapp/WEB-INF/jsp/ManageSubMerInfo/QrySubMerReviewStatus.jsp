<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.abc.pay.client.JSON" %>
<%@ page import="com.abc.pay.client.ebus.common.EBusMerchantCommonRequest" %>
<%
    EBusMerchantCommonRequest eBusMerchantCommonRequest = new EBusMerchantCommonRequest();
    eBusMerchantCommonRequest.dicRequest.put("TrxType", "QrySubMerReviewStatus");
    eBusMerchantCommonRequest.dicRequest.put("SubMerchantNo", request.getParameter("txtSubMerId"));
    eBusMerchantCommonRequest.dicRequest.put("SerialNo", request.getParameter("txtSerialNo"));
    JSON responseJson = eBusMerchantCommonRequest.postRequest();
    String ReturnCode = responseJson.GetKeyValue("ReturnCode");
    String ErrorMessage = responseJson.GetKeyValue("ErrorMessage");
    if (ReturnCode.equals("0000"))
    {
        //5、请求提交成功，返回结果信息
        out.println("ReturnCode   = [" + ReturnCode + "]<br/>");
        out.println("ErrorMessage = [" + ErrorMessage + "]<br/>");
        //strMessage.append("ECMerchantType   = [" + json.GetKeyValue("ECMerchantType") + "]<br/>");
        out.println("审核状态码 : [" + responseJson.GetKeyValue("isPassed") + "]<br/>");
        //out.println("TrxType = [" + json.GetKeyValue("TrxType") + "]<br/>");
        //out.println("SubMerSignNo = [" + json.GetKeyValue("SubMerSignNo") + "]<br/>");
        //out.println("您的申请单号为 : [" + json.GetKeyValue("SerialNo") + "]<br/>");
    }
    else
    {
        //6、请求提交失败，商户自定后续动作
        out.println("ReturnCode   = [" + ReturnCode + "]<br/>");
        out.println("ErrorMessage = [" + ErrorMessage + "]<br/>");
    }
%>