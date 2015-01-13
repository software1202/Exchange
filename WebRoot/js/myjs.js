(function(){
	var index = 0;
	$(document).ready(function() {
		$('#main div').hide().eq(0).show();
		$('#prv').click(function() {
			if (--index >= 0) {
				$('#main div').hide(0).eq(index).show(0);
			} else {
				alert("已是第一页");
			}
		});
		$('#next').click(function() {
			alert("已是最后一页");
			if (++index < 5) {
				$('#main div').hide(0).eq(index).show(0);
			} else {
				alert("已是最后一页");
			}
		});
	});
})(jQuery);