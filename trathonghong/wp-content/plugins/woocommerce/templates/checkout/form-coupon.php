<?php
/**
 * Checkout coupon form
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     1.6.4
 */

if ( get_option( 'woocommerce_enable_coupons' ) == 'no' || get_option( 'woocommerce_enable_coupon_form_on_checkout' ) == 'no' ) return;

$info_message = apply_filters('woocommerce_checkout_coupon_message', __('Bạn có phiếu giảm giá?', 'woocommerce'));
?>

<p class="woocommerce_info"><?php echo $info_message; ?> <a href="#" class="showcoupon"><?php _e('Nhấp vào đây để nhập mã phiếu giảm giá', 'woocommerce'); ?></a></p>

<form class="checkout_coupon" method="post">

	<p class="form-row form-row-first">
		<input type="text" name="coupon_code" class="input-text" placeholder="<?php _e('Mã phiếu giảm giá', 'woocommerce'); ?>" id="coupon_code" value="" />
	</p>

	<p class="form-row form-row-last">
		<input type="submit" class="button" name="apply_coupon" value="<?php _e('Chấp nhận', 'woocommerce'); ?>" />
	</p>

	<div class="clear"></div>
</form>