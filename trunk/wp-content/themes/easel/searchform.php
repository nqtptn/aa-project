<form method="get" class="searchform" action="<?php echo home_url(); ?>">
	<input type="text" value="<?php _e('Tìm kiếm...','easel'); ?>" name="s" class="s-search" onfocus="this.value=(this.value=='<?php _e('Tìm kiếm...','easel'); ?>') ? '' : this.value;" onblur="this.value=(this.value=='') ? '<?php _e('Tìm kiếm...','easel'); ?>' : this.value;" />
	<button type="submit">&raquo;</button>
</form>
<div class="clear"></div>