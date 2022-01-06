package com.ze1sure99.controller;


import com.abc.pay.client.JSON;
import com.abc.pay.client.ebus.common.EBusMerchantCommonRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.LinkedHashMap;

@Controller
@RequestMapping("/Order")
public class OrderController {
    @RequestMapping("/MerchantPayment")
    public String MerchantPayment(HttpServletRequest request){
        EBusMerchantCommonRequest eBusMerchantCommonRequest = new EBusMerchantCommonRequest();
        eBusMerchantCommonRequest.dicRequest.put("PaymentType", request.getParameter("PaymentType"));            //设定支付类型
        eBusMerchantCommonRequest.dicRequest.put("PaymentLinkType", request.getParameter("PaymentLinkType"));    //设定支付接入方式
        eBusMerchantCommonRequest.dicRequest.put("ReceiveAccount", request.getParameter("ReceiveAccount"));      //设定收款方账号
        eBusMerchantCommonRequest.dicRequest.put("ReceiveAccName", request.getParameter("ReceiveAccName"));      //设定收款方户名
        eBusMerchantCommonRequest.dicRequest.put("NotifyType", request.getParameter("NotifyType"));              //设定通知方式
        eBusMerchantCommonRequest.dicRequest.put("ResultNotifyURL", request.getParameter("ResultNotifyURL"));    //设定通知URL地址
        eBusMerchantCommonRequest.dicRequest.put("MerchantRemarks", request.getParameter("MerchantRemarks"));    //设定附言
        eBusMerchantCommonRequest.dicRequest.put("IsBreakAccount", request.getParameter("IsBreakAccount"));      //设定交易是否分账、交易是否支持向二级商户入账
        eBusMerchantCommonRequest.dicRequest.put("SplitAccTemplate", request.getParameter("SplitAccTemplate"));  //分账模版编号
        LinkedHashMap dicOrder = new LinkedHashMap();
        eBusMerchantCommonRequest.dicRequest.put("TrxType", "PayReq");
        dicOrder.put("PayTypeID", request.getParameter("PayTypeID"));                   //设定交易类型
        dicOrder.put("OrderDate", request.getParameter("OrderDate"));                  //设定订单日期 （必要信息 - YYYY/MM/DD）
        dicOrder.put("OrderTime", request.getParameter("OrderTime"));                   //设定订单时间 （必要信息 - HH:MM:SS）
        dicOrder.put("orderTimeoutDate", request.getParameter("orderTimeoutDate"));     //设定订单有效期
        dicOrder.put("OrderNo", request.getParameter("OrderNo"));                       //设定订单编号 （必要信息）
        dicOrder.put("CurrencyCode", request.getParameter("CurrencyCode"));             //设定交易币种
        dicOrder.put("OrderAmount", request.getParameter("OrderAmount"));      //设定交易金额
        dicOrder.put("SubsidyAmount", request.getParameter("SubsidyAmount"));       //设定补贴金额
        dicOrder.put("Fee", request.getParameter("Fee"));                               //设定手续费金额
        dicOrder.put("AccountNo", request.getParameter("AccountNo"));                   //设定支付账户
        dicOrder.put("OrderDesc", request.getParameter("OrderDesc"));                   //设定订单说明
        dicOrder.put("OrderURL", request.getParameter("OrderURL"));                     //设定订单地址
        dicOrder.put("ReceiverAddress", request.getParameter("ReceiverAddress"));       //收货地址
        dicOrder.put("InstallmentMark", request.getParameter("InstallmentMark"));       //分期标识
        if (("1".equals(request.getParameter("InstallmentMark"))) && ("DividedPay".equals(request.getParameter("PayTypeID")))) {
            dicOrder.put("InstallmentCode", request.getParameter("InstallmentCode"));   //设定分期代码
            dicOrder.put("InstallmentNum", request.getParameter("InstallmentNum"));     //设定分期期数
        }
        dicOrder.put("CommodityType", request.getParameter("CommodityType"));           //设置商品种类
        dicOrder.put("BuyIP", request.getParameter("BuyIP"));                           //IP
        dicOrder.put("ExpiredDate", request.getParameter("ExpiredDate"));               //设定订单保存时间
        dicOrder.put("OrderItems",request.getParameter("OrderItems"));
        dicOrder.put("SplitAccInfoItems", request.getParameter("SplitAccInfoItems"));    //平台商户当前分账情况
        eBusMerchantCommonRequest.dicRequest.put("Order", dicOrder);
        JSON responseJson = eBusMerchantCommonRequest.postRequest();
        System.out.println(responseJson.GetKeyValue("ReturnCode"));
        System.out.println(responseJson.getIJsonString());

        return  "index";
    }
}
