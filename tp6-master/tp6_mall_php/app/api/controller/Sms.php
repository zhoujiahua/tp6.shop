<?php
/**
 * Created by singwa
 * User: singwa
 * motto: 现在的努力是为了小时候吹过的牛逼！
 * Time: 23:38
 */
declare(strict_types=1);
namespace app\api\controller;

use app\BaseController;
use app\common\business\Sms as SmsBus;
class Sms extends BaseController {

    public function code() :object {
        $phoneNumber  =  input('param.phone_number', '', 'trim');

        $data = [
            'phone_number' => $phoneNumber,
        ];
        try {
            validate(\app\api\validate\User::class)->scene("send_code")->check($data);
        }catch (\think\exception\ValidateException $e ) {
            return show(config("status.error"), $e->getError());
        }

        // 两个作业：1、再对接一个短信sdk , 2、我们需要做下流控  20%流量=》阿里云短信 ， 80%的流量是对接其他（百度云短信）
        // 调用business层的数据
        if(SmsBus::sendCode($phoneNumber, 6, "ali")) {
            return show(config("status.success"), "发送验证码成功");
        }
        return show(config("status.error"), "发送验证码失败");
    }
}