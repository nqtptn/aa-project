=== SEO Crawlytics by Elevatelocal ===
Contributors: Yousaf Sekander
Donate link: http://www.elevatelocal.co.uk/
License: GPLv2 or later
License URI: http://www.gnu.org/licenses/gpl-2.0.html
Tags: crawlers, robots, seo crawlytics, search engines, search engine robots, seo, analytics
Requires at least: 3.1
Tested up to: 3.3.2
Stable tag: 1.1.8

SEO Crawlytics helps you gain a better understanding of the behaviour of robots.

== Description ==

SEO Crawlytics helps you gain a better understanding of the behaviour of robots.Track & analyse search engine spiders through an easy-to-use interface with options to choose from. Use SEO Crawlytics for diagnosing and statistics to gain a better understanding of what search engines are up to on your site.

Features:

* Most crawled Categories & Pages
* Peak crawl times
* Robot visit details and page crawl history
* Editable User Agents to track
* Email notifications (Daily and Instant)
* Static page integration

= Hourly/Daily Visits =

This is the main graph in the WordPress dashboard, and also on the plugin dashboard. Along the X-axis is the date and time of the visit which spans from 2 weeks ago to the current time. Along the Y-axis is the total number of robot visits for each robot during that hour, each robot has its own colour as defined in the top right legend. The reason this graph is grouped by hour is that it provides you with the easiest method to see which days were the most active, and which hours of those days were most active.

Since the amount of plots on this graph can become quite busy if you experience a lot of search traffic, you can also select a region to zoom into so that you can get more precise values. If you wish to look at just one day, you can click and drag from the 15th to the 16th and you'll see the visits per hour during that day, with the graph rescaled to fit the values properly. Below the main graph, there’s a small timeline graph so that you can select a new, wider area if you wish to zoom out.

The Daily Visits graph is similar to the graph above, however it groups all results by the day they occured so that you can easily see which days themselves are the busiest. Similar to the previous graph, this graph is also on a rolling 2 week cycle.

= Top Crawled Pages/Categories =

Each time a search bot accesses your site, SEO Crawlytics will determine which post is being viewed and what categories that post belongs to. With this information, we can then graph out what posts and categories are most commonly visited by search bots. There is no historical limit on these graphs and they will factor in all data captured since you started using it. Additionally, as some blogs may have hundreds of posts, if a post does not account for 10% or more of the views then it will be grouped under the “Other” category.

= Peak Crawl Times =
Whilst the Hourly Visits graph gives an hour by hour breakdown of bot visit activity, the purpose of this graph is to show which hours of the day are overall most active for the search bots. This graph takes every visit to the site by a bot and groups it by the hour of the visit and then records this amount. What you end up with is a list of 24 hours with the accumulative values for every day the plugin has been active. Using this graph, you can easily see which hours of the day the bots are most likely to crawl your site, and arrange your post updates around that time for optimal search engine presence

= Crawl Spead =
This pie chart gives you a breakdown of the top most active robots on your website in percentage.

= Robot Detection & Verification =
In the configuration panel you add new robots to the list and to ensure that your data is not diluted by spoofed user-agents you can add use reverse DNS for verification. If you don’t use reverse DNS then it is very likely that your data will not be an accurate reflection of actual robot visits.

= Email Notifications and Integration =
In the configuration section you can enable email notifications. You can choose to be instantly notified as soon as a robot is detected or you can go for daily reports. There are several variable that you can use to customize notifications, variables include  {bot} {mask} {url} {time} {refer} and {ipaddress}.

Finally if parts of your website is static or is using a different CMS then you can use the integration option to track the entire site. All you need to do is add the tracking snippet given in the configuration in the footer.

= Futher Reading =

For more info check out the following:
* [Track & analyse robot activity on Wordpress](http://www.elevatelocal.co.uk/seo-crawlytics).
* [SEO Crawlytics – gain a better understanding of robot behaviour](http://www.elevatelocal.co.uk/blog/seo-crawlytics-gain-a-better-understanding-of-robot-behaviour-22057356).

= Ask the Author =
Follow me on [Twitter](http://twitter.com/ysekand) or [Google+](https://plus.google.com/114240873058453687530?rel=author).

== Requirements ==
SEO Crawlytics requires Wordpress 3.1 or higher.

== Installation ==
Upload the SEO Crawlytics folder to the /wp-content/plugins/ directory
Activate the SEO Crawlytics plugin through the 'Plugins' menu in WordPress
Configure the plugin by going to the SEO Crawlytics menu that appears in your admin menu

== Changelog ==

= 1.1.8 =
* Fixed bug that stopped graphs from displaying in Chrome browser.

= 1.1.7 =
* The installation script now creates the required config file within the plugin's "/track/" directory.
* The external track script now reads the place holder tracking image from an image file, instead of having it embed within the script itself.

= 1.1.6 =
* Initial release