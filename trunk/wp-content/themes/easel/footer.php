		<?php get_template_part('layout', 'foot'); ?>
		<div id="footer">
			<div id="footer-menubar-wrapper">
				<div class="footmenu">
					<ul id="menu-menu-1" class="menu">
						<li></li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<?php do_action('easel-footer'); ?>
			<?php easel_get_sidebar('footer'); ?>
			<?php if (!easel_themeinfo('disable_footer_text')) easel_footer_text(); ?>
			<div class="clear"></div>
		</div>
	</div> <!-- // #page -->
</div> <!-- / #page-wrap -->
<div id="page-foot"><?php do_action('easel-page-foot'); ?></div>

<?php wp_footer(); ?>
<br />
<div class='copy-right'>
Copyright © 2012 Công Ty Cổ Phần TM - DV Tiếp Vận Toàn Cầu A&amp;A. All rights reserved
</div>
<br /><br />
</body>
</html>