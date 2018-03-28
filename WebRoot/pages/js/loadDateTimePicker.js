(function($) {
	$.init();
	var result = $('#datetime')[0];
	var btns = $('#datetime');
	btns.each(function(i, btn) {
		btn.addEventListener('tap', function() {
			var _self = this;
			if(_self.picker) {
				_self.picker.show(function (rs) {
					result.innerText = rs.text;
					_self.picker.dispose();
					_self.picker = null;
				});
			} else {
				var optionsJson = this.getAttribute('data-options') || '{}';
				var options = JSON.parse(optionsJson);
				var id = this.getAttribute('id');
				_self.picker = new $.DtPicker(options);
				_self.picker.show(function(rs) {
					result.innerText = rs.text;
					_self.picker.dispose();
					_self.picker = null;
				});
			}
			
		}, false);
	});
})(mui);