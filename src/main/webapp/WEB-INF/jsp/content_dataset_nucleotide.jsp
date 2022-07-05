<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<h2>Data Sets</h2>

<p></p>
<select id="selectdatabase" name="database">
	<option class="ddbjall" value="ddbjall" selected>DDBJ ALL (DDBJ periodical
		release + daily updates)</option>
	<option class="ddbjnew" value="ddbjnew">DDBJ New (DDBJ daily updates)</option>
	<option class="16S_rRNA" value="16S_rRNA">16S rRNA (Prokaryotes)</option>
	<option class="refseq_na" value="refseq_na">RefSeq NA</option>
</select>
<INPUT id="all_division_select" TYPE="button" VALUE="select-all">
<INPUT id="all_division_clear" TYPE="button" VALUE="clear-all">
<!-- DDBJALL -->
<p></p>
<table id="ddbjall_std_table" class="table_divsion">
	<tr>
		<td colspan="5"><input id="ddbjall_std_div_title" type="checkbox" name="div_class" value="standard" checked />
                        <span style="font-size: 110%; font-weight: bold;">Standard divisions</span></td>
	</tr>
	<tr>
		<td><input class="ddbjall_std_div" type="checkbox" name="division" value="hum" checked />Human</td>
		<td><input class="ddbjall_std_div" type="checkbox" name="division" value="pri" checked />Primates</td>
		<td><input class="ddbjall_std_div" type="checkbox" name="division" value="rod" checked />Rodents</td>
		<td><input class="ddbjall_std_div" type="checkbox" name="division" value="mam" checked />Mammals</td>
		<td><input class="ddbjall_std_div" type="checkbox" name="division" value="vrt" checked />Vertebrates</td>
	</tr>
	<tr>
		<td><input class="ddbjall_std_div" type="checkbox" name="division" value="inv" checked />Invertebrates</td>
		<td><input class="ddbjall_std_div" type="checkbox" name="division" value="pln" checked />Plants</td>
		<td><input class="ddbjall_std_div" type="checkbox" name="division" value="bct" checked />Bacteria</td>
		<td><input class="ddbjall_std_div" type="checkbox" name="division" value="vrl" checked />Viruses</td>
		<td><input class="ddbjall_std_div" type="checkbox" name="division" value="phg" checked />Phages</td>
	</tr>
	<tr>
		<td><input class="ddbjall_std_div" type="checkbox" name="division" value="syn" />Synthetic DNAs</td>
		<td><input class="ddbjall_std_div" type="checkbox" name="division" value="env" />ENV</td>
        <td></td>
        <td></td>
        <td></td>
	</tr>
</table>

<table id="ddbjall_ht_table" class="table_divsion">
	<tr>
		<td colspan="2"><input id="ddbjall_ht_div_title" type="checkbox" name="div_class" value="high_throughput">
 <span style="font-size: 110%; font-weight: bold;">High throughput divisions</span></td>
	</tr>
	<tr>
		<td><input class="ddbjall_ht_div" type="checkbox" name="division" value="htg">HTG</td>
		<td><input class="ddbjall_ht_div" type="checkbox" name="division" value="htc">HTC</td>
	</tr>
</table>

<table id="ddbjall_est_table" class="table_divsion">
	<tr>
		<td colspan="5"><input id="ddbjall_est_div_title" type="checkbox" name="div_class" value="est">
 <span style="font-size: 110%; font-weight: bold;">EST divisions</span></td>
	</tr>
	<tr>
		<td><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_atha">A.thaliana</td>
		<td><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_btra">B.taurus</td>
		<td><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_cele">C.elegans</td>
		<td><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_cint">C.intestinalis</td>
		<td><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_crei">C.reinhardtii</td>
	</tr>
	<tr>
		<td><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_ddis">D.discoideum</td>
		<td><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_dmel">D.melanogaster</td>
		<td><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_drer">D.rerio</td>
		<td><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_ggal">G.gallus</td>
		<td><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_gmax">G.max</td>
	</tr>
	<TR>
		<td><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_hum">H.sapiens</td>
		<td><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_hvul">H.vulgare</td>
		<td><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_mous">M.musculus</td>
		<td><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_mtru">M.truncatula</td>
		<td><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_osat">O.sativa</td>
	</tr>
	<tr>
		<td><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_rnor">R.norvegicus</td>
		<td><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_slyc">S.lycopersicum</td>
		<td><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_taes">T.aestivum</td>
		<td><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_xlae">X.laevis</td>
		<td><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_xtro">X.tropicalis</td>
	</tr>
	<tr>
		<td><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_zmay">Z.mays</td>
		<td></td>
		<td colspan="3"><INPUT class="ddbjall_est_div" TYPE="checkbox" NAME="division" VALUE="est_rest">Others</td>
	</tr>
