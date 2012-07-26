=== link-list-manager ===
Contributors: ZetRider
Donate link: http://www.zetrider.ru/link-list-manager.html
Tags: links, link directory, link manager, banners, partners
Requires at least: 3.0
Tested up to: 3.2.1
Stable tag: 1.0

This plugin allows you to compile a list of links to images of allocating to each category.

== Description ==

With plug-Link List Manager you can organize a list of links with images or without them.<br>
This plugin can be used for display of banners, as well as to display the list of partners. If desired, plug-in can be used as a directory of files.<br>
<br>
<b>Features plug-in:</b><br>
* Separate links to categories<br>
* Configure link for the following:<br>
** Name (anchor)<br>
** Description (alt, title)<br>
** Link (url)<br>
** Behavior (target)<br>
** Image<br>
** Proportionally reduce the width of the image<br>
** The location of the image of the anchor (left or right)<br>
** The sort order options<br>
** Preview links<br>
** Embed a widget in your theme with the settings (block header, a category that you want to show the links)<br>
** ShortCode embed in your blog entries.<br>
<br>
For images, plugin creates a folder at: /wp-content/uploads/llm с правами CHMOD (0700)<br>
If you do not have the right to display the folder, the plugin does not download images.<br>
<br>
<strong>HTML:</strong><br>
<br>
&lt;ul class="llm llm$ID_CATEGORY"&gt;<br>
&nbsp;&nbsp;&nbsp;&lt;li class="llm-list llm-list$ID_ROW"&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;a href="http://www.zetrider.ru" title="wordpress plugins" target="_blank" class="llm-link llm-link$ID_ROW"&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;img src="http://www.zetrider.ru/wp-content/themes/zetrider/images/logo.png" alt="wordpress plugins" style="llm-images llm-images$ID_ROW"&gt;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ZetRider.ru<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/a&gt;<br>
&nbsp;&nbsp;&nbsp;&lt;/li&gt;<br>
&lt;/ul&gt;<br>
<br>
<strong>CSS: </strong><br><br>
<br>
.llm { <br>
/* Class to the list */ <br>
} <br>
.llm$ID_CATEGORY { <br>
/* Class for a list of category ID display options */ <br>
} <br>
<br>
.llm-list {<br>
/* Class for LI */<br>
}<br>
.llm-list$ID_ROW {<br>
/* Class for LI with ID of record */<br>
}<br>
<br>
.llm-link {<br>
/* Class for link */<br>
}<br>
.llm-link$ID_ROW {<br>
/* Class for link ID of record */<br>
}<br>
<br>
.llm-images {<br>
/* Class for the image */<br>
}<br>
.llm-images$ID_ROW {<br>
/* Class for the image ID of the record */<br>
}<br>
<br><br>

<strong>Options shortcode LLM:</strong><br>
<br>
[llm category="id"] - Displays the entries from this category if it exists<br>
[llm category="id" id="id"] - displays the entries from this category and the following link if it exists <br>

== Installation ==

1. Download the plugin Link List Manager.
2. Download the folder link-list-manager in the category of plug-ins /wp-content/plugins/
3. Activate the plugin
4. In the left pane in the administrative setting, select LLManager
5. Add new links
6. Add widget to your LL Manager topic or Shortcode [llm category=""] in your records.

== Screenshots ==

1. Add a new link
2. Management of reference
3. Editing links

== Frequently Asked Questions ==

Free help and videos is here - http://www.zetrider.ru

== Upgrade Notice ==

none

== Changelog ==

= 1.0 =
* Testing and creating plugins