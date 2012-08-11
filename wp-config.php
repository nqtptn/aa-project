<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'AAEXPRESS');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', '123456');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '?W/4Q}OA8E@p}1-m]J^S_<Zi2?N46={-k4|Lh@m@lj@]+&JB`^;|ih)Uh`8;;xXw');
define('SECURE_AUTH_KEY',  ']Er6lpM!VfboVz%,i##? Zm}j3;_oX{vqqCtKuq1StP)zU*Q p:0Q):VU]8(s 3s');
define('LOGGED_IN_KEY',    'U8qed;gz|*p:iu@h x D|;0{v&Y5c)fE>#&Pzj8jEe=[N!(_EG/|G&!Qk5srVgE0');
define('NONCE_KEY',        ' ^kDQf:(om5u#qeBV#awc/wu&Wr@p:{9ot|),1=<Q7D[fWW7qSv|f/}VanEJMWaA');
define('AUTH_SALT',        'S(:,>6{TFtvSf%J(FDINI1Q%q<,C/Cl)LRK:(vXW(%fSzU1kGNrmh 6q:@Z^*>iJ');
define('SECURE_AUTH_SALT', 'g|XQn2%~k#vA.0$&KL:%b.:+a1]H1^whDvL)^Kf`}R?9;0@R;1lhX+BsRT75B &[');
define('LOGGED_IN_SALT',   'b|}(wwFT<OS73$K!`BSCs7Sa5.Dlc]E!/S`{5Z&&2-zWxY8nKYK5.Zn]m*([hB |');
define('NONCE_SALT',       'sb<jPWC|SQk%3Kuh/16Z>DDG1%dY #U>q&>x^1p%~B)cJ|=)@wZPm]x`#~eE{<Aw');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'dev_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');
define('WP_ALLOW_REPAIR', true);

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
