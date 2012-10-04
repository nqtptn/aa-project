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
define('DB_NAME', 'trathonghong');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'root');

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
define('AUTH_KEY',         'r.U<lq}1~u;q(&H%(9Wm_Gw5(rN7_xiF8j/2?;0yyxF/n+P01*+4{tFH&dI>a.1r');
define('SECURE_AUTH_KEY',  'xt%2->#Jd`OkZa8Nu5:]x8E`ZJQj{1c]**iHL}8%X-?G|V<]lFgeR+QcX.&FQC|y');
define('LOGGED_IN_KEY',    'V(aXa}w:7i?^Fy~,Tm{Qdd;H>Vg&wzuF##%7o=~U-3:3ow.6%rkNtV]DO>x+CW!&');
define('NONCE_KEY',        'Dy0f$FoMZmLy5|n*ChF`J^kY97F;2h!wajo87S0X8CS2~ul2vrqdWj$MmsQVw5%j');
define('AUTH_SALT',        'dK#`VzxfYA ALjdSJ8o&02Y_Z|w}eDvMOI`y)ZJ3#ReoI?+!AZ!x|yO&s9m%I3+t');
define('SECURE_AUTH_SALT', '&S*.=YJj+|]Jp;(j9z+-m)(?lliG3X%&ut#(quQRY>?Gx+9n-~Vfp,DmI+gI48;*');
define('LOGGED_IN_SALT',   'qwt)MUF*wwp.74}Yb/8xZmzZTDlo6TxA,%#KJqqum40*<t>6(ZYPU-Tg;X{w>_mw');
define('NONCE_SALT',       'dTNk b}5R!LYzX6jFof b#d{HI~/ mHX9~YjX_}/X1jNAb!9o&AA 8#Or ^2/*i:');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'th_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');

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
