<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>农行线上支付平台-商户接口范例-农行支付下单/一码多扫下单</title>
    <link rel="stylesheet" type="text/css" href="/css/semantic.css">
    <script src="/js/jquery.min.js"></script>
    <script src="/js/semantic.js"></script>
    <script src="/js/util.js"></script>
</head>
<body>
<div class="main ui container" style="padding-top: 100px; padding-bottom: 100px">
    <div>
        <div class="ui horizontal divider" style="font-size: large;">农行支付下单/一码多扫下单</div>
        <div class="ui message hidden">
            <i class="close icon"></i>
            <div class="header">返回报文：</div>
            <p style="word-break: break-all"></p>
        </div>
        <form class="ui form" action="/Order/MerchantPayment" method="post">
            <div class="five fields">
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="支付账户类型，1：农行借记卡 2：国际卡 3：农行贷记卡 A：农行借记卡、贷记卡/一码多扫 6：银联跨行 7：农行对公账户">支付账户类型*</label>
                    <select class="ui selection dropdown" name="PaymentType">
                        <option value="1">农行借记卡</option>
                        <option value="2">国际卡</option>
                        <option value="3">农行贷记卡</option>
                        <option value="A" selected>农行借贷记卡/一码多扫</option>
                        <option value="6">银联跨行</option>
                        <option value="7">农行对公账户</option>
                    </select>
                </div>
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="支付交易渠道，1：电脑网络接入 2：手机网络接入 3：数字电视网络接入 4：智能客户端接入">支付交易渠道*</label>
                    <select class="ui selection dropdown" name="PaymentLinkType">
                        <option value="1" selected>电脑网络接入</option>
                        <option value="2">手机网络接入</option>
                        <option value="3">数字电视网络接入</option>
                        <option value="4">智能客户端接入</option>
                    </select>
                </div>
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="支付结果通知方式，0：仅页面跳转通知 1：页面跳转通知和服务器通知">支付结果通知方式*</label>
                    <select class="ui selection dropdown" name="NotifyType">
                        <option value="0" selected>仅页面跳转通知</option>
                        <option value="1">页面跳转通知和服务器通知</option>
                    </select>
                </div>
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="商户接收支付结果通知地址，商户自己填写">通知URL地址*</label>
                    <input type="text" name="ResultNotifyURL" value="http://yourwebsite/appname/MerchantResult.jsp">
                </div>
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="交易类型，ImmediatePay：普通支付 DividedPay：分期支付 PreAuthPay：预授权支付">交易类型*</label>
                    <select class="ui selection dropdown" name="PayTypeID">
                        <option value="ImmediatePay" selected>普通支付</option>
                        <option value="DividedPay">分期支付</option>
                        <option value="PreAuthPay">预授权支付</option>
                    </select>
                </div>
            </div>
            <div class="five fields">
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="YYYY/MM/DD">订单日期*</label>
                    <input type="text" name="OrderDate">
                </div>
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="HH:MM:SS">订单时间*</label>
                    <input type="text" name="OrderTime">
                </div>
                <div class="field">
                    <label>订单号*</label>
                    <input type="text" name="OrderNo">
                </div>
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="交易币种，请上送156人民币">交易币种*</label>
                    <input type="text" name="CurrencyCode" value="156">
                </div>
                <div class="field">
                    <label>交易金额*</label>
                    <input type="text" name="OrderAmount" value="1.00">
                </div>
            </div>
            <div class="five fields">
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="CommodityType: 0101:支付账户充值，0201:虚拟类，0202:传统类，0203:实名类，0301:本行转账，0302:他行转账，
                           0401:水费，0402:电费，0403:煤气费，0404:有线电视费，0405:通讯费，0406:物业费，0407:保险费，0408:行政费用，0409:税费，0410:学费，0499:其他，0501:基金，0502:理财产品，0599:其他">商品类型*</label>
                    <input type="text" name="CommodityType" value="0101">
                </div>
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="请上送客户真实IP">客户IP*</label>
                    <input type="text" name="BuyIP" value="127.0.0.1">
                </div>
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="产品名称，将显示在农行支付页面">产品名称*</label>
                    <input type="text" name="ProductName" value="中国移动IP卡" onchange="addOrderItems(); return false">
                </div>
                <div class="field">
                    <label>指定商户收款账户账号</label>
                    <input type="text" name="ReceiveAccount" value="">
                </div>
                <div class="field">
                    <label>指定商户收款账户户名</label>
                    <input type="text" name="ReceiveAccName" value="">
                </div>
            </div>
            <div class="five fields">
                <div class="field">
                    <label>附言</label>
                    <input type="text" name="MerchantRemarks" value="">
                </div>
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="农行模板分账或者平台商户的二级商户分账时必输，1：进行分账 0：不进行分账">交易是否支持向二级商户分账</label>
                    <select class="ui selection dropdown" name="IsBreakAccount">
                        <option value="0" selected>不进行分账</option>
                        <option value="1">进行分账</option>
                    </select>
                </div>
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="农行模板分账时必输，模板分账模板号">模板分账模板号</label>
                    <input type="text" name="SplitAccTemplate" value="">
                </div>
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="农行支付以及一码多扫支付订单超时时间。如果不上送，农行支付超时时间默认半小时，一码多扫默认无超时时间">订单超时时间</label>
                    <input type="text" name="orderTimeoutDate" value="20171231000000">
                </div>
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="补贴金额，需平台商户结合补贴交易使用">补贴金额</label>
                    <input type="text" name="SubsidyAmount" value="1.00">
                </div>
            </div>
            <div class="five fields">
                <div class="field">
                    <label>手续费金额</label>
                    <input type="text" name="Fee" value="">
                </div>
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="指定客户支付账户，仅针对农行普通支付">指定客户支付账户</label>
                    <input type="text" name="AccountNo" value="">
                </div>
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="使用一码多扫时该字段内容将展示在微信和支付宝付款界面，如不上送默认为商品订单描述">订单描述</label>
                    <input type="text" name="OrderDesc" value="">
                </div>
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="一码多扫微信支付完成自动跳转URL地址，该地址需base64后填入">一码多扫完成自动跳转URL地址</label>
                    <input type="text" name="OrderURL" value="">
                </div>
                <div class="field">
                    <label>收货地址</label>
                    <input type="text" name="ReceiverAddress" value="北京">
                </div>
            </div>
            <div class="five fields">
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="分期支付时需要上送，1：进行分期支付，0：不进行分期支付">分期标识</label>
                    <select class="ui selection dropdown" name="InstallmentMark">
                        <option value="0" selected>不进行分期支付</option>
                        <option value="1">进行分期支付</option>
                    </select>
                </div>
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="分期支付时需要上送，分期代码">分期代码</label>
                    <input type="text" name="InstallmentCode" value="">
                </div>
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="分期支付时需要上送，分期期数">分期期数</label>
                    <input type="text" name="InstallmentNum" value="">
                </div>
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="过期时间，历史字段，无需上送">过期时间</label>
                    <input type="text" name="ExpiredDate" value="30">
                </div>
                <div class="field">
                    <label>分账子商户号</label>
                    <input type="text" name="SplitMerchantID" value="001">
                </div>
            </div>
            <div class="five fields">
                <div class="field">
                    <label data-position="top left"
                           data-tooltip="所有子商户分账金额的总和需要等于该笔的订单金额">子商户分账金额</label>
                    <input type="text" name="SplitAmount" value="0.01">
                </div>
                <div class="thirteen wide field">
                    <label>平台商户当前分账情况</label>
                    <input type="text" name="SplitAccInfoItems" value="">
                </div>
            </div>
            <div class="field">
                <input type="hidden" name="OrderItems" value="">
            </div>
            <button class="ui button" onclick="addSubInfo(); return false;">添加当前分账信息</button>
            <button class="ui button" onclick="clearSubInfo(); return false;">清除当前分账信息</button>
            <br><br>
            <button class="ui button" type="request" onclick="request(this); return false;">提交</button>
            <br><br>
        </form>
    </div>
