<?php /* Smarty version 2.6.25, created on 2012-06-25 17:00:36
         compiled from post_resume.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'html_options', 'post_resume.tpl', 23, false),)), $this); ?>


<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'header.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<div class="columns-7 featured-content">
   <table class="categoryTable col7"><tbody>
   <tr>
      <td><h2><?php echo $this->_tpl_vars['main_link']; ?>
</h2><HR />
          <h3><?php echo $this->_tpl_vars['lang']['J_ADDRESUME']; ?>
</h3><?php echo $this->_tpl_vars['lang']['MARKED_OPTION']; ?>
</td>
   </tr>

   <tr valign="top"><td>
      <form method="post" id="jp_post_resume" name="jp_post_resume" enctype="multipart/form-data" onsubmit="this.sub.disabled=true;this.sub.value='Posting Resume...';" action="">
         <input type="hidden" name="wpcareers_post_topic" value="yes" />
         <table border=0 cellpadding=3 cellspacing=3 >
            <tr bgcolor="#F4F4F4">
               <td class="td_left"><?php echo $this->_tpl_vars['lang']['J_CAT']; ?>
* <?php echo $this->_tpl_vars['item']['category']; ?>
</td>
               <td class="td_right"><select name="wpcareers[category]"><?php echo smarty_function_html_options(array('values' => $this->_tpl_vars['categoryId'],'output' => $this->_tpl_vars['categoryTitle'],'selected' => $this->_tpl_vars['categorySelected']), $this);?>
</select></td>
            </tr>
                        <tr>
               <td class="td_left"><?php echo $this->_tpl_vars['lang']['J_TITLE']; ?>
*</td>
               <td class="td_right"><input type="text" name="wpcareers[title]" value="<?php echo $this->_tpl_vars['title']; ?>
" size="50"></td>
            </tr>
            <tr bgcolor="#F4F4F4">
               <td class="td_left"><?php echo $this->_tpl_vars['lang']['R_NAME']; ?>
*</td>
               <td><input type="text" name="wpcareers[name]" value="<?php echo $this->_tpl_vars['name']; ?>
" size="50"></td>
            </tr>
	         <tr><td><span class="red"><?php echo $this->_tpl_vars['lang']['R_CONTACTINFO']; ?>
</span></td><td></td></tr>
            <!--tr bgcolor="#F4F4F4">
               <td class="td_left"><?php echo $this->_tpl_vars['lang']['J_SURNAME']; ?>
</td>
               <td><input type="text" name="wpcareers[information]" value="<?php echo $this->_tpl_vars['information']; ?>
" size="50"></td>
            </tr-->
	         <tr>
               <td class="td_left"><?php echo $this->_tpl_vars['lang']['R_CAREER']; ?>
*</td>
               <td class="td_right">
	            <textarea rows="6" name="contactinfo" cols="60" id="contactinfo"><?php echo $this->_tpl_vars['information']; ?>
</textarea><br />
      			<span class ="smallTxt"><span id="charLeft"> </span>&nbsp;chars left. Maximum <?php echo $this->_tpl_vars['wpca_settings']['excerpt_length']; ?>
 characters</span>
	            </td>
            </tr>
            <tr bgcolor="#F4F4F4">
               <td class="td_left"><?php echo $this->_tpl_vars['lang']['J_EMAIL']; ?>
*</td>
               <td class="td_right">
               <input type="text" name="wpcareers[email]" value="<?php echo $this->_tpl_vars['email']; ?>
" size="30"></td>
            </tr>
            <tr>
               <td class="td_left"><?php echo $this->_tpl_vars['lang']['J_TEL']; ?>
</td>
               <td class="td_right">
               <input type="text" name="wpcareers[tel]" value="<?php echo $this->_tpl_vars['tel']; ?>
" size="30"><span class="smallTxt">&nbsp;like: (800) 555-123 or +49 123-12345<span></td>
            </tr>
            <tr bgcolor="#F4F4F4">
               <td class="td_left"><?php echo $this->_tpl_vars['lang']['J_FAX']; ?>
</td>
               <td><input type="text" name="wpcareers[fax]" value="<?php echo $this->_tpl_vars['fax']; ?>
" size="30"><span class="smallTxt">&nbsp;like: +98 (311)-123 or 0880 123-45678</span></td>
            </tr>
            <tr>
               <td class="td_left"><?php echo $this->_tpl_vars['lang']['R_TOWN']; ?>
*</td>
               <td><input type="text" name="wpcareers[town]" value="<?php echo $this->_tpl_vars['town']; ?>
" size="30"></td>
            </tr>
            <tr bgcolor="#F4F4F4">
               <td class="td_left"><?php echo $this->_tpl_vars['lang']['R_STATE']; ?>
</td>
               <td><input type="text" name="wpcareers[state]" value="<?php echo $this->_tpl_vars['state']; ?>
" size="30"></td>
            </tr>
            <tr><td><span class="red"><?php echo $this->_tpl_vars['lang']['RH_DESCSKILLS']; ?>
</span></td></tr>
            <tr>
               <?php $this->assign('DESCTEXT', $this->_tpl_vars['desctext']); ?>
               <td class="td_left" valign="top"><?php echo $this->_tpl_vars['lang']['R_DESCEXP']; ?>
*</td>
               <td><?php create_description($this->get_template_vars('DESCTEXT'), 'desctext', 'jp_post_resume'); ?></td>
            </tr>
            <tr bgcolor="#F4F4F4"><td class="td_left"><?php echo $this->_tpl_vars['lang']['R_PHOTO']; ?>
</td>
               <td class="td_right">
               <span class ="smallTxt">upload a detailed resume and a photograph.</span><br />
               <table>
                  <tr>
                     <td><input type="hidden" name="wpcareers[oldFileName]" value="<?php echo $this->_tpl_vars['oldFileName']; ?>
" /><input type="file" name="photo" /></td>
                     <td>&nbsp;&nbsp;&nbsp;&nbsp;<?php if ($this->_tpl_vars['_photo']): ?><?php echo $this->_tpl_vars['_photo']; ?>
<?php endif; ?></td>
                  </tr>
                  <tr>
                     <td class="top"><span class="smallTxt">&nbsp;JPG, GIF or PNG file (<?php echo $this->_tpl_vars['photomax']; ?>
)</span></td>
                     <td><?php if ($this->_tpl_vars['_photo']): ?><input type=checkbox name="remove_photo">&nbsp;Delete this Photo<?php endif; ?></td>
                  </tr>
               </table>
               </td>
            </tr>
            <tr><td class="td_left"><?php echo $this->_tpl_vars['lang']['R_UPLOAD']; ?>
</td>
               <td class="td_right">
		            <span class ="smallTxt">If you already have your resume in a MS Word, WordPerfect, etc.</span>
                  <table>
                     <tr>
                        <td><input type="hidden" name="wpcareers[oldUploadName]" value="<?php echo $this->_tpl_vars['oldUploadName']; ?>
" /><input type="file" name="upload" /></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;<?php if ($this->_tpl_vars['_upload']): ?><?php echo $this->_tpl_vars['_upload']; ?>
<?php endif; ?></td>
                     </tr>
                     <tr>
                        <td class="top"><span class ="smallTxt">Upload a file up to (<?php echo $this->_tpl_vars['uploadmax']; ?>
)</span></td>
                        <td><?php if ($this->_tpl_vars['_upload']): ?><p><input type=checkbox name="remove_upload">&nbsp;Delete this file<?php endif; ?></td></tr>
                  </table>
               </td>
            </tr>
            <tr><td><span class="red"><?php echo $this->_tpl_vars['lang']['JH_AWARDS']; ?>
</span></td><td></td></tr>
            <tr bgcolor="#F4F4F4">
               <td class="td_left"><?php echo $this->_tpl_vars['lang']['R_SALARY']; ?>
</td>
               <td class="td_right">
               <input type="text" name="wpcareers[salary]" value="<?php echo $this->_tpl_vars['salary']; ?>
" size="20">&nbsp;
               <select name="wpcareers[typesalary]"><?php echo smarty_function_html_options(array('values' => $this->_tpl_vars['salaryId'],'output' => $this->_tpl_vars['salaryTitle'],'selected' => $this->_tpl_vars['salarySelected']), $this);?>
</select></td>
            </tr>
            <tr>
               <td class="td_left"><?php echo $this->_tpl_vars['lang']['R_START']; ?>
</td>
               <td><input type="text" name="wpcareers[startDate]" value="<?php echo $this->_tpl_vars['startDate']; ?>
" size="50"></td>
            </tr>
            
            <tr bgcolor="#F4F4F4">
               <td></td>
               <td class="td_right"><input type="checkbox" name="wpcareers[private]" <?php if ($this->_tpl_vars['private'] == 1): ?>checked<?php endif; ?>>
               Keep my identifiable details anonymous on this website.<br />&nbsp;&nbsp;&nbsp;This option is not recommended.</td>
            </tr>
            <tr>
               <td class="td_left"><?php echo $this->_tpl_vars['lang']['J_HOWLONG']; ?>
</td>
               <td class="td_right">
               <input type="text" name="wpcareers[expire]" size="3" maxlength="3" value="<?php echo $this->_tpl_vars['expire']; ?>
" />&nbsp;<span class ="smallTxt">(<?php echo $this->_tpl_vars['expiredefault']; ?>
 days)</span></td>
            </tr>
            <tr>
               <td></td>
               <td class="td_right"><input type="checkbox" id="wpcareers[agree]" name="wpcareers[agree]" checked />&nbsp;Please agree to our policy*</td>
            </tr>
            <?php echo $this->_tpl_vars['confirm']; ?>

            <tr bgcolor="#F4F4F4">
               <td></td>
               <td><p><?php echo $this->_tpl_vars['lang']['J_AG']; ?>
<br /><input type="hidden" name="rid" value="0" /></p> <input type=submit value="<?php echo $this->_tpl_vars['lang']['J_SUBMIT']; ?>
"></td>
            </tr>
         </table>
      </form>
   </td></tr></tbody></table>
</div>



<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'footer.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>