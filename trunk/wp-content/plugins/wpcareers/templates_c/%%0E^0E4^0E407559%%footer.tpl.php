<?php /* Smarty version 2.6.25, created on 2012-06-25 16:59:27
         compiled from footer.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'sortby', 'footer.tpl', 34, false),)), $this); ?>

<div class="columns-2">
   <table class="otherTable col2"><tbody>
      <tr><td>
         <p><center><?php echo $this->_tpl_vars['g120_600']; ?>
</center></p>
      </td></tr>
   </table>
</div>



<!--columns-2-->
<p><?php if ($this->_tpl_vars['googlebtn']): ?><div class="jp_googleAd"><?php echo $this->_tpl_vars['jp_googleAd']; ?>
</div><?php endif; ?></p>
<div class="jp_footer">
   <dl class="columnsf-2">
      <dt>Legende</dt>
      <dd>Categories: <?php echo $this->_tpl_vars['categories_total']; ?>
</dd>
      <dd>Jobs: <?php echo $this->_tpl_vars['jobs_total']; ?>
</dd>
      <dd>Resume: <?php echo $this->_tpl_vars['resume_total']; ?>
</dd>
   </dl>
   <dl class="columnsf-voll">
      <dt><?php echo $this->_tpl_vars['wpca_settings']['new_links']; ?>
 <?php echo $this->_tpl_vars['lang']['J_LASTADD']; ?>
</dt>
      <br />
      <b>Jobs</b>
      <?php $_from = smarty_modifier_sortby($this->_tpl_vars['new_jobs'], 'date'); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['item']):
?>
        <dd><?php echo $this->_tpl_vars['item']['previewlink']; ?>
&nbsp;&nbsp;<span class="gray">(<?php echo $this->_tpl_vars['item']['category']; ?>
&nbsp;<?php echo $this->_tpl_vars['item']['date']; ?>
)</span></dd>
      <?php endforeach; endif; unset($_from); ?>
      <br />
      <b>Resumes</b>
      <?php $_from = smarty_modifier_sortby($this->_tpl_vars['new_resumes'], 'date'); if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['item']):
?>
         <dd><?php echo $this->_tpl_vars['item']['previewlink']; ?>
&nbsp;&nbsp;<span class="gray">(<?php echo $this->_tpl_vars['item']['category']; ?>
&nbsp;<?php echo $this->_tpl_vars['item']['date']; ?>
)</span></dd>
      <?php endforeach; endif; unset($_from); ?>
   </dl>
   </div>
<br />

<div class="rss_footer">
   
   <p><?php echo $this->_tpl_vars['rssurl']; ?>
 WPCareers <?php echo $this->_tpl_vars['credit']; ?>
</p>
</div>

<?php echo $this->_tpl_vars['java']; ?>

<!--end jp_footer-->