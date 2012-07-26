<?php
/*
Plugin Name: link-list-manager
Plugin URI: http://www.zetrider.ru
Description: Планин для составления листов ссылок, партнеров, баннеров
Version: 1.0
Author: ZetRider
Author URI: http://www.zetrider.ru
Author Email: ZetRider@bk.ru
*/
/*  Copyright 2011  zetrider  (email: zetrider@bk.ru)

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/

load_plugin_textdomain('link-list-manager', PLUGINDIR.'/'.dirname(plugin_basename(__FILE__)). '/lang/');

global $wpdb;
$db_llm = $wpdb->prefix.'llm';
$llm_url = WP_PLUGIN_URL.'/'.str_replace(basename( __FILE__),"",plugin_basename(__FILE__));

function llm_style() {
	global $llm_url;
	echo '<link rel="stylesheet" href="'.$llm_url.'style.css" type="text/css" />'."\n";
}
add_action('admin_head', 'llm_style');

$sql = sprintf("
CREATE TABLE IF NOT EXISTS $db_llm (
	id INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY(id),
	category INT,
	name VARCHAR(255),
	alt VARCHAR(255),
	link VARCHAR(255),
	target VARCHAR(255),
	images VARCHAR(255),
	imagestype VARCHAR(255),
	imagesfloat VARCHAR(255),
	orderby INT
) ENGINE=MyISAM CHARACTER SET=utf8;
");
$result = $wpdb->query($sql);

function llm_menu(){
	add_options_page('Link List Manager', 'LL Manager', 8, basename(__FILE__), 'llm_setting');
}
add_action('admin_menu', 'llm_menu');

$get_category = $_GET['category'];

$wpuploadsdir = wp_upload_dir();

$patch_folder = $wpuploadsdir['basedir']."/llm";
$url_folder = $wpuploadsdir['baseurl']."/llm";

function llm_setting() {
	global $wpdb, $db_llm, $get_category, $patch_folder, $url_folder, $llm_url;

	$res_max_id = $wpdb->get_results("SELECT category FROM $db_llm ORDER BY 'orderby' DESC LIMIT 1");
	if (empty($res_max_id)) {
		$max_id = "1";
	}
	foreach ($res_max_id as $row_max_id) {
		$max_id = $row_max_id->category + 1;
	}
?>

		<h2>Link List Manager</h2>
		
<div style="float:left;">
	<br class="clear">
	<a href="admin.php?page=llm.php&category=<?php echo $max_id; ?>" class="ablock llmradius"><?php _e("Add a new category +","link-list-manager"); ?></a>
<?php
$res_id_list = $wpdb->get_results("SELECT category FROM $db_llm GROUP BY category ORDER BY category");
foreach ($res_id_list as $row_id_list) {
	if ($row_id_list->category){
		echo '<a href="admin.php?page=llm.php&category='.$row_id_list->category.'"  class="ablock llmradius" style="margin-right:5px;">id='.$row_id_list->category.'</a>';
	}
}

if($_POST['addllm'] || $_POST['update']) {

if (!is_dir($patch_folder)) {
	mkdir ($patch_folder, 0700);
}

$category = $_GET['category'];
$name = $_POST['name'];
$alt = $_POST['alt'];
$link = $_POST['link'];
$target = $_POST['target'];
$images = $_FILES["images"]['tmp_name'];
$imagesfloat = $_POST["imagesfloat"];
$resize = $_POST['resize'];
$orderby = $_POST['orderby'];

if ($_FILES["images"]['type'] == 'image/gif') { $imagestype = '.gif'; }
elseif ($_FILES["images"]['type'] == 'image/jpeg') { $imagestype = '.jpg'; }
elseif ($_FILES["images"]['type'] == 'image/png') { $imagestype = '.png'; }
elseif ($_FILES["images"]['type'] == 'image/bmp') { $imagestype = '.bmp'; }
else { $imagestype = 'false'; }

if($_POST['update']) {
	$images_id = $_GET['id'];
	if ($_POST["imagestype"]) { $imagestype = $_POST['imagestype']; }
}
else {
	$nextidtable = $wpdb->get_results("SHOW TABLE STATUS LIKE '$db_llm'"); /* next id Auto_increment*/
	foreach ($nextidtable as $nextidtableAuto_increment) { $images_id = $nextidtableAuto_increment->Auto_increment; }
}

