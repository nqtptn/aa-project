<?php /* Smarty version 2.6.25, created on 2012-06-25 16:59:27
         compiled from sidebar.tpl */ ?>

<div class="columns-4">
	   <table class="siderbarTable col4" style="background: url(<?php echo $this->_tpl_vars['plugin_url']; ?>
/images/content.jpg) repeat-y;"><tbody>
      <tr><td><h2><?php echo $this->_tpl_vars['main_link']; ?>
</h2><HR /></td></tr>
      <tr><td valign="top"><h3>Post your Job/Resume</h3><br /></td></tr>
      <tr valign="top"><td>
            <p class="tight strong"><?php echo $this->_tpl_vars['lang']['J_EMPLOYERS']; ?>
</p>
            <ul><li><a href="<?php echo $this->_tpl_vars['job_link']; ?>
">Post Jobs or Internships</a></li></ul>
            <p class="tight strong"><?php echo $this->_tpl_vars['lang']['J_SEEKER']; ?>
</p>
            <ul><li><a href="<?php echo $this->_tpl_vars['resume_link']; ?>
"><?php echo $this->_tpl_vars['lang']['J_ADD_RESUME']; ?>
</a></li></ul>
            <p>&nbsp;</p>
            <div class="jp_search"> 
               <h3><?php echo $this->_tpl_vars['lang']['J_SEARCH']; ?>
</h3>
               <form method="post" id="jp_search" name="jp_search" action="<?php echo $this->_tpl_vars['search_link']; ?>
">
               <table>
                  <tr>
                     <td>
                     <input type="text" name="search_terms" size="23" value="<?php echo $this->_tpl_vars['search_terms']; ?>
">
                     <input type="hidden" name="op" value="search">
                     <input type="submit" value="Search">&nbsp;<?php echo $this->_tpl_vars['jp_advanced']; ?>

                     </td>
                  </tr>
                  <tr>
                     <td align="left">
                     jobs:&nbsp;<input type="radio" value="jobs" name="type" checked>&nbsp;&nbsp;
                     Resum:&nbsp;<input type="radio" value="resume" name="type">&nbsp;&nbsp;
                     All:&nbsp;<input type="radio" value="all" name="type">&nbsp;&nbsp;
                     </td>   
                  </tr>
               </table>
               </form>
            </div>
      </td></tr>
      <tr>
         <td>
         Post your job or resume today.<br> or start searching for jobs!
         <p>
         There is no charge for postings.<br>Your posting will remain online for 360 days.<br />
         As outlined in the Terms of Service, we reserve the right to accept or decline any job posting.<br />
         Postings which are approved are generally processed within 1-2 business days.
         </p>
         <p>Thank you for posting with us. We look forward to being a part of your company's staffing solution.</p>
         </td>
      </tr>
   </tbody></table>
</div><!--columns-4-->