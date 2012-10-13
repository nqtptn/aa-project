<?php
/**
 * Checkout login form
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     1.6.4
 */

if ( is_user_logged_in() ) return;
if ( get_option('woocommerce_enable_signup_and_login_from_checkout') == "no" ) return;

$info_message = apply_filters('woocommerce_checkout_login_message', __('Bạn đã có tài khoản đăng nhập?', 'woocommerce'));
?>

<p class="woocommerce_info"><?php echo $info_message; ?> <a href="#" class="showlogin"><?php _e('Nhập vào đây để đăng nhập', 'woocommerce'); ?></a></p>

<?php woocommerce_login_form( array( 'message' => __('Nếu bạn đã từng mua hàng trên website của chúng tôi, vui lòng đăng nhập. Nếu bạn là khách hàng mới vui lòng nhập thông tin địa chỉ để chúng tôi liên hệ và giao sản phẩm cho bạn.', 'woocommerce'), 'redirect' => get_permalink(woocommerce_get_page_id('checkout')) ) ); ?>