</table>

<table id="ddbjall_other_table" class="table_divsion">
	<tr>
		<td COLSPAN="4"><input id="ddbjall_other_div_title" type="checkbox" name="div_class" value="other">
 <span style="font-size: 110%; font-weight: bold;">Other divisions</span></td>
	</tr>
	<tr>
		<td><INPUT class="ddbjall_other_div" TYPE="checkbox" NAME="division" VALUE="pat">Patent</td>
		<td><INPUT class="ddbjall_other_div" TYPE="checkbox" NAME="division" VALUE="una">Unannotated Seq</td>
		<td><INPUT class="ddbjall_other_div" TYPE="checkbox" NAME="division" VALUE="gss">GSS</td>
		<td><INPUT class="ddbjall_other_div" TYPE="checkbox" NAME="division" VALUE="sts">STS</td>
	</tr>
</table>

<!-- DDBJNEW -->
<p></p>
<table id="ddbjnew_std_table" class="table_divsion">
	<tr>
		<td colspan="5"><input id="ddbjnew_std_div_title" type="checkbox" name="div_class" value="standard" checked />
						<span style="font-size: 110%; font-weight: bold;">Standard divisions</span></td>
	</tr>
	<tr>
		<td><input class="ddbjnew_std_div" type="checkbox" name="division" value="new_hum" checked />Human</td>
		<td><input class="ddbjnew_std_div" type="checkbox" name="division" value="new_pri" checked />Primates</td>
		<td><input class="ddbjnew_std_div" type="checkbox" name="division" value="new_rod" checked />Rodents</td>
		<td><input class="ddbjnew_std_div" type="checkbox" name="division" value="new_mam" checked />Mammals</td>
		<td><input class="ddbjnew_std_div" type="checkbox" name="division" value="new_vrt" checked />Vertebrates</td>
	</tr>
	<tr>
		<td><input class="ddbjnew_std_div" type="checkbox" name="division" value="new_inv" checked />Invertebrates</td>
		<td><input class="ddbjnew_std_div" type="checkbox" name="division" value="new_pln" checked />Plants</td>
		<td><input class="ddbjnew_std_div" type="checkbox" name="division" value="new_bct" checked />Bacteria</td>
		<td><input class="ddbjnew_std_div" type="checkbox" name="division" value="new_vrl" checked />Viruses</td>
		<td><input class="ddbjnew_std_div" type="checkbox" name="division" value="new_phg" checked />Phages</td>
	</tr>
	<tr>
		<td><input class="ddbjnew_std_div" type="checkbox" name="division" value="new_syn" />Synthetic DNAs</td>
		<td><input class="ddbjnew_std_div" type="checkbox" name="division" value="new_env" />ENV</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
</table>

<table id="ddbjnew_ht_table" class="table_divsion">
	<tr>
		<td colspan="2"><input id="ddbjnew_ht_div_title" type="checkbox" name="div_class" value="high_throughput">
		<span style="font-size: 110%; font-weight: bold;">High throughput divisions</span></td>
	</tr>
	<tr>
		<td><input class="ddbjnew_ht_div" type="checkbox" name="division" value="new_htg">HTG</td>
		<td><input class="ddbjnew_ht_div" type="checkbox" name="division" value="new_htc">HTC</td>
	</tr>
</table>