</div>
</body>
<script language="javascript" type="text/javascript">
    $(function () {
        var orderItems = new Array();
        $('.ui.selection.dropdown').dropdown();
        $("input[name='OrderDate']").val(getOrderDate());
        $("input[name='OrderTime']").val(getOrderTime());
        $("input[name='OrderNo']").val(getOrderNo());
        let ProductName = $("input[name='ProductName']").val();
        orderItems.push({ProductName: ProductName});
        $("input[name='OrderItems']").val(JSON.stringify(orderItems));
    });
    $('.message .close')
        .on('click', function () {
            $(this).closest('.message').transition('fade');
        });

    function request(object) {
        let responseBoard = $(object).parent().prev();
        let responseBoardMessag = responseBoard.children("p:last-child");
        let form = $(object).parent();
        let action = form.attr("action");
        $.ajax({
            type: "POST",
            dataType: "json",
            url: action,
            data: form.serialize(),
            success: function (result) {
                console.log(result);
                responseBoardMessag.html(JSON.stringify(result));
                if (!responseBoard.hasClass('visible')) responseBoard.transition('fade');
            },
            error: function () {
                console.log("请求农行网上支付平台失败");
            }
        });
    }

    function addOrderItems() {
        var items = new Array();
        let ProductName = $("input[name='ProductName']").val();
        items.push({ProductName: ProductName});
        $("input[name='OrderItems']").val(JSON.stringify(items));
    }

    var splitAccInfoItems = new Array();

    function addSubInfo() {
        let splitMerchantID = $("input[name='SplitMerchantID']").val();
        let splitAmount = $("input[name='SplitAmount']").val();
        splitAccInfoItems.push({SplitMerchantID: splitMerchantID, SplitAmount: splitAmount});
        $("input[name='SplitAccInfoItems']").val(JSON.stringify(splitAccInfoItems));
    }

    function clearSubInfo() {
        splitAccInfoItems = [];
        $("input[name='SplitAccInfoItems']").val("");
    }
</script>
</html>
