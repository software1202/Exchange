(function(){
	var index = 0;
	$(document).ready(function() {
		$('#main div').hide().eq(0).show();
		$('#prv').click(function() {
			if (--index >= 0) {
				$('#main div').hide(0).eq(index).show(0);
			} else {
				alert("���ǵ�һҳ");
			}
		});
		$('#next').click(function() {
			alert("�������һҳ");
			if (++index < 5) {
				$('#main div').hide(0).eq(index).show(0);
			} else {
				alert("�������һҳ");
			}
		});
	});
})(jQuery);