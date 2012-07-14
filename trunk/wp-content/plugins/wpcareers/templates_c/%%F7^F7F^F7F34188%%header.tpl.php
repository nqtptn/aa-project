<?php /* Smarty version 2.6.25, created on 2012-06-25 16:59:27
         compiled from header.tpl */ ?>



<div class="top_title"><a href = "<?php echo $this->_tpl_vars['mainLink']; ?>
">HOME</a>
| <a href = "/content/contact-us/">CONTACT US</a> 
| <a href = "/content/terms-of-service/">Terms Of Service</a></div>


<div class="post" id="post-01">
   <div class="loginform">
      <table>
      <tr><td width=670>
         <?php if ($this->_tpl_vars['error']): ?> <div class="jp_message"><?php echo $this->_tpl_vars['error']; ?>
</div> <?php endif; ?> 
         <?php if ($this->_tpl_vars['message']): ?> <?php echo $this->_tpl_vars['headpic']; ?>
<div class="jp_message"><?php echo $this->_tpl_vars['message']; ?>
</div>
         <?php else: ?> <?php echo $this->_tpl_vars['headpic']; ?>
&nbsp;<?php echo $this->_tpl_vars['headtxt']; ?>

         <?php endif; ?>
      </td>
      <td>
      <div class="jp_login">
         <?php if ($this->_tpl_vars['user_ID']): ?>
            <?php echo $this->_tpl_vars['lang']['J_HELLO']; ?>
 <strong><?php echo $this->_tpl_vars['user_identity']; ?>
!</strong> Welcome to <?php bloginfo('name');  ?><br />
            <?php if ($this->_tpl_vars['permission'] >= 1): ?>
               <a href="<?php echo $this->_tpl_vars['mainLink']; ?>
">Home</a> | <a href="<?php echo $this->_tpl_vars['siteurl']; ?>
/wp-admin/profile.php">My Profile</a> | <a href="<?php echo $this->_tpl_vars['siteurl']; ?>
/wp-login.php?action=logout">Logout</a>
               <p><b>Your Status Summary:</b></p>
               <?php if ($this->_tpl_vars['ljobs']): ?>
                  <?php $this->assign('cnt', 0); ?>
                  <?php $_from = $this->_tpl_vars['ljobs']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['item']):
?>
                     <span class="smallTxt"><?php echo $this->_tpl_vars['item']['viewjob']; ?>
 viewed <?php echo $this->_tpl_vars['item']['l_view']; ?>
</span><br />
                  <?php endforeach; endif; unset($_from); ?>
               <?php endif; ?>
               <?php if ($this->_tpl_vars['lresume']): ?>
                  <?php $this->assign('cnt', 0); ?>
                  <?php $_from = $this->_tpl_vars['lresume']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['item']):
?>
                     <span class="smallTxt"><?php echo $this->_tpl_vars['item']['viewResume']; ?>
 viewed <?php echo $this->_tpl_vars['item']['r_view']; ?>
</span><br />
                  <?php endforeach; endif; unset($_from); ?>
               <?php endif; ?>
            <?php endif; ?>
         <?php else: ?>
            <form action="<?php echo $this->_tpl_vars['siteurl']; ?>
/wp-login.php?action=login" method="post">
               <label>User: </label><input type="text" name="log" id="log" class="editbox" value="<?php echo $this->_tpl_vars['user_login']; ?>
" size="12" /><br />
               <label>Password:</label><input type="password" name="pwd" id="pwd" class="editbox" size="12" /><br />
               <label>Remember me:</label><input name="rememberme" id="rememberme" type="checkbox" checked="checked" value="forever" /><BR />
               <input type="submit" name="submit" value="Login" class="button" />
               <input type="hidden" name="redirect_to" value="<?php echo $this->_tpl_vars['REQUEST_URI']; ?>
"/>
            </form>
            <P><a href="<?php echo $this->_tpl_vars['siteurl']; ?>
/wp-register.php">Register</a> or 
            <a href="<?php echo $this->_tpl_vars['siteurl']; ?>
/wp-login.php?action=lostpassword">Recover password?</a>
         <?php endif; ?>
      </div>
      <!-- jp_login -->
      </td></tr>
      </table>
         </div>
</div>
<!-- loginform -->