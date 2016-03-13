$(document).ready(function () {
	$(":checkbox:first").click(function () {
		var checked = $(this).prop("checked");
		$(":checkbox").prop("checked", checked);
	});

	$("#selectAllButton").click(function () {
		var checked = $(this).prop("checked");
		$(":checkbox").prop("checked", checked);
	});
	//$("#selectAllButton").click(function () {
	//    $(":checkbox").prop("checked", true);
	//});

	$("tbody :checkbox").click(function () {
		var isAllSelected = $(":checkbox:first").prop("checked");
		var selected = $(this).prop("checked");
		if (!selected && isAllSelected) {
			$(":checkbox:first").prop("checked", false);
		} else {
			isAllSelected = true;
			$("tbody :checkbox").each(function () {
				if (!$(this).prop("checked")) {
					isAllSelected = false;
					return false;
				}
			});
			$(":checkbox:first").prop("checked", isAllSelected);
		}
	});

});




$("#deleteButton").click(function (e) {

	var list = $("input[type='checkbox']:checked");

	if (list.length == 0) {
		alert("请至少选择一项");
		return ;
	}

	var ids = "(" ;
	$.each(list,function(){
		ids += $(this).val()+",";
	});
	ids = ids.substring(0, ids.length - 1);
	ids += ")";

	window.location.href = "delete/"+ids; 


});


