<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<h2>Data Sets</h2>
<table width="500">
  <tr>
	<%-- <td width="350"><ul> --%>
	<td><ul>
		<li><input id="uniprot_all" type="radio" name="database"
				   value="uniprot_all" checked>UniProt (Swiss-Prot + TrEMBL)
		<li><input id="uniprot_sprot" type="radio" name="database"
				   value="uniprot_sprot" >UniProt (Swiss-Prot)
		<li><input id="uniprot_trembl" type="radio" name="database"
				   value="uniprot_trembl" >UniProt (TrEMBL)
		<li><input id="patent_protein" type="radio" name="database"
				   value="patent_protein" >Patent
			<ul id="patent_protein_division" ><li>
				<input type="checkbox" name="division" value="jpop" disabled >JPO
				<input type="checkbox" name="division" value="kipop" disabled >KIPO
				<input type="checkbox" name="division" value="usptop" disabled >USPTO
				<input type="checkbox" name="division" value="epop" disabled >EPO
			</li></ul>
		</li>
		<li><input id="dadall" type="radio" name="database" value="dadall">DAD (periodical release + daily updates)</li>
		<li><input id="dadnew" type="radio" name="database" value="dadnew">DAD (daily updates)</li>
		<li><input id="refseq_aa" type="radio" name="database" value="refseq_aa">RefSeq AA</li>
	</ul></td>
	<%-- <td><ul id="divisions"></ul></td> --%>
  </tr>
</table>

