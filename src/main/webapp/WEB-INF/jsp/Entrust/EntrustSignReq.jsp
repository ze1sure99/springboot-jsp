<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.abc.pay.client.*" %>
<%@ page import="com.abc.pay.client.ebus.common.EBusMerchantCommonRequest" %>
<%
    /*���̻�ģʽ�£�Ĭ��ʹ�õ�һ���̻���Ϊ�����̻� */

    EBusMerchantCommonRequest eBusMerchantCommonRequest = new EBusMerchantCommonRequest();

    eBusMerchantCommonRequest.dicRequest.put("TrxType", "EntrustSignReq");
    eBusMerchantCommonRequest.dicRequest.put("SignNo", request.getParameter("SignNo"));
    eBusMerchantCommonRequest.dicRequest.put("BusinessCode", request.getParameter("BusinessCode"));
    eBusMerchantCommonRequest.dicRequest.put("SignChannel", request.getParameter("SignChannel"));
    eBusMerchantCommonRequest.dicRequest.put("SubMerchantID", request.getParameter("SubMerchantID"));
    eBusMerchantCommonRequest.dicRequest.put("SinglePaymentLimit", request.getParameter("SinglePaymentLimit"));
    eBusMerchantCommonRequest.dicRequest.put("InValidDate", request.getParameter("InValidDate"));
    eBusMerchantCommonRequest.dicRequest.put("PayUnit", request.getParameter("PayUnit"));
    eBusMerchantCommonRequest.dicRequest.put("PayStep", request.getParameter("PayStep"));
    eBusMerchantCommonRequest.dicRequest.put("PayFrequency", request.getParameter("PayFrequency"));
    eBusMerchantCommonRequest.dicRequest.put("CustomAccType", request.getParameter("CustomAccType"));
    eBusMerchantCommonRequest.dicRequest.put("CustomAccNo", request.getParameter("CustomAccNo"));
    eBusMerchantCommonRequest.dicRequest.put("CustomPhone", request.getParameter("CustomPhone"));
    eBusMerchantCommonRequest.dicRequest.put("CustomName", request.getParameter("CustomName"));
    eBusMerchantCommonRequest.dicRequest.put("CustomCertType", request.getParameter("CustomCertType"));
    eBusMerchantCommonRequest.dicRequest.put("CustomCertNo", request.getParameter("CustomCertNo"));

    /*���̻�ģʽ�£�Ĭ��ʹ�õ�һ���̻���Ϊ�����̻�*/
    JSON responseJson = eBusMerchantCommonRequest.postRequest();
    /**
     * ���̻�ģʽ�£���Ҫʹ�����·�����ѡ���ĸ��̻���Ϊ�����̻�
     *
     * JSON json = tPaymentRequest.extendPostRequest(1);
     *
     * */
    out.print(responseJson.getIJsonString());

%>
