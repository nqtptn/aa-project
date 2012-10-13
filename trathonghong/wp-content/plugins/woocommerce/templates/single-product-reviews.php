<?php
/**
 * Display single product reviews (comments)
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     1.6.4
 */
global $woocommerce;
?>
<?php if ( comments_open() ) : ?><div id="reviews"><?php

	echo '<div id="comments">';

	$count = $wpdb->get_var("
		SELECT COUNT(meta_value) FROM $wpdb->commentmeta
		LEFT JOIN $wpdb->comments ON $wpdb->commentmeta.comment_id = $wpdb->comments.comment_ID
		WHERE meta_key = 'rating'
		AND comment_post_ID = $post->ID
		AND comment_approved = '1'
		AND meta_value > 0
	");

	$rating = $wpdb->get_var("
		SELECT SUM(meta_value) FROM $wpdb->commentmeta
		LEFT JOIN $wpdb->comments ON $wpdb->commentmeta.comment_id = $wpdb->comments.comment_ID
		WHERE meta_key = 'rating'
		AND comment_post_ID = $post->ID
		AND comment_approved = '1'
	");

	if ( $count > 0 ) :

		$average = number_format($rating / $count, 2);

		echo '<div itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating">';

		echo '<div class="star-rating" title="'.sprintf(__('Đánh giá %s / 5', 'woocommerce'), $average).'"><span style="width:'.($average*16).'px"><span itemprop="ratingValue" class="rating">'.$average.'</span> '.__('out of 5', 'woocommerce').'</span></div>';

		echo '<h2>'.sprintf( _n('%s đánh giá cho %s', '%s đánh giá cho %s', $count, 'woocommerce'), '<span itemprop="ratingCount" class="count">'.$count.'</span>', wptexturize($post->post_title) ).'</h2>';

		echo '</div>';

	else :

		echo '<h2>'.__('Đánh giá', 'woocommerce').'</h2>';

	endif;

	$title_reply = '';

	if ( have_comments() ) :

		echo '<ol class="commentlist">';

		wp_list_comments( array( 'callback' => 'woocommerce_comments' ) );

		echo '</ol>';

		if ( get_comment_pages_count() > 1 && get_option( 'page_comments' ) ) : ?>
			<div class="navigation">
				<div class="nav-previous"><?php previous_comments_link( __( '<span class="meta-nav">&larr;</span> Trang trước', 'woocommerce' ) ); ?></div>
				<div class="nav-next"><?php next_comments_link( __( 'Trang sau <span class="meta-nav">&rarr;</span>', 'woocommerce' ) ); ?></div>
			</div>
		<?php endif;

		echo '<p class="add_review"><a href="#review_form" class="inline show_review_form button">'.__('Thực hiện đánh giá', 'woocommerce').'</a></p>';

		$title_reply = __('Thực hiện đánh giá', 'woocommerce');

	else :

		$title_reply = __('Thực hiện đánh giá', 'woocommerce').' &ldquo;'.$post->post_title.'&rdquo;';

		echo '<p>'.__('Chưa có đánh giá cho sản phẩm này, xin mời bạn thực hiện <a href="#review_form" class="inline show_review_form">đánh giá sản phẩm</a>?', 'woocommerce').'</p>';

	endif;

	$commenter = wp_get_current_commenter();

	echo '</div><div id="review_form_wrapper"><div id="review_form">';

	$comment_form = array(
		'title_reply' => $title_reply,
		'comment_notes_before' => '',
		'comment_notes_after' => '',
		'fields' => array(
			'author' => '<p class="comment-form-author">' . '<label for="author">' . __( 'Name', 'woocommerce' ) . '</label> ' . '<span class="required">*</span>' .
			            '<input id="author" name="author" type="text" value="' . esc_attr( $commenter['comment_author'] ) . '" size="30" aria-required="true" /></p>',
			'email'  => '<p class="comment-form-email"><label for="email">' . __( 'Email', 'woocommerce' ) . '</label> ' . '<span class="required">*</span>' .
			            '<input id="email" name="email" type="text" value="' . esc_attr(  $commenter['comment_author_email'] ) . '" size="30" aria-required="true" /></p>',
		),
		'label_submit' => __('Hoàn tất', 'woocommerce'),
		'logged_in_as' => '',
		'comment_field' => ''
	);

	if ( get_option('woocommerce_enable_review_rating') == 'yes' ) {

		$comment_form['comment_field'] = '<p class="comment-form-rating"><label for="rating">' . __('Rating', 'woocommerce') .'</label><select name="rating" id="rating">
			<option value="">'.__('Rate&hellip;', 'woocommerce').'</option>
			<option value="5">'.__('Tuyệt vời', 'woocommerce').'</option>
			<option value="4">'.__('Tốt', 'woocommerce').'</option>
			<option value="3">'.__('Khá tốt', 'woocommerce').'</option>
			<option value="2">'.__('Chấp nhận được', 'woocommerce').'</option>
			<option value="1">'.__('Không tốt', 'woocommerce').'</option>
		</select></p>';

	}

	$comment_form['comment_field'] .= '<p class="comment-form-comment"><label for="comment">' . __( 'Nội dung', 'woocommerce' ) . '</label><textarea id="comment" name="comment" cols="45" rows="8" aria-required="true"></textarea></p>' . $woocommerce->nonce_field('comment_rating', true, false);

	comment_form( $comment_form );

	echo '</div></div>';

?><div class="clear"></div></div>
<?php endif; ?>