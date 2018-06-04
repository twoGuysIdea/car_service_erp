/*
 * 自定义封装bootstrap table扩展
 */
$.fn.extend({
    /**
     * 自定义的bootstrap 配置参数对象，只需要写不同默认配置的参数就可以了
     * @param configObj
     * @constructor
     */
    BootTableInit: function (configObj) {
        $(this).bootstrapTable(BootTableInitCfg(configObj));
    },
    /**
     * 刷新操作
     * @param params
     * @constructor
     */
    BootTableRefresh: function () {
        $(this).bootstrapTable("refresh");
    },
    /**
     * 覆盖原有数据
     * @constructor
     */
    BootTableLoad : function (rows) {
        $(this).bootstrapTable("load",rows);
    },
    /**
     * 查询并刷新table
     * @param params{JSON}对象  查询参数，可以没有
     * @constructor
     */
    BootTableSelectRefresh: function (params) {
        var opt = {
            // url: "http://local/api/data/?format=json", //可以修改刷新url
            // silent: true,        //静默刷新数据
            // query:{
            //     type:1,
            //     level:2
            // }
        };
        if (!$.isEmptyObject(params)) {
            opt = params;
            $(this).bootstrapTable("refresh", opt);
        } else {
            $(this).bootstrapTable("refresh");
        }
    }
});


function BootTableInitCfg(bootstrapTableConfigObj) {
    var defCfg = {
        //因为bootstap table使用的是ajax方式获取数据，这时会将请求的content type默认设置为 text/plain
        //在服务端直接通过 @RequestParam参数映射是获取不到的。
        contentType: "application/x-www-form-urlencoded",
        // url: 'purPlanned',  //服务器数据的加载地址
        method: 'post',   //服务器数据的请求方式 'get' or 'post'
        cache: false,  //设置为 false 禁用 AJAX 数据缓存
        pagination: true,  //	设置为 true 会在表格底部显示分页条
        sortName: 'id', //定义排序列,通过url方式获取数据填写字段名，否则填写下标
        sortOrder: 'desc', //定义排序方式 'asc' 或者 'desc'
        sidePagination: 'server',  //设置在哪里进行分页，可选值为 'client' 或者 'server'
        // sidePagination: 'client',
        pageNumber: 1,  //如果设置了分页，首页页码
        pageSize: 10,  //如果设置了分页，页面数据条数
        pageList: [5, 10, 50, 100], //如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
        strictSearch: false,	//设置为 true启用 全匹配搜索，否则为模糊搜索
        clickToSelect: false, //设置true 将在点击行时，自动选择rediobox 和 checkbox
        singleSelect: false,	//设置True 将禁止多选
        showToggle: false,	//是否显示 切换试图（table/card）按钮
        height: "auto", // 若需要固定表格高度请传入
        uniqueId: 'Id',
        cardView: false,  //设置为 true将显示card视图，适用于移动设备。否则为table试图，适用于pc
        detailView: false, //设置为 true 可以显示详细页面模式。
        striped: true, // 设置为 true 会有隔行变色效果
        search: false, //是否显示搜索框
        showRefresh: true,//是否显示 刷新按钮
        showPaginationSwitch: false,//是否显示 数据条数选择框
        searchAlign: 'right',//指定 搜索框 水平方向的位置。'left' or 'right'
        buttonsAlign: 'right', //指定 按钮 水平方向的位置。'left' or 'right'
        paginationVAlign: 'bottom',
        paginationPreText: '上一页',//指定分页条中上一页按钮的图标或文字
        paginationNextText: '下一页',//指定分页条中下一页按钮的图标或文字
        showColumns: true,
        // 默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
        // 设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber
        queryParamsType: ''
        // queryParams:queryParams,
        // columns: [{
        //     field: 'id',
        //     title: '操作',
        //     events: operateEvents1,
        //     formatter: operateFormatter
        // }]
    };

    var initCfg = $.extend(defCfg, bootstrapTableConfigObj);
    return initCfg;
}



// ----------------- BootstrapTableFunc 暂时还未使用 -----------------
var BootstrapTableFunc = {};
/**
 * 跳转到添加表单
 * @param selector   bootstrap table 的选择器
 * @param url       表单访问地址
 * @param tapsIndex  选项卡索引
 * @param tapsName   选项卡名字
 * @param data      携带参数
 * @param selectorSearch      bootstrap table 搜索表单选择器
 **/
BootstrapTableFunc.toAddForm = function (selector,url, tapsIndex, tapsName, data,selectorSearch) {
    if (!url) {
        throw "url is empty";
    }
    if (!data) {
        data = {};
    }
    myLayer.iFrame(url);
};
/**
 * 跳转编辑表单,自动获取表单id
 * @param selector   bootstrap table 的选择器
 * @param url        表单访问地址
 * @param tapsIndex  选项卡索引
 * @param tapsName   选项卡名字
 * @param data       传入参数
 * @param selectorSearch      bootstrap table 搜索表单选择器
 **/
BootstrapTableFunc.toEditForm = function (selector, url, tapsIndex, tapsName, data, selectorSearch) {
    if (!selector || !url) {
        throw "selector or url is empty";
    }
    var arr = $(selector).bootstrapTable("getSelections");
    if ( 1 === arr.length) {

        if (!data) {
            data = {};
        }

        var o = arr[0];
        if (o.hasOwnProperty("id")) {
            data.id = o.id;
            url += "?id=" + o.id
        } else {
            console.error("key -> id not exist");
        }
        myLayer.iFrame(url);
    } else {
        myLayer.msgErrorDef("请选中一条数据");
    }
};
/**
 * 批量更新行数据
 * @param selector  bootstrap table 的选择器
 * @param url       表单访问地址
 * @param status    状态值
 * @param selectorSearch      bootstrap table 搜索表单选择器
 **/
BootstrapTableFunc.updateRows = function (selector, url,status, selectorSearch) {
    var data;
    if (selector && url) {
        if (!data) {
            data = {};
        }

        var arr = $(selector).bootstrapTable("getSelections");
        var tArr = [];
        for (var i = 0, l = arr.length; i < l; i++) {
            var o = arr[i];
            if (o.hasOwnProperty("id")) {
                tArr.push(o.id);
            } else {
                console.error("key -> id not exist");
            }
        }
        if (tArr.length <= 0){
            myLayer.msgErrorDef("请选择勾选一条数据！");
            return;
        }
        data.ids = tArr.join(",");
        data.status = status;
        ajaxWarp({
            url: url,
            data: data,
            success: function (result) {
                if (result.status) {
                    myLayer.msgErrorDef(result.info);
                } else {
                    alert(result.info);
                }
                $(selector).BootTableRefresh();
            }
        });
    } else {
        throw "selector or url is empty";
    }
};