//= require store/spree_core
$(document).ready(function() {
	$('body#login #has_account_false, body#login #has_account_true').change(function() {
		$('body#login #password_field').toggle();
	});
});