<div id="dad_div">
	<div>
		<span id="datasets_dadall" style="font-size: 110%; font-weight: bold;">DAD (periodical release + daily updates)</span>
		<span id="datasets_dadnew" style="font-size: 110%; font-weight: bold;">DAD (daily updates)</span>
		<INPUT id="all_dad_division_select" TYPE="button" VALUE="select-all">
		<INPUT id="all_dad_division_clear" TYPE="button" VALUE="clear-all">
	</div>
	<p></p>

	<!-- DAD all -->
	<div id="dadall_block">
		<table id="dadall_std_table" class="table_divsion">
			<tr>
				<td colspan="5"><input id="dadall_std_div_title" type="checkbox" name="div_class" value="standard" checked />
					<span style="font-size: 110%; font-weight: bold;">Standard divisions</span></td>
			</tr>
			<tr>
				<td><input class="dadall_std_div" type="checkbox" name="division" value="dad_hum" checked />Human</td>
				<td><input class="dadall_std_div" type="checkbox" name="division" value="dad_pri" checked />Primates</td>
				<td><input class="dadall_std_div" type="checkbox" name="division" value="dad_rod" checked />Rodents</td>
				<td><input class="dadall_std_div" type="checkbox" name="division" value="dad_mam" checked />Mammals</td>
				<td><input class="dadall_std_div" type="checkbox" name="division" value="dad_vrt" checked />Vertebrates</td>
			</tr>
			<tr>
				<td><input class="dadall_std_div" type="checkbox" name="division" value="dad_inv" checked />Invertebrates</td>
				<td><input class="dadall_std_div" type="checkbox" name="division" value="dad_pln" checked />Plants</td>
				<td><input class="dadall_std_div" type="checkbox" name="division" value="dad_bct" checked />Bacteria</td>
				<td><input class="dadall_std_div" type="checkbox" name="division" value="dad_vrl" checked />Viruses</td>
				<td><input class="dadall_std_div" type="checkbox" name="division" value="dad_phg" checked />Phages</td>
			</tr>
			<tr>
				<td><input class="dadall_std_div" type="checkbox" name="division" value="dad_syn" />Synthetic DNAs</td>
				<td><input class="dadall_std_div" type="checkbox" name="division" value="dad_env" />ENV</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>

		<table id="dadall_ht_table" class="table_divsion">
			<tr>
				<td colspan="2"><input id="dadall_ht_div_title" type="checkbox" name="div_class" value="high_throughput">
					<span style="font-size: 110%; font-weight: bold;">High throughput divisions</span></td>
			</tr>
			<tr>
				<td><input class="dadall_ht_div" type="checkbox" name="division" value="dad_htg">HTG</td>
				<td><input class="dadall_ht_div" type="checkbox" name="division" value="dad_htc">HTC</td>
			</tr>
		</table>

		<table id="dadall_est_table" class="table_divsion">
			<tr>
				<td colspan="5"><input id="dadall_est_div_title" type="checkbox" name="div_class" value="est">
					<span style="font-size: 110%; font-weight: bold;">EST divisions</span></td>
			</tr>
			<tr>
				<td><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_atha">A.thaliana</td>
				<td><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_btra">B.taurus</td>
				<td><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_cele">C.elegans</td>
				<td><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_cint">C.intestinalis</td>
				<td><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_crei">C.reinhardtii</td>
			</tr>
			<tr>
				<td><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_ddis">D.discoideum</td>
				<td><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_dmel">D.melanogaster</td>
				<td><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_drer">D.rerio</td>
				<td><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_ggal">G.gallus</td>
				<td><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_gmax">G.max</td>
			</tr>
			<TR>
				<td><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_hum">H.sapiens</td>
				<td><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_hvul">H.vulgare</td>
				<td><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_mous">M.musculus</td>
				<td><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_mtru">M.truncatula</td>
				<td><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_osat">O.sativa</td>
			</tr>
			<tr>
				<td><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_rnor">R.norvegicus</td>
				<td><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_slyc">S.lycopersicum</td>
				<td><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_taes">T.aestivum</td>
				<td><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_xlae">X.laevis</td>
				<td><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_xtro">X.tropicalis</td>
			</tr>
			<tr>
				<td><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_zmay">Z.mays</td>
				<td></td>
				<td colspan="3"><INPUT class="dadall_est_div" TYPE="checkbox" NAME="division" VALUE="dad_est_rest">Others</td>
			</tr>
		</table>

		<table id="dadall_other_table" class="table_divsion">
			<tr>
				<td COLSPAN="4"><input id="dadall_other_div_title" type="checkbox" name="div_class" value="other">
					<span style="font-size: 110%; font-weight: bold;">Other divisions</span></td>
			</tr>
			<tr>
				<td><INPUT class="dadall_other_div" TYPE="checkbox" NAME="division" VALUE="dad_pat">Patent</td>
				<td><INPUT class="dadall_other_div" TYPE="checkbox" NAME="division" VALUE="dad_una">Unannotated Seq</td>
				<td><INPUT class="dadall_other_div" TYPE="checkbox" NAME="division" VALUE="dad_gss">GSS</td>
				<td><INPUT class="dadall_other_div" TYPE="checkbox" NAME="division" VALUE="dad_sts">STS</td>
			</tr>
		</table>
	</div>

	<!-- DAD new -->
	<div id="dadnew_block">
		<table id="dadnew_std_table" class="table_divsion">
			<tr>
				<td colspan="5"><input id="dadnew_std_div_title" type="checkbox" name="div_class" value="standard" checked />
					<span style="font-size: 110%; font-weight: bold;">Standard divisions</span></td>
			</tr>
			<tr>
				<td><input class="dadnew_std_div" type="checkbox" name="division" value="dad_new_hum" checked />Human</td>
				<td><input class="dadnew_std_div" type="checkbox" name="division" value="dad_new_pri" checked />Primates</td>
				<td><input class="dadnew_std_div" type="checkbox" name="division" value="dad_new_rod" checked />Rodents</td>
				<td><input class="dadnew_std_div" type="checkbox" name="division" value="dad_new_mam" checked />Mammals</td>
				<td><input class="dadnew_std_div" type="checkbox" name="division" value="dad_new_vrt" checked />Vertebrates</td>
			</tr>
			<tr>
				<td><input class="dadnew_std_div" type="checkbox" name="division" value="dad_new_inv" checked />Invertebrates</td>
				<td><input class="dadnew_std_div" type="checkbox" name="division" value="dad_new_pln" checked />Plants</td>
				<td><input class="dadnew_std_div" type="checkbox" name="division" value="dad_new_bct" checked />Bacteria</td>
				<td><input class="dadnew_std_div" type="checkbox" name="division" value="dad_new_vrl" checked />Viruses</td>
				<td><input class="dadnew_std_div" type="checkbox" name="division" value="dad_new_phg" checked />Phages</td>
			</tr>
			<tr>
				<td><input class="dadnew_std_div" type="checkbox" name="division" value="dad_new_syn" />Synthetic DNAs</td>
				<td><input class="dadnew_std_div" type="checkbox" name="division" value="dad_new_env" />ENV</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>

		<table id="dadnew_ht_table" class="table_divsion">
			<tr>
				<td colspan="2"><input id="dadnew_ht_div_title" type="checkbox" name="div_class" value="high_throughput">
					<span style="font-size: 110%; font-weight: bold;">High throughput divisions</span></td>
			</tr>
			<tr>
				<td><input class="dadnew_ht_div" type="checkbox" name="division" value="dad_new_htg">HTG</td>
				<td><input class="dadnew_ht_div" type="checkbox" name="division" value="dad_new_htc">HTC</td>
			</tr>
		</table>

		<table id="dadnew_est_table" class="table_divsion">
			<tr>
				<td colspan="5"><input id="dadnew_est_div_title" type="checkbox" name="div_class" value="est">
					<span style="font-size: 110%; font-weight: bold;">EST divisions</span></td>
			</tr>
			<tr>
				<td><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_atha">A.thaliana</td>
				<td><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_btra">B.taurus</td>
				<td><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_cele">C.elegans</td>
				<td><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_cint">C.intestinalis</td>
				<td><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_crei">C.reinhardtii</td>
			</tr>
			<tr>
				<td><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_ddis">D.discoideum</td>
				<td><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_dmel">D.melanogaster</td>
				<td><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_drer">D.rerio</td>
				<td><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_ggal">G.gallus</td>
				<td><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_gmax">G.max</td>
			</tr>
			<TR>
				<td><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_hum">H.sapiens</td>
				<td><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_hvul">H.vulgare</td>
				<td><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_mous">M.musculus</td>
				<td><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_mtru">M.truncatula</td>
				<td><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_osat">O.sativa</td>
			</tr>
			<tr>
				<td><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_rnor">R.norvegicus</td>
				<td><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_slyc">S.lycopersicum</td>
				<td><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_taes">T.aestivum</td>
				<td><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_xlae">X.laevis</td>
				<td><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_xtro">X.tropicalis</td>
			</tr>
			<tr>
				<td><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_zmay">Z.mays</td>
				<td></td>
				<td colspan="3"><INPUT class="dadnew_est_div" TYPE="checkbox" NAME="division" value="dad_new_est_rest">Others</td>
			</tr>
		</table>

		<table id="dadnew_other_table" class="table_divsion">
			<tr>
				<td COLSPAN="4"><input id="dadnew_other_div_title" type="checkbox" name="div_class" value="other">
					<span style="font-size: 110%; font-weight: bold;">Other divisions</span></td>
			</tr>
			<tr>
				<td><INPUT class="dadnew_other_div" TYPE="checkbox" NAME="division" value="dad_new_pat">Patent</td>
				<td><INPUT class="dadnew_other_div" TYPE="checkbox" NAME="division" value="dad_new_una">Unannotated Seq</td>
				<td><INPUT class="dadnew_other_div" TYPE="checkbox" NAME="division" value="dad_new_gss">GSS</td>
				<td><INPUT class="dadnew_other_div" TYPE="checkbox" NAME="division" value="dad_new_sts">STS</td>
			</tr>
		</table>
	</div>

