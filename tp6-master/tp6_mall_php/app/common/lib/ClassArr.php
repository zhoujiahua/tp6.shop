<?php
/**
 * Created by singwa
 * User: singwa
 * motto: 现在的努力是为了小时候吹过的牛逼！
 * Time: 01:45
 */

namespace app\common\lib;

class ClassArr {

    public static function smsClassStat() {
        return [
            "ali" => "app\common\lib\sms\AliSms",
            "baidu" => "app\common\lib\sms\BaiduSms",
            "jd" => "app\common\lib\sms\JdSms",
        ];
    }
    public static function uploadClassStat() {
        return [
            'text' => 'xxx',
            'image' => 'xxx',
        ];
    }
    public static function initClass($type, $classs, $params = [], $needInstance = false) {
        // 如果我们工厂模式调用的方法是静态的，那么我们这个地方返回类库 AliSms
        // 如果不是静态的呢，我们就需要返回 对象
        if(!array_key_exists($type, $classs)) {
            return false;
        }
        $className = $classs[$type];

        // new ReflectionClass('A') => 建立A反射类
        // ->newInstanceArgs($args)  => 相当于实例化A对象
         return $needInstance == true ? (new \ReflectionClass($className))->newInstanceArgs($params) : $className;

    }
}