<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.abc.pay.client.*" %>
<%@ page import="com.abc.pay.client.ebus.common.EBusMerchantCommonRequest" %>
<%
    /*���̻�ģʽ�£�Ĭ��ʹ�õ�һ���̻���Ϊ�����̻� */

    EBusMerchantCommonRequest eBusMerchantCommonRequest = new EBusMerchantCommonRequest();

    eBusMerchantCommonRequest.dicRequest.put("TrxType", "EntrustSignResendSMS");
    eBusMerchantCommonRequest.dicRequest.put("SignNo", request.getParameter("SignNo"));
    eBusMerchantCommonRequest.dicRequest.put("CustomAccNo", request.getParameter("CustomAccNo"));

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