</div>

<div id="id_refseq_aa_div" class="table_divsion">
	<ul>
		<li>
			<div>
				<input type="radio" name="refseq_aa_radio" value="refseq_aa_rel" id="id_refseq_aa_rel" checked="checked">
				<label for="id_refseq_aa_rel">Periodical Release</label>
			</div>
			<div id="id_refseq_aa_rel_div" class="refseq_aa_area" style="margin-left: 10px;">
<table id="refseq_aa_protein_table">
	<tr>
		<td colspan="5"><input id="refseq_aa_protein_title" type="checkbox" name="div_class" value="refseq_protein" />
                        <span style="font-size: 110%; font-weight: bold;">Protein</span></td>
	</tr>
	<tr>
		<td><input class="refseq_aa_protein_div" type="checkbox" name="division" value="refseq-protein-fungi">Fungi</td>
		<td><input class="refseq_aa_protein_div" type="checkbox" name="division" value="refseq-protein-invertebrate">Invertebrate</td>
		<td><input class="refseq_aa_protein_div" type="checkbox" name="division" value="refseq-protein-microbial">Microbial</td>
		<td><input class="refseq_aa_protein_div" type="checkbox" name="division" value="refseq-protein-mitochondrion">Mitochondrion</td>
		<td><input class="refseq_aa_protein_div" type="checkbox" name="division" value="refseq-protein-plant">Plant</td>
	</tr>
	<tr>
		<td><input class="refseq_aa_protein_div" type="checkbox" name="division" value="refseq-protein-plasmid">Plasmid</td>
		<td><input class="refseq_aa_protein_div" type="checkbox" name="division" value="refseq-protein-plastid">Plastid</td>
		<td><input class="refseq_aa_protein_div" type="checkbox" name="division" value="refseq-protein-protozoa">Protozoa</td>
		<td><input class="refseq_aa_protein_div" type="checkbox" name="division" value="refseq-protein-vertebrate_mammalian">Vertebrate Mammalian</td>
		<td><input class="refseq_aa_protein_div" type="checkbox" name="division" value="refseq-protein-vertebrate_other">Vertebrate Other</td>
	</tr>
	<tr>
		<td><input class="refseq_aa_protein_div" type="checkbox" name="division" value="refseq-protein-viral">Viral</td>
		<td>
		<td>
		<td>
		<td>
	</tr>