<table id="ddbjnew_est_table" class="table_divsion">
	<tr>
		<td colspan="5"><input id="ddbjnew_est_div_title" type="checkbox" name="div_class" value="est">
		<span style="font-size: 110%; font-weight: bold;">EST divisions</span></td>
	</tr>
	<tr>
		<td><INPUT class="ddbjnew_est_div" TYPE="checkbox" NAME="division" VALUE="new_est_atha">A.thaliana</td>
		<td><INPUT class="ddbjnew_est_div" TYPE="checkbox" NAME="division" VALUE="new_est_btra">B.taurus</td>
		<td><INPUT class="ddbjnew_est_div" TYPE="checkbox" NAME="division" VALUE="new_est_cele">C.elegans</td>
		<td><INPUT class="ddbjnew_est_div" TYPE="checkbox" NAME="division" VALUE="new_est_cint">C.intestinalis</td>
		<td><INPUT class="ddbjnew_est_div" TYPE="checkbox" NAME="division" VALUE="new_est_crei">C.reinhardtii</td>
	</tr>
	<tr>
		<td><INPUT class="ddbjnew_est_div" TYPE="checkbox" NAME="division" VALUE="new_est_ddis">D.discoideum</td>
		<td><INPUT class="ddbjnew_est_div" TYPE="checkbox" NAME="division" VALUE="new_est_dmel">D.melanogaster</td>
		<td><INPUT class="ddbjnew_est_div" TYPE="checkbox" NAME="division" VALUE="new_est_drer">D.rerio</td>
		<td><INPUT class="ddbjnew_est_div" TYPE="checkbox" NAME="division" VALUE="new_est_ggal">G.gallus</td>
		<td><INPUT class="ddbjnew_est_div" TYPE="checkbox" NAME="division" VALUE="new_est_gmax">G.max</td>
	</tr>
	<TR>
		<td><INPUT class="ddbjnew_est_div" TYPE="checkbox" NAME="division" VALUE="new_est_hum">H.sapiens</td>
		<td><INPUT class="ddbjnew_est_div" TYPE="checkbox" NAME="division" VALUE="new_est_hvul">H.vulgare</td>
		<td><INPUT class="ddbjnew_est_div" TYPE="checkbox" NAME="division" VALUE="new_est_mous">M.musculus</td>
		<td><INPUT class="ddbjnew_est_div" TYPE="checkbox" NAME="division" VALUE="new_est_mtru">M.truncatula</td>
		<td><INPUT class="ddbjnew_est_div" TYPE="checkbox" NAME="division" VALUE="new_est_osat">O.sativa</td>
	</tr>
	<tr>
		<td><INPUT class="ddbjnew_est_div" TYPE="checkbox" NAME="division" VALUE="new_est_rnor">R.norvegicus</td>
		<td><INPUT class="ddbjnew_est_div" TYPE="checkbox" NAME="division" VALUE="new_est_slyc">S.lycopersicum</td>
		<td><INPUT class="ddbjnew_est_div" TYPE="checkbox" NAME="division" VALUE="new_est_taes">T.aestivum</td>
		<td><INPUT class="ddbjnew_est_div" TYPE="checkbox" NAME="division" VALUE="new_est_xlae">X.laevis</td>
		<td><INPUT class="ddbjnew_est_div" TYPE="checkbox" NAME="division" VALUE="new_est_xtro">X.tropicalis</td>
	</tr>
	<tr>
		<td><INPUT class="ddbjnew_est_div" TYPE="checkbox" NAME="division" VALUE="new_est_zmay">Z.mays</td>
		<td></td>
		<td colspan="3"><INPUT class="est_div" TYPE="checkbox" NAME="division" VALUE="new_est_rest">Others</td>
	</tr>
</table>

<table id="ddbjnew_other_table" class="table_divsion">
	<tr>
		<td COLSPAN="4"><input id="ddbjnew_other_div_title" type="checkbox" name="div_class" value="other">
		<span style="font-size: 110%; font-weight: bold;">Other divisions</span></td>
	</tr>
	<tr>
		<td><INPUT class="ddbjnew_other_div" TYPE="checkbox" NAME="division" VALUE="new_pat">Patent</td>
		<td><INPUT class="ddbjnew_other_div" TYPE="checkbox" NAME="division" VALUE="new_una">Unannotated Seq</td>
		<td><INPUT class="ddbjnew_other_div" TYPE="checkbox" NAME="division" VALUE="new_gss">GSS</td>
		<td><INPUT class="ddbjnew_other_div" TYPE="checkbox" NAME="division" VALUE="new_sts">STS</td>
	</tr>
</table>

<div id="id_refseq_na_div" class="table_divsion">
	<ul>
		<li>
			<div>
				<input type="radio" name="refseq_na_radio" value="refseq_na_rel_genomic" id="id_refseq_na_rel_genomic" checked="checked">
				<label for="id_refseq_na_rel_genomic">Periodical Release (Genomic)</label>
			</div>
			<div id="id_refseq_na_rel_genomic_div" class="refseq_na_area" style="margin-left: 10px;">
