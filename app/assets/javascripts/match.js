var ready;
ready = function() {
$('input[type="checkbox"]').on('change', function() {
	    $('input[name="' + this.name + '"]').not(this).prop('checked', false);
	});
};
$(document).ready(ready);
