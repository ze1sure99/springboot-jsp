<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.abc.pay.client.*" %>
<%@ page import="com.abc.pay.client.ebus.SubEWalletPay" %>
<%
    /*���̻�ģʽ�£�Ĭ��ʹ�õ�һ���̻���Ϊ�����̻� */

    SubEWalletPay subEWalletPay = new SubEWalletPay();

    subEWalletPay.dicRequest.put("TrxType", "SubEWalletPayForOutter");
    subEWalletPay.dicRequest.put("OrderNo", request.getParameter("OrderNo"));
    subEWalletPay.dicRequest.put("Token", request.getParameter("Token"));
    subEWalletPay.dicRequest.put("OrderAmount", request.getParameter("OrderAmount"));
    subEWalletPay.dicRequest.put("OrderDesc", request.getParameter("OrderDesc"));
    subEWalletPay.dicRequest.put("MerchantRemarks", request.getParameter("MerchantRemarks"));



    /*���̻�ģʽ�£�Ĭ��ʹ�õ�һ���̻���Ϊ�����̻�*/
    JSON responseJson = subEWalletPay.postRequest();
    /**
     * ���̻�ģʽ�£���Ҫʹ�����·�����ѡ���ĸ��̻���Ϊ�����̻�
     *
     * JSON json = tPaymentRequest.extendPostRequest(1);
     *
     * */

    out.print(responseJson.getIJsonString());

%>