<table id="refseq_na_genomic_table">
	<tr>
		<td colspan="5"><input id="refseq_na_genomic_title" type="checkbox" name="div_class" value="refseq_genomic" />
                        <span style="font-size: 110%; font-weight: bold;">Genomic</span></td>
	</tr>
	<tr>
		<td><input class="refseq_na_genomic_div" type="checkbox" name="division" value="refseq-genomic-fungi">Fungi</td>
		<td><input class="refseq_na_genomic_div" type="checkbox" name="division" value="refseq-genomic-invertebrate">Invertebrate</td>
		<td><input class="refseq_na_genomic_div" type="checkbox" name="division" value="refseq-genomic-microbial">Microbial</td>
		<td><input class="refseq_na_genomic_div" type="checkbox" name="division" value="refseq-genomic-mitochondrion">Mitochondrion</td>
		<td><input class="refseq_na_genomic_div" type="checkbox" name="division" value="refseq-genomic-plant">Plant</td>
	</tr>
	<tr>
		<td><input class="refseq_na_genomic_div" type="checkbox" name="division" value="refseq-genomic-plasmid">Plasmid</td>
		<td><input class="refseq_na_genomic_div" type="checkbox" name="division" value="refseq-genomic-plastid">Plastid</td>
		<td><input class="refseq_na_genomic_div" type="checkbox" name="division" value="refseq-genomic-protozoa">Protozoa</td>
		<td><input class="refseq_na_genomic_div" type="checkbox" name="division" value="refseq-genomic-vertebrate_mammalian">Vertebrate Mammalian</td>
		<td><input class="refseq_na_genomic_div" type="checkbox" name="division" value="refseq-genomic-vertebrate_other">Vertebrate Other</td>
	</tr>
	<tr>
		<td><input class="refseq_na_genomic_div" type="checkbox" name="division" value="refseq-genomic-viral">Viral</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
</table>
			</div>
		</li>

		<li>
			<div>
				<input type="radio" name="refseq_na_radio" value="refseq_na_rel_rna" id="id_refseq_na_rel_rna">
				<label for="id_refseq_na_rel_rna">Periodical Release (RNA)</label>
			</div>
			<div id="id_refseq_na_rel_rna_div" class="refseq_na_area" style="margin-left: 10px;">
<table id="refseq_na_rna_table">
	<tr>
		<td colspan="5"><input id="refseq_na_rna_title" type="checkbox" name="div_class" value="refseq_rna" />
                        <span style="font-size: 110%; font-weight: bold;">RNA</span></td>
	</tr>
	<tr>
		<td><input class="refseq_na_rna_div" type="checkbox" name="division" value="refseq-rna-fungi">Fungi</td>
		<td><input class="refseq_na_rna_div" type="checkbox" name="division" value="refseq-rna-invertebrate">Invertebrate</td>
		<td><input class="refseq_na_rna_div" type="checkbox" name="division" value="refseq-rna-microbial">Microbial</td>
		<td><input class="refseq_na_rna_div" type="checkbox" name="division" value="refseq-rna-mitochondrion">Mitochondrion</td>
		<td><input class="refseq_na_rna_div" type="checkbox" name="division" value="refseq-rna-plant">Plant</td>
	</tr>
	<tr>
		<td><input class="refseq_na_rna_div" type="checkbox" name="division" value="refseq-rna-plasmid">Plasmid</td>
		<td><input class="refseq_na_rna_div" type="checkbox" name="division" value="refseq-rna-plastid">Plastid</td>
		<td><input class="refseq_na_rna_div" type="checkbox" name="division" value="refseq-rna-protozoa">Protozoa</td>
		<td><input class="refseq_na_rna_div" type="checkbox" name="division" value="refseq-rna-vertebrate_mammalian">Vertebrate Mammalian</td>
		<td><input class="refseq_na_rna_div" type="checkbox" name="division" value="refseq-rna-vertebrate_other">Vertebrate Other</td>
	</tr>
	<tr>
		<td><input class="refseq_na_rna_div" type="checkbox" name="division" value="refseq-rna-viral">Viral</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
</table>
			</div>
		</li>

		<li>
			<div>
				<input type="radio" name="refseq_na_radio" value="refseq_na_daily" id="id_refseq_na_daily">
				<label for="id_refseq_na_daily">Daily Updates</label>
			</div>
			<div id="id_refseq_na_daily_div" class="refseq_na_area" style="margin: 10px;">
				<input type="hidden" name="division" value="refseq-na-daily">
			</div>
		</li>

		<li>
			<div>
				<input type="radio" name="refseq_na_radio" value="refseq_na_model_genomic" id="id_refseq_na_model_genomic">
				<label for="id_refseq_na_model_genomic">Model Species (Genomic)</label>
			</div>
			<div id="id_refseq_na_model_genomic_div" class="refseq_na_area" style="margin-left: 10px;">
