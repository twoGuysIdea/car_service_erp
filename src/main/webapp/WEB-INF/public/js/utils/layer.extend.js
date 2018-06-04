/**
 * layer弹框
 * Created by 韩峰 on 2017/10/19.
 */
var myLayer = {

    /*
     * icon 1：绿勾 2：红叉 3：黄问号 5：红哭脸 6：绿笑脸
     */
    msgDef: "怂货，什么都没有，你想要我提示什么",

    // ------------------------消息提示框------------------------
    // layer.msg(content, options, end) - 提示框
    /**
     * 透明弹框
     * @param msg
     */
    msgLucency: function (msg) {
        if (!msg || !$.trim(msg)) {
            msg = myLayer.msgDef;
        }
        layer.msg(msg);
    },
    /**
     * 默认成功消息框
     */
    msgSuccess: function () {
        layer.msg("操作成功", {icon: 1,offset: '100px'});
    },
    /**
     * 默认失败消息框
     */
    msgError: function () {
        layer.msg("操作失败", {icon: 2,offset: '100px'});
    },
    /**
     * 成功消息框
     * @param msg (必填)
     * @param endFun (index)    确认回调函数(弹出层id)，该函数内部必须使用layer.close(index);
     */
    msgSuccessDef: function (msg, endFun) {
        if (!msg || !$.trim(msg)) {
            msg = myLayer.msgDef;
        }
        if ($.isFunction(endFun)) {
            layer.msg(msg, {icon: 1,offset: '100px'}, endFun);
        } else {
            layer.msg(msg, {icon: 1,offset: '100px'});
        }
    },
    /**
     * 失败消息框
     * @param msg (必填)
     * @param endFun (index)    确认回调函数(弹出层id)，该函数内部必须使用layer.close(index);
     */
    msgErrorDef: function (msg, endFun) {
        if (!msg || !$.trim(msg)) {
            msg = myLayer.msgDef;
        }
        if ($.isFunction(endFun)) {
            layer.msg(msg, {icon: 2,offset: '100px'},endFun);
        } else {
            layer.msg(msg, {icon: 2,offset: '100px'});
        }
    },


    // ------------------------alert(普通信息)框------------------------
    /*
     * layer.alert(content, options, yesFun)
     * 它的参数是自动向左补齐的
     */
    alertCfg: {
        offset: '100px',
        title: false,  // 没有标题
        closeBtn: 0, // 没有关闭按钮
    },

    /**
     * 提示内容
     * @param msg           提示内容 (必填)
     * @param yesFunCall (index)    确认回调函数(弹出层id)，该函数内部必须使用layer.close(index);
     */
    alert: function (msg, yesFunCall) {
        if (!msg || !$.trim(msg)) {
            msg = myLayer.msgDef;
        }
        var call = null;
        if ($.isFunction(yesFunCall)) {
            call = yesFunCall;
        }
        layer.alert(
            msg,
            $.extend(myLayer.alertCfg, {icon: 6}),
            call
        );
    },

    // ------------------------confirm(询问)框------------------------
    // layer.confirm(content, options, yes, cancel) - 询问框
    /**
     * 询问内容
     * @param msg           提示内容 (必填)
     * @param yesFunCall (index)    确认回调函数(弹出层id)，该函数内部必须使用layer.close(index);
     * @param noFunCall (index)    错误回调函数(弹出层id)，该函数内部必须使用layer.close(index);
     */
    confirm: function (msg, yesFunCall, noFunCall) {
        if (!msg || !$.trim(msg)) {
            msg = myLayer.msgDef;
        }
        var callYes = null;
        if ($.isFunction(yesFunCall)) {
            callYes = yesFunCall;
        }
        var callNo = null;
        if ($.isFunction(noFunCall)) {
            callNo = noFunCall;
        }
        layer.confirm(
            msg,
            $.extend(myLayer.alertCfg, {icon: 3}),
            callYes,
            callNo
        );
    },

    // ------------------------iFrame框------------------------
    /**
     * 打开iFrame弹窗
     * @param url   没有opt时，打开的url链接
     * @param opt   如果存在opt会覆盖默认参数，包括url
     */
    iFrame : function (url,opt) {
        var dfo = {
            title : false,
            type: 2, // html代码1, url ：2
            skin: 'layui-layer-rim', //加上边框
            area: ['60%', '60%'], //宽高
            content: url,
            btn: ['确定', '取消'],
            yes: function(index, layero){
                //按钮【按钮一】的回调
                var iWindow = layero.find("iframe")[0].contentWindow;
                var ir = iWindow.document;
                // var table = $(ir).find("#specValuePopTable");
                // 获取异常，只能获取到dom
                // var selects = $(table).bootstrapTable('getSelections');
                // 调用iframe中的方法，获取数据
                // var selects = iWindow.getSelections();
                // var specNameId = $(ir).find("#specNameId").val();
                // specValuePopSure(selects,specNameId);
                layer.close(index);
            }
        };
        layer.open($.extend(dfo,opt));
    }
};
