<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.abc.pay.client.ebus.*" %>
<%@ page import="java.net.URLDecoder" %>
<% response.setHeader("Cache-Control", "no-cache"); %>
<%
    //1��ȡ��MSG�����������ô˲���ֵ������֤�������
    String msg = URLDecoder.decode(request.getParameter("MSG"), "GBK");
    AgentSignResult tResult = new AgentSignResult(msg);
//2���ж���֤���״̬�����к�������
    if (tResult.isSuccess()) {
        //3��ǩԼ��Լ�ɹ�
        if (tResult.getValue("TrxType").equals(TrxType.TRX_TYPE_EBUS_AGENT_SIGN.toUpperCase())) {
            out.println("ǩԼ�ɹ�<br>");
            out.println("ǩԼЭ���: [" + tResult.getValue("AgentSignNo") + "]<br>");
            out.println("ǩԼ���ź�4λ: [" + tResult.getValue("Last4CardNo") + "]<br>");
        } else if (tResult.getValue("TrxType").equals(TrxType.TRX_TYPE_AGENT_UNSIGN.toUpperCase())) {
            out.println("��Լ�ɹ�<br>");
        }
        out.println("OrderNo         = [" + tResult.getValue("OrderNo") + "]<br>");

    } else {
        //4��ǩԼ��Լʧ��
        out.println("ReturnCode   = [" + tResult.getReturnCode() + "]<br>");
        out.println("ErrorMessage = [" + tResult.getErrorMessage() + "]<br>");
    }
%>