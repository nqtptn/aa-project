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
//	$count = $wp_query->post_count;
$post = $posts[0]; // Hack. Set $post so that the_date() works
$post_title_type = $title_string = '';
if ($post->post_type !== 'post') $post_title_type = $post->post_type.'-'; // extra space at the end for visual
if (is_category()) { /* Category */
	$title_string = __('Archive for ','easel').$post_title_type.single_cat_title('',false);
} elseif(is_tag()) { /* Tag */
	$title_string = __('Posts Tagged ','easel').$post_title_type.single_tag_title('',false);
} elseif (is_day()) {
	$title_string = __('Archive for ','easel').$post_title_type.get_the_time('F jS, Y');
} elseif (is_month()) {
	$title_string = __('Archive for ','easel').$post_title_type.get_the_time('F, Y');
} elseif (is_year()) {
	$title_string = __('Archive for ','easel').$post_title_type.get_the_time('Y');
} elseif (is_author()) {
	$title_string = __('Author Archive ','easel').$post_title_type.get_the_time('Y');
} elseif (isset($_GET['paged']) && !empty($_GET['paged'])) {
	$title_string = __('Archives','easel');
} elseif (isset($wp_query->query_vars['taxonomy']) && taxonomy_exists($wp_query->query_vars['taxonomy'])) {
	if (term_exists($wp_query->query_vars['term'])) {
		$title_string = __('Archive for ','easel').$wp_query->query_vars['term'];
	} else {
		$title_string = __('Archive for ','easel').$wp_query->query_vars['taxonomy'];
	}
} elseif ($post->post_type !== 'post') {
	$title_string = __('Archive for ','easel').$post->post_type;
} else {
	$title_string = __('Archive is unable to be found.','easel');
}
if (have_posts()) { ?>
	<h2 class="page-title"><?php echo $title_string; ?></h2>
	<div class="archiveresults"><?php printf(_n("%d result.", "%d results.", $count,'easel'),$count); ?></div>
	<div class="clear"></div>
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
	
<?php } else { ?>
	<h2 class="page-title"><?php echo $title_string; ?></h2>
	<div class="archiveresults"><?php printf(_n("%d result.", "%d results.", $count,'easel'),$count); ?></div>
	<div class="clear"></div>
<?php } ?>

<?php get_footer(); ?>