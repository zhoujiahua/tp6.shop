<?php
/**
 * Created by singwa
 * User: singwa
 * motto: 现在的努力是为了小时候吹过的牛逼！
 * Time: 22:37
 */

namespace app\controller;

use app\lib\pay\weixin\lib\database\WxPayUnifiedOrder;
use app\lib\pay\weixin\lib\WxPayNativePay;
// 必须要添加这个哦。
use think\annotation\Route;
use app\lib\Show;

use app\business\Pay as PayBis;
use think\facade\Cache;
class Pay extends AuthBase
{

    /**
     * 支付demo
     */
    public function index() {
        $notify = new WxPayNativePay();
        $input = new WxPayUnifiedOrder();
        $input->SetBody("singwa商城");
        $input->SetAttach("欢迎选购");
        $input->SetOut_trade_no("singwa".date("YmdHis"));
        $input->SetTotal_fee("1");
        $input->SetTime_start(date("YmdHis"));
        $input->SetTime_expire(date("YmdHis", time() + 300));
        $input->SetGoods_tag("test");
        $input->SetNotify_url("https://pay.singwa666.com/pay/notify/weixin");
        $input->SetTrade_type("NATIVE");
        $input->SetProduct_id("123456789");

        $result = $notify->GetPayUrl($input);
        $url2 = $result["code_url"];

        //echo "<img src='".url("qcode/index", ["data"=>$url2])."'>";
        echo "<img src='http://127.0.0.1:8666/qcode/index.html?data=weixin%3A%2F%2Fwxpay%2Fbizpayurl%3Fpr%3DyfUgY5H'>";
    }

    /**
     * 备注下 需要讲解注解路由哦  下单API
     * @return string
     * @Route("unifiedOrder", method="POST")
     */
    public function unifiedOrder() {
        // 基本参数需要判断哦 小伙伴自行完成。
        $params = input("param.");
        try {
            $result = (new PayBis())->unifiedOrder($this->appId, $this->payType, $params);
        }catch (\Exception $e) {
            return Show::error($e->getMessage());
        }
        if(!$result) {
            return Show::error("下单失败");
        }
        return Show::success($result);
    }

    /**
     * @Route("getOrder", method="POST")
     * 对外API
     */
    public function getOrder() {
        try {
            $orderId = input("param.order_id", "", "trim");
            if (!$orderId) {
                return Show::error("订单ID错误");
            }
            $result = (new PayBis())->getOrder($orderId, $this->appId);
        }catch (\Exception $e) {
            //echo $e->getMessage();exit;
            return Show::error();
        }
        if(!$result) {
            return Show::error();
        }
        return Show::success($result);
    }
}