$imagepatchlist = $patch_folder."/".$images_id.$imagestype;

if ($imagestype != 'false') { // upload images
	if(!file_exists($imagepatchlist) && !is_file($imagepatchlist)) {
		move_uploaded_file($images, $imagepatchlist);
		$patch_images = $patch_folder."/".$images_id.$imagestype;
		$trueresult .= __("Images uploaded","link-list-manager")."<br>"; 
		$uploadresult = "ok";
	}
}

if ($resize && file_exists($imagepatchlist) && is_file($imagepatchlist)) { // resize images
	$llms_size = GetImageSize ($imagepatchlist);
	$src = ImageCreateFromJPEG ($imagepatchlist); 
	$iw = $llms_size[0]; 
	$ih = $llms_size[1]; 
	$koe=$iw/$resize;
	$new_h=ceil ($ih/$koe); 
	$dst = ImageCreateTrueColor ($resize, $new_h);
	ImageCopyResampled ($dst, $src, 0, 0, 0, 0, $resize, $new_h, $iw, $ih); 
	ImageJPEG ($dst, $imagepatchlist, 100);
	imagedestroy($src);
	$trueresult .= __("File successfully scaled down to fit the width of the","link-list-manager")." $resize px. <br>";
	$trueresult .= "<small>".__("If the image has not changed in size, so it is cached by your browser. Please refresh the page.", "link-list-manager")."</small><br>";
}

if($_POST['update'] && $falseresult == '') { // update row
	$res = $wpdb->query("UPDATE $db_llm SET category = '$category', name = '$name', alt = '$alt', link = '$link', target = '$target', images = '$images_id', imagestype = '$imagestype', imagesfloat = '$imagesfloat', orderby = '$orderby' WHERE (id='$images_id')");
	$trueresult .= __("Record updated successfully.","link-list-manager")."<br>";
}
elseif ($falseresult == '') { // write base
	$res = $wpdb->query("INSERT INTO $db_llm (category, name, alt, link, target, images, imagestype, imagesfloat, orderby) VALUES('$category', '$name', '$alt', '$link', '$target', '$images_id', '$imagestype', '$imagesfloat', '$orderby')");
	$trueresult .= __("Record was successfully added to the database.","link-list-manager")."<br>";
}
else { echo "Error..."; }


}
?>

	<br class="clear"><br class="clear">
