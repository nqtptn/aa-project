<?php /* Smarty version 2.6.25, created on 2012-06-25 16:59:27
         compiled from body.tpl */ ?>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'header.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'sidebar.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

 
<div class="columns-8 featured-content">
   <div class="columns-6 featured-content">
      <table class="categoryTable col6"><tbody>
      <tr><td colspan="2"><h3><?php echo $this->_tpl_vars['lang']['J_CATLIST']; ?>
</h3></td></tr>
         <tr valign="top"><td>
         <?php if ($this->_tpl_vars['jobCategories']): ?>
         <table class="col6"><tr></td>
            <?php $this->assign('cnt', 0); ?>
            <?php $_from = $this->_tpl_vars['jobCategories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['cats'] => $this->_tpl_vars['cat']):
?>
               <?php if ($this->_tpl_vars['cat']['cp_id'] == 0): ?>
                  <table style="background:url(<?php echo $this->_tpl_vars['plugin_url']; ?>
/images/back.gif) repeat-x;">
                     <tr><td width=10px>&nbsp;</td><td width=30px><a onClick="hide('j_<?php echo $this->_tpl_vars['cat']['c_id']; ?>
');"><img src="<?php echo $this->_tpl_vars['catImgSrc']; ?>
" name="imgj_<?php echo $this->_tpl_vars['cat']['c_id']; ?>
" align="left"></a></td>
                        <td class="jp_category"><b><?php echo $this->_tpl_vars['cat']['category_link']; ?>
</b><?php if ($this->_tpl_vars['cat']['jcounTotal'] > 0): ?> <span class="smallTxt">&nbsp;(<?php echo $this->_tpl_vars['cat']['jcount']; ?>
, total <?php echo $this->_tpl_vars['cat']['jcounTotal']; ?>
)</span><?php endif; ?></td></tr>
                  </table>
               <?php endif; ?>
               <?php if ($this->_tpl_vars['jobSubCategories']): ?>
               <div style="display: none;" id="j_<?php echo $this->_tpl_vars['cat']['c_id']; ?>
">
                  <table><tr><td><?php echo $this->_tpl_vars['cat']['catImg']; ?>
</td>
                     <td width=100%>
                        <?php $_from = $this->_tpl_vars['jobSubCategories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['subs'] => $this->_tpl_vars['sub']):
?>
                           <?php if ($this->_tpl_vars['sub']['cp_id'] == $this->_tpl_vars['cat']['c_id']): ?>
                              &nbsp;&nbsp;<?php echo $this->_tpl_vars['sub']['subCategory_link']; ?>
<?php if ($this->_tpl_vars['sub']['jcount'] > 0): ?> <span class="smallTxt">&nbsp;(<?php echo $this->_tpl_vars['sub']['jcount']; ?>
)</span><?php endif; ?><br />
                           <?php endif; ?>
                        <?php endforeach; endif; unset($_from); ?>
                     </td>
                  </td></tr></table>
               </div>
               <?php if ($this->_tpl_vars['cnt'] < 2): ?> <script type="text/javascript"> hide('j_<?php echo $this->_tpl_vars['cat']['c_id']; ?>
'); </script> <?php endif; ?>
               <?php $this->assign('cnt', $this->_tpl_vars['cnt']+1); ?>
               <?php endif; ?>
            <?php endforeach; endif; unset($_from); ?>
         </td></tr></table>
         <?php endif; ?>
      </td></tr>
      </tbody></table>
   </div><!--columns-6-->
   <div class="columns-6 featured-content">
      <table class="categoryTable col6"><tbody>
         <tr><td colspan="2"><h3><?php echo $this->_tpl_vars['lang']['R_CATLIST']; ?>
</h3></td></tr>
         <tr valign="top"><td>
               <?php if ($this->_tpl_vars['resCategories']): ?>
                   <table class="col6"><tr></td>
                      <?php $this->assign('cnt', 0); ?>
                      <?php $_from = $this->_tpl_vars['resCategories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['cats'] => $this->_tpl_vars['cat']):
?>
                         <?php if ($this->_tpl_vars['cat']['rcp_id'] == 0): ?>
                            <table style="background:url(<?php echo $this->_tpl_vars['plugin_url']; ?>
/images/back.gif) repeat;">
                            <tr>
                              <td width=10px>&nbsp;</td><td width=30px><a onClick="hide('r_<?php echo $this->_tpl_vars['cat']['rc_id']; ?>
');"><img src="<?php echo $this->_tpl_vars['catImgSrc']; ?>
" name="imgr_<?php echo $this->_tpl_vars['cat']['rc_id']; ?>
" align="left"></a></td>
                              <td class="jp_category"><b><?php echo $this->_tpl_vars['cat']['resume_link']; ?>
</b><?php if ($this->_tpl_vars['cat']['rcounTotal'] > 0): ?> <span class="smallTxt">&nbsp;(<?php echo $this->_tpl_vars['cat']['rcount']; ?>
, total <?php echo $this->_tpl_vars['cat']['rcounTotal']; ?>
)</span><?php endif; ?></td>
                           </tr>
                           </table>
                        <?php endif; ?>
                        <?php if ($this->_tpl_vars['resSubCategories']): ?>
                        <div style="display: none;" id="r_<?php echo $this->_tpl_vars['cat']['rc_id']; ?>
">
                           <table><tr><td><?php echo $this->_tpl_vars['cat']['catImg']; ?>
</td>
                              <td width=100%>
                              <?php $_from = $this->_tpl_vars['resSubCategories']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['subs'] => $this->_tpl_vars['sub']):
?>
                                <?php if ($this->_tpl_vars['sub']['rcp_id'] == $this->_tpl_vars['cat']['rc_id']): ?>
                                    &nbsp;&nbsp;<?php echo $this->_tpl_vars['sub']['subResume_link']; ?>
<?php if ($this->_tpl_vars['sub']['rcount'] > 0): ?> <span class="smallTxt">&nbsp;(<?php echo $this->_tpl_vars['sub']['rcount']; ?>
)</span><?php endif; ?><br />
                                <?php endif; ?>
                              <?php endforeach; endif; unset($_from); ?>
                              </td>
                           </td></tr></table>
                       </div>
                       <?php if ($this->_tpl_vars['cnt'] < 2): ?> <script type="text/javascript"> hide('r_<?php echo $this->_tpl_vars['cat']['rc_id']; ?>
'); </script> <?php endif; ?>
                       <?php $this->assign('cnt', $this->_tpl_vars['cnt']+1); ?>
                     <?php endif; ?>
                  <?php endforeach; endif; unset($_from); ?>
               </td></tr></table>
            <?php endif; ?>
        </td></tr>
      </tbody></table>
   </div><!--columns-6-->
</div>
<!--columns-8-->
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => 'footer.tpl', 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>