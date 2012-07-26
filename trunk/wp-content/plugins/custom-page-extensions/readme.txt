=== Custom Page Extensions ===
Contributors: GrandSlambert
Donate link: http://plugins.grandslambert.com/custom-page-extensions-donate
Tags: page, extensions, html, htm
Requires at least: 2.5
Tested up to: 3.2.1
Stable tag: trunk

Allows you to add a custom extension to your page URLs. This only affects pages created under the Pages menu and not your posts, category or tag URLs.

== Description ==

Allows you to add a custom extension to your page URLs. This only affects pages created under the Pages menu and not your posts, category or tag URLs.

Features include:

* Select which extension you wish to use on all pages.
* Adds an item to the Pages Menu to set the global extension you wish to use.

== Installation ==

1. Upload `custom-page-extensions` folder to the `/wp-content/plugins/` directory
2. Activate the plugin through the 'Plugins' menu in WordPress
3. Configure the plugin on the Pages->Page Extension screen.

== Changelog ==

0.6 - July 17th, 2011

* Two years later, a first update!
* Now compatible with WordPress 3.2+.
* Fixed links so settings page can be found.
* Updated settings page for easier management.
* Removed requirement to reactivate when a permalink change is made.
* Fixed a bug where pages would not show when pretty permalinks were not used.

0.5 - July 17th, 2009

* Early alpha release

== Upgrade Notice ==

= 0.6 =
* Fixed issues so it works with WordPress 3.2+

== Frequently Asked Questions ==

= I changed the extension, now all pages are not foud? =

If you change the extension on the options page, you must deactivate and then reactivate the plugin on the Plugin administration page. We are working on a solution for this problem.

= The plugin stopped working for no reason. =

This plugin requires that you are using pretty permalinks. If you change your permalink structure after activating this plugin you must deactivate and reactivate the plugin on your Plugin Administration page. Future versions will remove this requirement.

= Can't I just add the extension on each page? =

You can, but Wordpress will strip out the period (.) in your permalink. For example, if you set the permalink to "about.html", Wordpress will change it to "abouthtml" when you save. With this plugin, the correct "about.html" will be the permalink for your page.

= Why do I need this plugin? =

If you are converting an existing site to wordpress and want to keep your existing page names, this plugin can help you do that.

= Where can I get support? =

http://support.grandslambert.com/forum/custom-page-extensions

== Screenshots ==