<?php if ($get_category) {
	echo __("Category","link-list-manager")." $get_category<br>";
	echo '[llm category="'.$get_category.'"]<hr>';
?>
</div>

<br class="clear">

<?php if($trueresult || $falseresult) {?>
<div class="llmresult" style="<?php if($falseresult) { echo "color:red; font-weight:bold; border-color:red;"; } if($trueresult) { echo "color:green; font-weight:bold; border-color:green;"; }?>">
	<?php echo $trueresult; echo $falseresult; ?>
</div>
<?php }
if ($_GET['action'] == 'edit') { $llmnone = 'style="display:none;"'; }
if ($_GET['action'] != 'edit') { $llmpreview = 'style="display:none;"'; } else { $llmpreview = 'style="margin-left:15px;"'; }
?>

<div class="llmmenu" <?php echo $llmnone; ?>>
	<?php _e("Add a new entry:","link-list-manager"); ?><br><br>
	<form method="post" enctype="multipart/form-data" name="add">
		<small>
			<?php _e("Name of reference (Anchor):","link-list-manager"); ?><br><input type="text" name="name" class="inputtext"><br><br>
			<?php _e("Description of the link:","link-list-manager"); ?><br><input type="text" name="alt" class="inputtext"><br><br>
			<?php _e("URL:","link-list-manager"); ?><br><input type="text" name="link" value="http://www." class="inputtext"><br><br>
			<?php _e("Behavior:","link-list-manager"); ?><br>
			<input type="radio" name="target" id="_self" value="_self" checked> <label for='_self'><?php _e("In this window","link-list-manager"); ?></label>
			<input type="radio" name="target" id="_blank" value="_blank"> <label for='_blank'><?php _e("In a new window","link-list-manager"); ?></label><br><br>
			<?php _e("Image","link-list-manager"); ?> (*.gif, *.jpg, *.png, *.bmp):<br><input type="file" name="images"><br><br>
			<?php _e("The location of the image of the text:","link-list-manager"); ?><br>
			<input type="radio" name="imagesfloat" id="left" value="left" checked> <label for='left'><?php _e("Left","link-list-manager"); ?></label>
			<input type="radio" name="imagesfloat" id="right" value="right"> <label for='right'><?php _e("Right","link-list-manager"); ?></label><br><br>
			<?php _e("Poprotsionalno reduce the width of the image (numbers indicate size in PX, if you do not need to leave blank):","link-list-manager"); ?> <br><input type="text" name="resize" class="inputtext"><br><br>
			<?php _e("Sort order:","link-list-manager"); ?><br><input type="text" name="orderby" class="inputtext"><br><br>
			<input type="submit" value="<?php _e("Add","link-list-manager"); ?>" name="addllm"><br>
		</small>
	</form>
</div>

<div class="llmcontent">
<?php
$idllm = $_GET['id'];
if (!isset($idllm)) {
	$res = $wpdb->get_results("SELECT * FROM $db_llm WHERE category='$get_category' ORDER BY orderby");
	if(count($res) == '0') {
		echo __("You have not added any entries in the category","link-list-manager")." $get_category.";
	}
	foreach ($res as $row) {
		echo '<a href="admin.php?page=llm.php&category='.$get_category.'&id='.$row->id.'" title="Edit">[id = '.$row->id.'] '.$row->name.'</a><br>';
	}
} elseif ($_GET['action'] == 'edit'){

if ($_GET['delimages']) {
	$imagepatch = $patch_folder."/".$_GET['delimages'].$_GET['typeimages'];
	if(file_exists($imagepatch)) {
		$res = $wpdb->query("UPDATE $db_llm SET images = '', imagestype = '' WHERE (id='$idllm')");
		unlink($imagepatch);
		echo "<b>".__("Image removed.","link-list-manager")."</b><br><br>";
	}

}
	echo '<a href="admin.php?page=llm.php&category='.$get_category.'"  class="ablock llmradius">'.__("Back to the list of links","link-list-manager").'</a><br><br>';
	$res = $wpdb->get_results("SELECT * FROM $db_llm WHERE id='$idllm'");
	foreach ($res as $row) {
		$imagepatchlist = $patch_folder."/".$row->images.$row->imagestype;
?>
	<form method="post" enctype="multipart/form-data" action="admin.php?page=llm.php&category=<?php echo $_GET['category']; ?>&id=<?php echo $_GET['id']; ?>&action=edit" name="upd">
		<small>
			<?php _e("Name of reference:","link-list-manager"); ?><br><input type="text" name="name" value="<?php echo $row->name; ?>" class="inputtext"><br><br>
			<?php _e("Description of the link:","link-list-manager"); ?><br><input type="text" name="alt" value="<?php echo $row->alt; ?>" class="inputtext"><br><br>
			<?php _e("URL:","link-list-manager"); ?><br><input type="text" name="link"  value="<?php echo $row->link; ?>" class="inputtext"><br><br>
			<?php _e("Behavior:","link-list-manager"); ?><br>
<?php
if ($row->target == '_self') { $selfchecked = "checked"; }
if ($row->target == '_blank') { $blankchecked = "checked"; }
?>
			<input type="radio" name="target" id="_selfupd" value="_self" <?php echo $selfchecked;?>> <label for='_selfupd'><?php _e("In this window","link-list-manager"); ?></label>
			<input type="radio" name="target" id="_blankupd" value="_blank" <?php echo $blankchecked;?>> <label for='_blankupd'><?php _e("In a new window","link-list-manager"); ?></label><br><br>
<?php
if(file_exists($imagepatchlist) && is_file($imagepatchlist)) {
	echo __("Loaded image:", "link-list-manager").'<br>';
	echo $imageurllist = '<img src="'.$url_folder."/".$row->images.$row->imagestype.'" alt="'.$row->alt.'" style="llmimages llmimages'.$row->id.'">';
	echo '<br>
	<a href="http://'.$_SERVER['SERVER_NAME'].$_SERVER['REQUEST_URI'].'&delimages='.$row->images.'&typeimages='.$row->imagestype.'">'.__("Remove","link-list-manager").'</a>
	<br>
	<input type="hidden" value="'.$row->imagestype.'" name="imagestype">
	';
} else {?>
		<?php _e("Upload a new picture","link-list-manager"); ?> (*.gif, *.jpg, *.png, *.bmp):<br><input type="file" name="images">
<?php } ?><br><br>
		<?php _e("The location of the image of the text:","link-list-manager"); ?><br>
<?php
if ($row->imagesfloat == 'left') { $leftchecked = "checked"; }
if ($row->imagesfloat == 'right') { $rightchecked = "checked"; }
?>
		<input type="radio" name="imagesfloat" id="leftupd" value="left"  <?php echo $leftchecked;?>> <label for='leftupd'><?php _e("Left","link-list-manager"); ?></label>
		<input type="radio" name="imagesfloat" id="rightupd" value="right" <?php echo $rightchecked;?>> <label for='rightupd'><?php _e("Right","link-list-manager"); ?></label><br><br>
		<?php _e("Poprotsionalno reduce the width of the image (numbers indicate size in PX, if you do not need to leave blank):","link-list-manager"); ?> <br><input type="text" name="resize" class="inputtext"><br><br>
		<?php _e("Sort order:","link-list-manager"); ?><br><input type="text" name="orderby" value="<?php echo $row->orderby; ?>" class="inputtext"><br><br>
		<input type="submit" value="<?php _e("Update","link-list-manager"); ?>" name="update"><br>
	</small>
</form>
	<?php
	}


} elseif ($_GET['action'] == 'del'){
	$res = $wpdb->query("DELETE FROM ".$db_llm." WHERE (id='$idllm')");
	$imagepatch = $patch_folder."/".$_GET['id'].$_GET['typeimages'];
	if(file_exists($imagepatch) && is_file($imagepatch)) {
	unlink($imagepatch);
	}
	echo __("Record with an ID","link-list-manager")." ".$idllm." ".__("removed","link-list-manager")."<br><br>";
	echo '<a href="admin.php?page=llm.php&category='.$get_category.'"  class="ablock llmradius">'.__("Back to the list of links","link-list-manager").'</a><br><br>';
}

else {
	echo '<a href="admin.php?page=llm.php&category='.$get_category.'"  class="ablock llmradius">'.__("Back to the list of links","link-list-manager").'</a><br><br>';
	$res = $wpdb->get_results("SELECT * FROM $db_llm WHERE category='$get_category' AND id='$idllm' ORDER BY orderby");
	foreach ($res as $row) {
	echo '<a href="admin.php?page=llm.php&category='.$get_category.'&id='.$row->id.'&action=edit" class="ablock llmradius">'.__("Edit","link-list-manager").'</a> <a href="admin.php?page=llm.php&category='.$get_category.'&id='.$row->id.'&action=del&typeimages='.$row->imagestype.'" class="ablock llmradius">'.__("Remove","link-list-manager").'</a><br><br>'.__("Preview:","link-list-manager").'<hr>';
		$imagepatchlist = $patch_folder."/".$row->images.$row->imagestype;
		if(file_exists($imagepatchlist) && is_file($imagepatchlist)) {
			$imageurllist = '<img src="'.$url_folder."/".$row->images.$row->imagestype.'" alt="'.$row->alt.'" class="llmimages llmimages'.$row->id.'">';
		}

		if ($row->imagesfloat == 'left') {
			echo '<a href="'.$row->link.'" title="'.$row->alt.'" target="'.$row->target.'" class="llma llma'.$row->id.'">'.$imageurllist.''.$row->name.'</a>';
		}
		elseif ($row->imagesfloat == 'right') {
			echo '<a href="'.$row->link.'" title="'.$row->alt.'" target="'.$row->target.'" class="llma llma'.$row->id.'">'.$row->name.''.$imageurllist.'</a>';
		}
		else {
			echo '<a href="'.$row->link.'" title="'.$row->alt.'" target="'.$row->target.'" class="llma llma'.$row->id.'">'.$row->name.'</a>';
		}
	}
}
?>
</div>

<div class="alignleft" <?php echo $llmpreview; ?>>
<strong><?php _e("Preview:","link-list-manager"); ?></strong><br class="clear"><br class="clear">
<?php
$prevcategory = $_GET['category'];
$previd = $_GET['id'];
echo do_shortcode('[llm category="'.$prevcategory .'" id="'.$previd.'"]'); ?>
</div>
<br class="clear">
<?php
}
}

