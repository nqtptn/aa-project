<?php
/**
 * Sorting
 *
 * @author 		WooThemes
 * @package 	WooCommerce/Templates
 * @version     1.6.4
 */

?>
<form class="woocommerce_ordering" method="POST">
	<select name="sort" class="orderby">
		<?php
			$catalog_orderby = apply_filters('woocommerce_catalog_orderby', array(
				'menu_order' 	=> __('Sắp xếp mặc định', 'woocommerce'),
				'title' 		=> __('Theo tên sản phẩm', 'woocommerce'),
				'date' 			=> __('Theo ngày đăng', 'woocommerce'),
				'price' 		=> __('Theo giá', 'woocommerce')
			));

			foreach ( $catalog_orderby as $id => $name )
				echo '<option value="' . $id . '" ' . selected( $_SESSION['orderby'], $id, false ) . '>' . $name . '</option>';
		?>
	</select>
</form>