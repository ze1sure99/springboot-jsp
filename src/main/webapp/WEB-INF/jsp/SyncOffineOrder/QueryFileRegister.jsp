<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.abc.pay.client.*" %>
<%@ page import="com.abc.pay.client.ebus.common.EBusMerchantCommonRequest" %>
<%
    EBusMerchantCommonRequest eBusMerchantCommonRequest = new EBusMerchantCommonRequest();
    eBusMerchantCommonRequest.dicRequest.put("TrxType", "QueryFileRegister");
    eBusMerchantCommonRequest.dicRequest.put("BatchDate", request.getParameter("BatchDate"));
    eBusMerchantCommonRequest.dicRequest.put("BatchNo", request.getParameter("BatchNo"));
    eBusMerchantCommonRequest.dicRequest.put("ZIP", request.getParameter("ZIP"));
    JSON responseJson = eBusMerchantCommonRequest.postRequest();
    out.print(responseJson.getIJsonString());
%>