/* shortcode */
function llmshortcode($atts) {
global $wpdb, $db_llm, $patch_folder, $url_folder;
extract(shortcode_atts(array('category' => "1", 'id' => ''), $atts));
	if ($id) { $whereid = "AND id='$id'";}
	$res = $wpdb->get_results("SELECT * FROM $db_llm WHERE category='$category' $whereid ORDER BY orderby");
	$return .= "\n".'<ul class="llm llm'.$category.'">'."\n";
	foreach ($res as $row) {
		$imagepatchlist = $patch_folder."/".$row->images.$row->imagestype;
		if(file_exists($imagepatchlist) && is_file($imagepatchlist)) {
			$imageurllist = "\n".' <img src="'.$url_folder."/".$row->images.$row->imagestype.'" alt="'.$row->alt.'" class="llm-images llm-images'.$row->id.'">'."\n";
		}
		$return .= '<li class="llm-list llm-list'.$row->id.'">'."\n";
		if ($row->imagesfloat == 'left') {
			$return .= ' <a href="'.$row->link.'" title="'.$row->alt.'" target="'.$row->target.'" class="llm-link llm-link'.$row->id.'">'.$imageurllist.' '.$row->name.'</a>'."\n";
		}
		elseif ($row->imagesfloat == 'right') {
			$return .= '<a href="'.$row->link.'" title="'.$row->alt.'" target="'.$row->target.'" class="llm-link llm-link'.$row->id.'">'.$row->name.' '.$imageurllist.'</a>'."\n";
		}
		else {
			$return .= '<a href="'.$row->link.'" title="'.$row->alt.'" target="'.$row->target.'" class="llm-link llm-link'.$row->id.'">'.$row->name.'</a>'."\n";
		}
		$return .= "</li> \n";
	}
	$return .= '</ul>'."\n";

return $return;
}
add_shortcode('llm', 'llmshortcode');

