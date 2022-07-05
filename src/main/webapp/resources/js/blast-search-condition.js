$(function(){

  //if(!location.href.match(/lang/)){
  //  $("#program").val("blastn");
  //}
  //else{
  //  $("#program").val(location.href.substring(location.href.lastIndexOf("/") + 1, location.href.lastIndexOf("?")));
  //}

  $("#ddbjnew_std_table").addClass('hide');
  $("#ddbjnew_ht_table").addClass('hide');
  $("#ddbjnew_est_table").addClass('hide');
  $("#ddbjnew_other_table").addClass('hide');
  $("#id_refseq_na_rel_rna_div input").attr('disabled', true);
  $("#id_refseq_na_daily_div input").attr('disabled', true);
  $("#id_refseq_na_model_genomic_div input").attr('disabled', true);
  $("#id_refseq_na_model_rna_div input").attr('disabled', true);
  $("#id_refseq_na_div").addClass('hide');
  $("#id_refseq_aa_daily_div input").attr('disabled', true);
  $("#id_refseq_aa_model_div input").attr('disabled', true);
  $("#id_refseq_aa_div").addClass('hide');
  $("#dad_div").addClass('hide');
  $("#dadall_block").addClass('hide');
  $("#dadnew_block").addClass('hide');
  $("#datasets_dadnew").addClass('hide');

  $("#selectdatabase").change(function(){
    $(".table_divsion").addClass('hide');
    var id = $("#selectdatabase option:selected").val();
    switch(id){
      case "ddbjall":
      case "ddbjnew":
        $('#' + id + '_std_table').removeClass('hide');
        $('#' + id + '_ht_table').removeClass('hide');
        $('#' + id + '_est_table').removeClass('hide');
        $('#' + id + '_other_table').removeClass('hide');
        break;
      case "refseq_na":
        $('#id_refseq_na_div').removeClass('hide');
        break;
      default:
        break;
    }
  });

  $('[name=refseq_na_radio]').change(function() {
    $('.refseq_na_area').find('input').attr('disabled', true);
    if ($('#id_refseq_na_rel_genomic').is(':checked')) {
        $('#id_refseq_na_rel_genomic_div').find('input').attr('disabled', false);
    } else if ($('#id_refseq_na_rel_rna').is(':checked')) {
        $('#id_refseq_na_rel_rna_div').find('input').attr('disabled', false);
    } else if ($('#id_refseq_na_daily').is(':checked')) {
        $('#id_refseq_na_daily_div').find('input').attr('disabled', false);
    } else if ($('#id_refseq_na_model_genomic').is(':checked')) {
        $('#id_refseq_na_model_genomic_div').find('input').attr('disabled', false);
    } else if ($('#id_refseq_na_model_rna').is(':checked')) {
        $('#id_refseq_na_model_rna_div').find('input').attr('disabled', false);
    }
  });

  $('[name=refseq_aa_radio]').change(function() {
    $('.refseq_aa_area').find('input').attr('disabled', true);
    if ($('#id_refseq_aa_rel').is(':checked')) {
        $('#id_refseq_aa_rel_div').find('input').attr('disabled', false);
    } else if ($('#id_refseq_aa_daily').is(':checked')) {
        $('#id_refseq_aa_daily_div').find('input').attr('disabled', false);
    } else if ($('#id_refseq_aa_model').is(':checked')) {
        $('#id_refseq_aa_model_div').find('input').attr('disabled', false);
    }
  });

  $('#send_to_blast').click(function(){
    sessionStorage.clear();
    $('.hide input').removeAttr('checked');
  });

  $('#query_clear').click(function(){
    $('[name=up_file]').replaceWith('<INPUT TYPE="file" NAME="up_file" MAXLENGTH="0">');
    $('[name=qseq]').val("");
  });

  //DDBJALL
  $('#ddbjall_std_div_title').click(function(){
    if (this.checked) {
      $('.ddbjall_std_div').attr('checked', 'checked');
    }
    else {
      $('.ddbjall_std_div').removeAttr('checked');
    }
  });

  $('#ddbjall_ht_div_title').click(function(){
    if (this.checked) {
      $('.ddbjall_ht_div').attr('checked', 'checked');
    }
    else {
      $('.ddbjall_ht_div').removeAttr('checked');
    }
  });

  $('#ddbjall_est_div_title').click(function(){
    if (this.checked) {
      $('.ddbjall_est_div').attr('checked', 'checked');
    }
    else {
      $('.ddbjall_est_div').removeAttr('checked');
    }
  });

  $('#ddbjall_other_div_title').click(function(){
    if (this.checked) {
      $('.ddbjall_other_div').attr('checked', 'checked');
    }
    else {
      $('.ddbjall_other_div').removeAttr('checked');
    }
  });

  //DDBJNEW
  $('#ddbjnew_std_div_title').click(function(){
    if (this.checked) {
      $('.ddbjnew_std_div').attr('checked', 'checked');
    }
    else {
      $('.ddbjnew_std_div').removeAttr('checked');
    }
  });

  $('#ddbjnew_ht_div_title').click(function(){
    if (this.checked) {
      $('.ddbjnew_ht_div').attr('checked', 'checked');
    }
    else {
      $('.ddbjnew_ht_div').removeAttr('checked');
    }
  });

  $('#ddbjnew_est_div_title').click(function(){
    if (this.checked) {
      $('.ddbjnew_est_div').attr('checked', 'checked');
    }
    else {
      $('.ddbjnew_est_div').removeAttr('checked');
    }
  });

  $('#ddbjnew_other_div_title').click(function(){
    if (this.checked) {
      $('.ddbjnew_other_div').attr('checked', 'checked');
    }
    else {
      $('.ddbjnew_other_div').removeAttr('checked');
    }
  });

  // RefSeq NA
  $('#refseq_na_genomic_title').click(function(){
    if (this.checked) {
      $('.refseq_na_genomic_div').attr('checked', 'checked');
    }
    else {
      $('.refseq_na_genomic_div').removeAttr('checked');
    }
  });

  $('#refseq_na_rna_title').click(function(){
    if (this.checked) {
      $('.refseq_na_rna_div').attr('checked', 'checked');
    }
    else {
      $('.refseq_na_rna_div').removeAttr('checked');
    }
  });

  $('#refseq_na_model_genomic_title').click(function(){
    if (this.checked) {
      $('.refseq_na_model_genomic_div').attr('checked', 'checked');
    }
    else {
      $('.refseq_na_model_genomic_div').removeAttr('checked');
    }
  });

  $('#refseq_na_model_rna_title').click(function(){
    if (this.checked) {
      $('.refseq_na_model_rna_div').attr('checked', 'checked');
    }
    else {
      $('.refseq_na_model_rna_div').removeAttr('checked');
    }
  });

  //ALL_SELECT
  $('#all_division_select').click(function(){
    var id = $("#selectdatabase option:selected").val();
    switch(id){
      case "ddbjall":
      case "ddbjnew":
        $('[id = ' + id + '_std_table' +']').find('input').attr('checked', 'checked');
        $('[id = ' + id + '_ht_table' +']').find('input').attr('checked', 'checked');
        $('[id = ' + id + '_est_table' +']').find('input').attr('checked', 'checked');
        $('[id = ' + id + '_other_table' +']').find('input').attr('checked', 'checked');
        break;
      case "refseq_na":
        if($('#id_refseq_na_rel_genomic').is(':checked')){
            $('[id = ' + id + '_genomic_table' +']').find('input').attr('checked', 'checked');
        } else if($('#id_refseq_na_rel_rna').is(':checked')){
            $('[id = ' + id + '_rna_table' +']').find('input').attr('checked', 'checked');
        } else if ($('#id_refseq_na_model_genomic').is(':checked')) {
            $('[id = ' + id + '_model_genomic_table' +']').find('input').attr('checked', 'checked');
        } else if ($('#id_refseq_na_model_rna').is(':checked')) {
            $('[id = ' + id + '_model_rna_table' +']').find('input').attr('checked', 'checked');
        }
        break;
      default:
        break;
    }
  });

  //ALL_CLEAR
  $('#all_division_clear').click(function(){
    var id = $("#selectdatabase option:selected").val();
    switch(id){
      case "ddbjall":
      case "ddbjnew":
        $('[id = ' + id + '_std_table' +']').find('input').removeAttr('checked');
        $('[id = ' + id + '_ht_table' +']').find('input').removeAttr('checked');
        $('[id = ' + id + '_est_table' +']').find('input').removeAttr('checked');
        $('[id = ' + id + '_other_table' +']').find('input').removeAttr('checked');
        break;
      case "refseq_na":
        if($('#id_refseq_na_rel_genomic').is(':checked')){
            $('[id = ' + id + '_genomic_table' +']').find('input').removeAttr('checked');
        } else if($('#id_refseq_na_rel_rna').is(':checked')){
            $('[id = ' + id + '_rna_table' +']').find('input').removeAttr('checked');
        } else if ($('#id_refseq_na_model_genomic').is(':checked')) {
            $('[id = ' + id + '_model_genomic_table' +']').find('input').removeAttr('checked');
        } else if ($('#id_refseq_na_model_rna').is(':checked')) {
            $('[id = ' + id + '_model_rna_table' +']').find('input').removeAttr('checked');
        }
        break;
      default:
        break;
    }
  });

  //patent, DAD
  $("input[name='database']:radio").change( function(){
    $('#dad_div').addClass('hide');
    $('#dadall_block').addClass('hide');
    $('#dadnew_block').addClass('hide');
    $('#id_refseq_aa_div').addClass('hide');
    if($('#patent_protein').is(':checked')){
      $('[id = patent_protein_division]').find('input').attr('checked', 'checked');
      $('[id = patent_protein_division]').find('input').attr('disabled', false);
    }
    else{
      $('[id = patent_protein_division]').find('input').removeAttr('checked');
      $('[id = patent_protein_division]').find('input').attr('disabled', true);
      if ($('[id = dadall]:radio').is(':checked')) {
        $('#dad_div').removeClass('hide');
        $('#dadall_block').removeClass('hide');
        $('#datasets_dadall').removeClass('hide');
        $('#datasets_dadnew').addClass('hide');
      } else if ($('[id = dadnew]:radio').is(':checked')) {
        $('#dad_div').removeClass('hide');
        $('#dadnew_block').removeClass('hide');
        $('#datasets_dadall').addClass('hide');
        $('#datasets_dadnew').removeClass('hide');
      } else if ($('[id = refseq_aa]:radio').is(':checked')) {
        $('#id_refseq_aa_div').removeClass('hide');
      }
    }
  });

  // DAD all
  $('#dadall_std_div_title').click(function() {
    if (this.checked) {
      $('.dadall_std_div').attr('checked', 'checked');
    } else {
      $('.dadall_std_div').removeAttr('checked');
    }
  });
  $('#dadall_ht_div_title').click(function() {
    if (this.checked) {
      $('.dadall_ht_div').attr('checked', 'checked');
    } else {
      $('.dadall_ht_div').removeAttr('checked');
    }
  });
  $('#dadall_est_div_title').click(function() {
    if (this.checked) {
      $('.dadall_est_div').attr('checked', 'checked');
    } else {
      $('.dadall_est_div').removeAttr('checked');
    }
  });
  $('#dadall_other_div_title').click(function() {
    if (this.checked) {
      $('.dadall_other_div').attr('checked', 'checked');
    } else {
      $('.dadall_other_div').removeAttr('checked');
    }
  });

  // DAD new
  $('#dadnew_std_div_title').click(function() {
    if (this.checked) {
      $('.dadnew_std_div').attr('checked', 'checked');
    } else {
      $('.dadnew_std_div').removeAttr('checked');
    }
  });
  $('#dadnew_ht_div_title').click(function() {
    if (this.checked) {
      $('.dadnew_ht_div').attr('checked', 'checked');
    } else {
      $('.dadnew_ht_div').removeAttr('checked');
    }
  });
  $('#dadnew_est_div_title').click(function() {
    if (this.checked) {
      $('.dadnew_est_div').attr('checked', 'checked');
    } else {
      $('.dadnew_est_div').removeAttr('checked');
    }
  });
  $('#dadnew_other_div_title').click(function() {
    if (this.checked) {
      $('.dadnew_other_div').attr('checked', 'checked');
    } else {
      $('.dadnew_other_div').removeAttr('checked');
    }
  });

  // RefSeq AA
  $('#refseq_aa_protein_title').click(function(){
    if (this.checked) {
      $('.refseq_aa_protein_div').attr('checked', 'checked');
    }
    else {
      $('.refseq_aa_protein_div').removeAttr('checked');
    }
  });

  $('#refseq_aa_model_title').click(function(){
    if (this.checked) {
      $('.refseq_aa_model_div').attr('checked', 'checked');
    }
    else {
      $('.refseq_aa_model_div').removeAttr('checked');
    }
  });

  // ALL_SELECT (DAD)
  $('#all_dad_division_select').click(function(){
    var id = $("input:radio[name='database']:checked").val();
    switch(id){
      case "dadall":
      case "dadnew":
        $('[id = ' + id + '_std_table' +']').find('input').attr('checked', 'checked');
        $('[id = ' + id + '_ht_table' +']').find('input').attr('checked', 'checked');
        $('[id = ' + id + '_est_table' +']').find('input').attr('checked', 'checked');
        $('[id = ' + id + '_other_table' +']').find('input').attr('checked', 'checked');
        break;
      default:
        break;
    }
  });

  // ALL_CLEAR (DAD)
  $('#all_dad_division_clear').click(function(){
    var id = $("input:radio[name='database']:checked").val();
    switch(id){
      case "dadall":
      case "dadnew":
        $('[id = ' + id + '_std_table' +']').find('input').removeAttr('checked');
        $('[id = ' + id + '_ht_table' +']').find('input').removeAttr('checked');
        $('[id = ' + id + '_est_table' +']').find('input').removeAttr('checked');
        $('[id = ' + id + '_other_table' +']').find('input').removeAttr('checked');
        break;
      default:
        break;
    }
  });
});