<table id="refseq_na_model_genomic_table">
	<tr>
		<td colspan="5"><input id="refseq_na_model_genomic_title" type="checkbox" name="div_class" value="refseq_model" />
                        <span style="font-size: 110%; font-weight: bold;">Genomic</span></td>
	</tr>
	<tr>
		<td><input class="refseq_na_model_genomic_div" type="checkbox" name="division" value="refseq-model-genomic-H_sapiens">H. sapiens</td>
		<td></td>
	</tr>
</table>
			</div>
		</li>

		<li>
			<div>
				<input type="radio" name="refseq_na_radio" value="refseq_na_model_rna" id="id_refseq_na_model_rna">
				<label for="id_refseq_na_model_rna">Model Species (RNA)</label>
			</div>
			<div id="id_refseq_na_model_rna_div" class="refseq_na_area" style="margin-left: 10px;">
<table id="refseq_na_model_rna_table">
	<tr>
		<td colspan="5"><input id="refseq_na_model_rna_title" type="checkbox" name="div_class" value="refseq_model" />
                        <span style="font-size: 110%; font-weight: bold;">RNA</span></td>
	</tr>
	<tr>
		<td><input class="refseq_na_model_rna_div" type="checkbox" name="division" value="refseq-model-rna-B_taurus">B. taurus</td>
		<td><input class="refseq_na_model_rna_div" type="checkbox" name="division" value="refseq-model-rna-D_rerio">D. rerio</td>
		<td><input class="refseq_na_model_rna_div" type="checkbox" name="division" value="refseq-model-rna-H_sapiens">H. sapiens</td>
		<td><input class="refseq_na_model_rna_div" type="checkbox" name="division" value="refseq-model-rna-M_musculus">M. musculus</td>
	</tr>
	<tr>
		<td><input class="refseq_na_model_rna_div" type="checkbox" name="division" value="refseq-model-rna-R_norvegicus">R. norvegicus</td>
		<td><input class="refseq_na_model_rna_div" type="checkbox" name="division" value="refseq-model-rna-X_tropicalis">X. tropicalis</td>
		<td></td>
		<td></td>
	</tr>
</table>
			</div>
		</li>
	</ul>
</div>


<!--
			<table width="500">
				<tr>
					<td width="350"><ul>
							<li><input type="radio" name="database" value="ddbjfull"
								onclick="append_children('full','ja')">DDBJ/EMBL/GenBank
								全配列データ (DDBJ定期リリース+新着データ)
							<li><input id="ddbjall" type="radio" name="database"
								value="ddbjall" onclick="append_children('all','ja')">古典的区分の配列データ
								(DDBJ定期リリース+新着データ。 但し以下を除く;
								PAT,ENV,EST,STS,GSS,HTG,HTC,UNA,SYN,TSA）
							<li><input type="radio" name="database" value="ddbjnew"
								onclick="append_children('new','ja')">DDBJ新着データ
							<li><input type="radio" name="database" value="pat"
								onclick="append_children('pat','ja')">PAT:
								特許に登録された塩基配列データ
							<li><input type="radio" name="database" value="env"
								onclick="append_children('env','ja')">ENV:
								環境上のサンプルに由来した配列
							<li><input type="radio" name="database" value="gss"
								onclick="append_children('gss','ja')">GSS: short single
								passのゲノム配列データ
							<li><input type="radio" name="database" value="htc"
								onclick="append_children('htc','ja')">HTC:
								EST以外のcDNA配列プロジェクトに由来する配列データ
							<li><input type="radio" name="database" value="htg"
								onclick="append_children('htg','ja')">HTG:
								ゲノムプロジェクトに由来する配列データ
							<li><input type="radio" name="database" value="sts"
								onclick="append_children('sts','ja')">STS:
								ゲノムシーケンシングのタグとなる配列データ
							<li><input type="radio" name="database" value="est"
								onclick="append_children('est','ja')">EST: Expressed
								sequence tag
							<li><input type="radio" name="database" value="other"
								onclick="append_children('other','ja')">その他
						</ul></td>
					<td><ul id="divisions"></ul></td>
				</tr>
			</table>

			<input id='hiddendiv' type='hidden' name='division' value='ddbjall'>
	        -->
