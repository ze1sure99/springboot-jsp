<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.abc.pay.client.*" %>
<%@ page import="com.abc.pay.client.ebus.PaymentRequest" %>
<%
    request.setCharacterEncoding("gb2312");
    response.setHeader("Cache-Control", "no-cache");
%>
<%
    PaymentRequest tPaymentRequest = new PaymentRequest();
    tPaymentRequest.dicOrder.put("PayTypeID", request.getParameter("PayTypeID"));                   //�趨��������
    tPaymentRequest.dicOrder.put("OrderDate", request.getParameter("OrderDate"));                  //�趨�������� ����Ҫ��Ϣ - YYYY/MM/DD��
    tPaymentRequest.dicOrder.put("OrderTime", request.getParameter("OrderTime"));                   //�趨����ʱ�� ����Ҫ��Ϣ - HH:MM:SS��
    tPaymentRequest.dicOrder.put("orderTimeoutDate", request.getParameter("orderTimeoutDate"));     //�趨������Ч��
    tPaymentRequest.dicOrder.put("OrderNo", request.getParameter("OrderNo"));                       //�趨������� ����Ҫ��Ϣ��
    tPaymentRequest.dicOrder.put("CurrencyCode", request.getParameter("CurrencyCode"));             //�趨���ױ���
    tPaymentRequest.dicOrder.put("OrderAmount", request.getParameter("PaymentRequestAmount"));      //�趨���׽��
    tPaymentRequest.dicOrder.put("Fee", request.getParameter("Fee"));                               //�趨�����ѽ��
    tPaymentRequest.dicOrder.put("AccountNo", request.getParameter("AccountNo"));                   //�趨֧���˻�
    tPaymentRequest.dicOrder.put("OrderDesc", request.getParameter("OrderDesc"));                   //�趨����˵��
    tPaymentRequest.dicOrder.put("OrderURL", request.getParameter("OrderURL"));                     //�趨������ַ
    tPaymentRequest.dicOrder.put("ReceiverAddress", request.getParameter("ReceiverAddress"));       //�ջ���ַ
    tPaymentRequest.dicOrder.put("InstallmentMark", request.getParameter("InstallmentMark"));       //���ڱ�ʶ
    if (request.getParameter("InstallmentMark") == "1" && request.getParameter("PayTypeID") == "DividedPay") {
        tPaymentRequest.dicOrder.put("InstallmentCode", request.getParameter("InstallmentCode"));   //�趨���ڴ���
        tPaymentRequest.dicOrder.put("InstallmentNum", request.getParameter("InstallmentNum"));     //�趨��������
    }
    tPaymentRequest.dicOrder.put("CommodityType", request.getParameter("CommodityType"));           //������Ʒ����
    tPaymentRequest.dicOrder.put("BuyIP", request.getParameter("BuyIP"));                           //IP
    tPaymentRequest.dicOrder.put("ExpiredDate", request.getParameter("ExpiredDate"));               //�趨��������ʱ��
    tPaymentRequest.dicOrder.put("OrderItems", request.getParameter("OrderItems"));               //�趨��Ʒ����
    String paymentType = request.getParameter("PaymentType");
    tPaymentRequest.dicRequest.put("PaymentType", paymentType);            //�趨֧������
    String paymentLinkType = request.getParameter("PaymentLinkType");
    tPaymentRequest.dicRequest.put("PaymentLinkType", paymentLinkType);    //�趨֧�����뷽ʽ
    if (paymentType.equals(Constants.PAY_TYPE_UCBP) && paymentLinkType.equals(Constants.PAY_LINK_TYPE_MOBILE)) {
        tPaymentRequest.dicOrder.put("UnionPayLinkType", request.getParameter("UnionPayLinkType"));  //��֧������Ϊ6��֧�����뷽ʽΪ2����������ʱ����Ҫ�������������ƶ�֧�����뷽ʽ
    }
    tPaymentRequest.dicRequest.put("ReceiveAccount", request.getParameter("ReceiveAccount"));    //�趨�տ�˺�
    tPaymentRequest.dicRequest.put("ReceiveAccName", request.getParameter("ReceiveAccName"));    //�趨�տ����
    tPaymentRequest.dicRequest.put("NotifyType", request.getParameter("NotifyType"));    //�趨֪ͨ��ʽ
    tPaymentRequest.dicRequest.put("ResultNotifyURL", request.getParameter("ResultNotifyURL"));    //�趨֪ͨURL��ַ
    tPaymentRequest.dicRequest.put("MerchantRemarks", request.getParameter("MerchantRemarks"));    //�趨����
    tPaymentRequest.dicRequest.put("IsBreakAccount", request.getParameter("IsBreakAccount"));    //�趨�����Ƿ����
    tPaymentRequest.dicRequest.put("SplitAccTemplate", request.getParameter("SplitAccTemplate"));      //����ģ����
    MerchantPara para = MerchantConfig.getUniqueInstance().getPara();
    String sTrustPayIETrxURL = para.getTrustPayTrxIEURL();
    String sErrorUrl = para.getMerchantErrorURL();
    String tSignature = "";
    try {
        tSignature = tPaymentRequest.genSignature(1);
    } catch (TrxException e) {
        request.setAttribute("tReturnCode", e.getCode());
        request.setAttribute("tErrorMsg", e.getMessage());
        request.getRequestDispatcher("/ErrorPageInternal.jsp").forward(request, response);
        return;
    }
%>

<html>
<meta charset="gb2312">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<link rel="stylesheet" type="text/css" href="../../../../../../../../../demo/css/semantic.css">
<script src="../../../../../../../../../demo/js/jquery.min.js"></script>
<script src="../../../../../../../../../demo/js/semantic.js"></script>
<script src="../../../../../../../../../demo/js/util.js"></script>
<body>
<div class="main ui container" style="padding-top: 100px; padding-bottom: 100px">
    <form name="form"  type="hidden" method="post" action="<%=sTrustPayIETrxURL%>">
        <input type="hidden" name="MSG" value="<%=tSignature%>">
        <input type="hidden" name="errorPage" value="<%=sErrorUrl%>">
    </form>
</div>
</body>
<script language="javascript" type="text/javascript">
    $(function () {
        $("form[name='form']").submit();
    })
</script>
</html>