</table>
			</div>
		</li>

		<li>
			<div>
				<input type="radio" name="refseq_aa_radio" value="refseq_aa_daily" id="id_refseq_aa_daily">
				<label for="id_refseq_aa_daily">Daily Updates</label>
			</div>
			<div id="id_refseq_aa_daily_div" class="refseq_aa_area" style="margin: 10px;">
				<input type="hidden" name="division" value="refseq-aa-daily">
			</div>
		</li>

		<li>
			<div>
				<input type="radio" name="refseq_aa_radio" value="refseq_aa_model" id="id_refseq_aa_model">
				<label for="id_refseq_aa_model">Model Species</label>
			</div>
			<div id="id_refseq_aa_model_div" class="refseq_aa_area" style="margin-left: 10px;">
<table id="refseq_aa_model_table">
	<tr>
		<td colspan="5"><input id="refseq_aa_model_title" type="checkbox" name="div_class" value="refseq_model" />
                        <span style="font-size: 110%; font-weight: bold;">Protein</span></td>
	</tr>
	<tr>
		<td><input class="refseq_aa_model_div" type="checkbox" name="division" value="refseq-model-protein-B_taurus">B. taurus</td>
		<td><input class="refseq_aa_model_div" type="checkbox" name="division" value="refseq-model-protein-D_rerio">D. rerio</td>
		<td><input class="refseq_aa_model_div" type="checkbox" name="division" value="refseq-model-protein-H_sapiens">H. sapiens</td>
		<td><input class="refseq_aa_model_div" type="checkbox" name="division" value="refseq-model-protein-M_musculus">M. musculus</td>
	</tr>
	<tr>
		<td><input class="refseq_aa_model_div" type="checkbox" name="division" value="refseq-model-protein-R_norvegicus">R. norvegicus</td>
		<td><input class="refseq_aa_model_div" type="checkbox" name="division" value="refseq-model-protein-X_tropicalis">X. tropicalis</td>
		<td></td>
		<td></td>
	</tr>
</table>
			</div>
		</li>
	</ul>
</div>
