<?php 
get_header();

$count = 'No';
if (have_posts()) :
	$count = $wp_query->found_posts;
?>
	<h2 class="page-title"><?php _e('Kết quả tìm kiếm cho &lsquo;','easel'); the_search_query(); _e('&rsquo;','easel'); ?></h2>
	<div class="searchresults"><?php printf(_n("%d kết quả.", "%d kết quả.", $count,'easel'),$count); ?></div>
	<div class="clear"></div>
<?php 
	if (easel_themeinfo('display_archive_as_links')) { ?>
	<div <?php post_class(); ?>>
		<div class="post-head"></div>
		<div class="entry">
		<table class="archive-table">
			<?php while (have_posts()) : the_post(); ?>
			<tr><td class="archive-date"><?php the_time('M d, Y') ?></td><td class="archive-title"><a href="<?php echo get_permalink($post->ID) ?>" rel="bookmark" title="<?php _e('Permanent Link:','easel'); ?> <?php the_title() ?>"><?php the_title() ?></a></td></tr>
			<?php endwhile; ?>
		</table>
		</div>
		<div class="post-foot"></div>
	</div>
	<?php } else {
		while (have_posts()) : the_post();
			easel_display_post();
		endwhile;
	} ?>
	<div class="clear"></div>
	<?php easel_pagination();
	else : ?>
		<div class="post post-search type-page">
			<div class="post-head"></div>
			<div class="post-content">
				<div class="entry">
					<h3><?php _e('Không tìm thấy kết quả tìm kiếm.','easel'); ?></h3>
					<p><?php _e('Bạn có muốn tìm thông tin khác?','easel'); ?></p>
					<p><?php get_search_form(); ?></p>
				</div>
			</div>
			<div class="post-foot"></div>
		</div>
<?php
	endif;
	
get_footer();
?>