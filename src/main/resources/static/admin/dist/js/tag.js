$(function () {
    $("#jqGrid").jqGrid({
        url: '/admin/tags/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'tagId', index: 'tagId', width: 50, key: true, hidden: true},
            {label: '標籤名稱', name: 'tagName', index: 'tagName', width: 240},
            {label: '添加時間', name: 'createTime', index: 'createTime', width: 120}
        ],
        height: 560,
        rowNum: 10,
        rowList: [10, 20, 50],
        styleUI: 'Bootstrap',
        loadtext: '信息讀取中...',
        rownumbers: false,
        rownumWidth: 20,
        autowidth: true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader: {
            root: "data.list",
            page: "data.currPage",
            total: "data.totalPage",
            records: "data.totalCount"
        },
        prmNames: {
            page: "page",
            rows: "limit",
            order: "order",
        },
        gridComplete: function () {
            //隱藏grid底部滾動條
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({"overflow-x": "hidden"});
        }
    });
    $(window).resize(function () {
        $("#jqGrid").setGridWidth($(".card-body").width());
    });
});

/**
 * jqGrid重新加載
 */
function reload() {
    var page = $("#jqGrid").jqGrid('getGridParam', 'page');
    $("#jqGrid").jqGrid('setGridParam', {
        page: page
    }).trigger("reloadGrid");
}

function tagAdd() {
    var tagName = $("#tagName").val();
    if (!validCN_ENString2_18(tagName)) {
        swal("標籤名稱不規範", {
            icon: "error",
        });
    } else {
        var url = '/admin/tags/save?tagName=' + tagName;
        $.ajax({
            type: 'POST',//方法類型
            url: url,
            success: function (result) {
                if (result.resultCode == 200) {
                    $("#tagName").val('')
                    swal("保存成功", {
                        icon: "success",
                    });
                    reload();
                }
                else {
                    $("#tagName").val('')
                    swal(result.message, {
                        icon: "error",
                    });
                }
                ;
            },
            error: function () {
                swal("操作失敗", {
                    icon: "error",
                });
            }
        });
    }
}

function deleteTag() {
    var ids = getSelectedRows();
    if (ids == null) {
        return;
    }
    swal({
        title: "確認彈框",
        text: "確認要刪除數據嗎?",
        icon: "warning",
        buttons: true,
        dangerMode: true,
    }).then((flag) => {
            if (flag) {
                $.ajax({
                    type: "POST",
                    url: "/admin/tags/delete",
                    contentType: "application/json",
                    data: JSON.stringify(ids),
                    success: function (r) {
                        if (r.resultCode == 200) {
                            swal("刪除成功", {
                                icon: "success",
                            });
                            $("#jqGrid").trigger("reloadGrid");
                        } else {
                            swal(r.message, {
                                icon: "error",
                            });
                        }
                    }
                });
            }
        }
    );
}
