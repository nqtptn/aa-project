<?php
get_header();

// set to empty
$count = $theCatID = '';
if (is_category()) {
	$theCatID = get_term_by( 'slug', $wp_query->query_vars['category_name'], 'category' );
	if (!empty($theCatID))
		$theCatID = $theCatID->term_id;
	if (isset($wp_query->query_vars['cat'])) $theCatID = (int)$wp_query->query_vars['cat'];	
}

$count = 'No';
$count = $wp_query->found_posts;
$post = $posts[0]; // Hack. Set $post so that the_date() works
$post_title_type = $title_string = '';

if (have_posts()) { ?>
	<?php 
	if (easel_themeinfo('display_archive_as_links') || easel_is_bbpress()) { ?>
	<div <?php post_class(); ?>>
		<div class="post-head"></div>
		<div class="entry">
		<table class="archive-table">
			<?php while (have_posts()) : the_post(); ?>
			<tr><td class="archive-date"><span class="archive-date-month-day"><?php the_time('M d, ') ?></span><span class="archive-date-year"><?php the_time('Y'); ?></span></td><td class="archive-title"><a href="<?php echo get_permalink($post->ID) ?>" rel="bookmark" title="<?php _e('Permanent Link:','easel'); ?> <?php the_title() ?>"><?php the_title() ?></a></td></tr>
			<?php endwhile; ?>
		</table>
		</div>
		<div class="post-foot"></div>
	</div>
	<?php } else {
		while (have_posts()) : the_post();
			easel_display_post();
		endwhile;
	}
	?>
	<div class="clear"></div>
	<?php easel_pagination(); ?>
	
<?php }?>

<?php get_footer(); ?>