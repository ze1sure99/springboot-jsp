<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.abc.pay.client.ebus.*" %>
<%@ page import="java.net.URLDecoder" %>
<% response.setHeader("Cache-Control", "no-cache"); %>
<%
    //1��ȡ��MSG�����������ô˲���ֵ������֤�������

    String msg = URLDecoder.decode(request.getParameter("MSG"), "GBK");
    PaymentResult tResult = new PaymentResult(msg);
//2���ж���֤���״̬�����к�������
    if (tResult.isSuccess()) {
        //3����֤�ɹ�
        out.println("����         = [" + tResult.getValue("AccountName") + "]<br>");

    } else {
        //4����֤ʧ��
        out.println("ReturnCode   = [" + tResult.getReturnCode() + "]<br>");
        out.println("ErrorMessage = [" + tResult.getErrorMessage() + "]<br>");
    }
%>