/* widget */
class LLM_Widget extends WP_Widget {
function LLM_Widget() {
parent::WP_Widget(false, $name = 'LL Manager');
}

function widget($args, $instance) {
extract( $args );
echo $before_title;
echo $instance['title'];
echo $after_title;
echo $before_widget;
echo do_shortcode('[llm category="'.$instance['category'].'"]');
echo $after_widget;
}

function update($new_instance, $old_instance) {
return $new_instance;
}

function form($instance) {
$title = esc_attr($instance['title']);
$category = esc_attr($instance['category']);
?>

<p>
<label for="<?php echo $this->get_field_id('title'); ?>"><?php _e("Title","link-list-manager"); ?>
<input class="widefat" id="<?php echo $this->get_field_id('title'); ?>" name="<?php echo $this->get_field_name('title'); ?>" type="text" value="<?php echo $title; ?>" />
</label>
</p>
<p>
<label for="<?php echo $this->get_field_id('category'); ?>"><?php _e("Category (ID)","link-list-manager"); ?>
<input class="widefat" id="<?php echo $this->get_field_id('category'); ?>" name="<?php echo $this->get_field_name('category'); ?>" type="text" value="<?php echo $category; ?>" />
</label>
</p>

<?php
}

}
add_action('widgets_init', create_function('', 'return register_widget("LLM_Widget");'));

?>