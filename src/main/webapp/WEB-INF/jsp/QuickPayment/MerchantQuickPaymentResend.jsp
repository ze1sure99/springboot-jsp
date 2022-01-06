<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.abc.pay.client.*" %>
<%@ page import="com.abc.pay.client.ebus.common.EBusMerchantCommonRequest" %>
<%
    EBusMerchantCommonRequest eBusMerchantCommonRequest = new EBusMerchantCommonRequest();
    eBusMerchantCommonRequest.dicRequest.put("TrxType", "KPayResendReq");
    eBusMerchantCommonRequest.dicRequest.put("OrderNo", request.getParameter("OrderNo"));                       //设定订单编号 （必要信息）
    eBusMerchantCommonRequest.dicRequest.put("CurrencyCode", request.getParameter("CurrencyCode"));    //设定交易币种
    eBusMerchantCommonRequest.dicRequest.put("OrderAmount", request.getParameter("OrderAmount")); //设定订单金额 （必要信息）
    eBusMerchantCommonRequest.dicRequest.put("OrderDate", request.getParameter("OrderDate"));    //设定订单日期 （必要信息 - YYYY/MM/DD）
    eBusMerchantCommonRequest.dicRequest.put("OrderTime", request.getParameter("OrderTime"));                   //设定订单时间 （必要信息 - HH:MM:SS）
    JSON responseJson = eBusMerchantCommonRequest.postRequest();
    out.print(responseJson.getIJsonString());

%>