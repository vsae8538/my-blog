$(function () {
    $("#jqGrid").jqGrid({
        url: '/admin/links/list',
        datatype: "json",
        colModel: [
            {label: 'id', name: 'linkId', index: 'linkId', width: 50, key: true, hidden: true},
            {label: '網站名稱', name: 'linkName', index: 'linkName', width: 100},
            {label: '網站鏈接', name: 'linkUrl', index: 'linkUrl', width: 120},
            {label: '網站描述', name: 'linkDescription', index: 'linkDescription', width: 120},
            {label: '排序值', name: 'linkRank', index: 'linkRank', width: 30},
            {label: '添加時間', name: 'createTime', index: 'createTime', width: 100}
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

function linkAdd() {
    reset();
    $('.modal-title').html('友鏈添加');
    $('#linkModal').modal('show');
}

//綁定modal上的保存按鈕
$('#saveButton').click(function () {
    var linkId = $("#linkId").val();
    var linkName = $("#linkName").val();
    var linkUrl = $("#linkUrl").val();
    var linkDescription = $("#linkDescription").val();
    var linkRank = $("#linkRank").val();
    if (!validCN_ENString2_18(linkName)) {
        $('#edit-error-msg').css("display", "block");
        $('#edit-error-msg').html("請輸入符合規範的名稱！");
        return;
    }
    if (!isURL(linkUrl)) {
        $('#edit-error-msg').css("display", "block");
        $('#edit-error-msg').html("請輸入符合規範的網址！");
        return;
    }
    if (!validCN_ENString2_100(linkDescription)) {
        $('#edit-error-msg').css("display", "block");
        $('#edit-error-msg').html("請輸入符合規範的描述！");
        return;
    }
    if (isNull(linkRank) || linkRank < 0) {
        $('#edit-error-msg').css("display", "block");
        $('#edit-error-msg').html("請輸入符合規範的排序值！");
        return;
    }
    var params = $("#linkForm").serialize();
    var url = '/admin/links/save';
    if (linkId != null && linkId > 0) {
        url = '/admin/links/update';
    }
    $.ajax({
        type: 'POST',//方法類型
        url: url,
        data: params,
        success: function (result) {
            if (result.resultCode == 200 && result.data) {
                $('#linkModal').modal('hide');
                swal("保存成功", {
                    icon: "success",
                });
                reload();
            }
            else {
                $('#linkModal').modal('hide');
                swal("保存失敗", {
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

});

function linkEdit() {
    var id = getSelectedRow();
    if (id == null) {
        return;
    }
    reset();
    //請求數據
    $.get("/admin/links/info/" + id, function (r) {
        if (r.resultCode == 200 && r.data != null) {
            //填充數據至modal
            $("#linkName").val(r.data.linkName);
            $("#linkUrl").val(r.data.linkUrl);
            $("#linkDescription").val(r.data.linkDescription);
            $("#linkRank").val(r.data.linkRank);
            //根據原linkType值設置select選擇器為選中狀態
            if (r.data.linkType == 1) {
                $("#linkType option:eq(1)").prop("selected", 'selected');
            }
            if (r.data.linkType == 2) {
                $("#linkType option:eq(2)").prop("selected", 'selected');
            }
        }
    });
    $('.modal-title').html('友鏈修改');
    $('#linkModal').modal('show');
    $("#linkId").val(id);
}

function deleteLink() {
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
                    url: "/admin/links/delete",
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

function reset() {
    $("#linkName").val('');
    $("#linkUrl").val('');
    $("#linkDescription").val('');
    $("#linkRank").val(0);
    $('#edit-error-msg').css("display", "none");
    $("#linkType option:first").prop("selected", 'selected');
}