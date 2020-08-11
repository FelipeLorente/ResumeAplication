<!--#include file="include/conexao.asp"-->
<!--#include file="include/topo.asp"-->

<%'PARAMETERS
wprograma		= "default"
typeIn			= request.QueryString("typeIn")
janitorial 		= request.QueryString("janitorial")
supervisor		= request.QueryString("supervisor")

'CLASSIFY VALUE
FUNCTION returnStatus(V)

	IF LEN(TRIM(V)) >0 THEN
		IF V = "Y" THEN
			returnStatus = "YES"
		END IF
		
		IF V = "N" THEN
			returnStatus = "NO"
		END IF	
	END IF	

END FUNCTION

'VERIFICA SE TEM TIPO
IF NOT ISEMPTY (typeIn) THEN

	' Coloque um n�mero grande para o tempo de finaliza��o do script, pois o upload pode demorar alguns minutos. Se o servidor estiver com o tempo baixo, pode haver erro no upload 
	Server.scripttimeout = 999999
	 
	' Caso houver algum erro o c�digo vai prosseguir at� o final. Isso evita que seja mostrada aquela p�gina de erro padr�o do Internet Explorer 
	On Error Resume Next 
	 
	' Aqui criamos uma inst�ncia do objeto do ASP Smart Upload 
	Set Upload = Server.CreateObject("aspSmartUpload.SmartUpload") 	
	
	' Aqui criamos uma lista dos formatos de arquivos que poder�o ser enviados 
	Upload.AllowedFilesList = "pdf"  'jpge,jpg,gif,png
	 
	' Aqui configuramos o tamanho m�ximo de cada arquivo enviado em bytes 
	Upload.MaxFileSize = 16000000  'de 970 a 1000 kb
	 
	' Aqui configuramos o tamanho total para os arquivos enviados. Todos os arquivos juntos n�o podem passar deste tamanho 
	Upload.TotalMaxFileSize = 40000000 
	
	' pasta onde sera armazenado
	pasta		 = server.MapPath("resumeFiles")&"\"
	
	' Aqui � efetuado o envio dos arquivos 
	Upload.Upload 
	
	'PARAMETERS FROM FORM
	qre_name			= UCASE(Upload.Form("qre_name").values)
	qre_tel				= UCASE(Upload.Form("qre_tel").values)	
	qre_answer1			= UCASE(Upload.Form("qre_answer1").values)	
	qre_answer2			= UCASE(Upload.Form("qre_answer2").values)	
	qre_a2_oLang		= UCASE(Upload.Form("qre_a2_oLang").values)	
	qre_answer3			= UCASE(Upload.Form("qre_answer3").values)	
	qre_a3_G			= UCASE(Upload.Form("qre_a3_G").values)	
	qre_answer4			= UCASE(Upload.Form("qre_answer4").values)	
	qre_answer5			= UCASE(Upload.Form("qre_answer5").values)	
	qre_answer6			= UCASE(Upload.Form("qre_answer6").values)	
	qre_answer7			= UCASE(Upload.Form("qre_answer7").values)	
	qre_answer8			= UCASE(Upload.Form("qre_answer8").values)	
	qre_answer9			= UCASE(Upload.Form("qre_answer9").values)	
	qre_a9_whichOne		= UCASE(Upload.Form("qre_a9_whichOne").values)	
	qre_answer10		= UCASE(Upload.Form("qre_answer10").values)	
	qre_answer11		= UCASE(Upload.Form("qre_answer11").values)	
	qre_a11_whichOne	= UCASE(Upload.Form("qre_a11_whichOne").values)	
	qre_answer12		= UCASE(Upload.Form("qre_answer12").values)	
	qre_a12_whichOne	= UCASE(Upload.Form("qre_a12_whichOne").values)	
	qre_answer13		= UCASE(Upload.Form("qre_answer13").values)	
	qre_answer14		= UCASE(Upload.Form("qre_answer14").values)	
	qre_answer15		= UCASE(Upload.Form("qre_answer15").values)	
	qre_answer16		= UCASE(Upload.Form("qre_answer16").values)			
	qre_a17_anySh 		= UCASE(Upload.Form("qre_a17_anySh").values)
	qre_a17_morningSh	= UCASE(Upload.Form("qre_a17_morningSh").values)
	qre_a17_afternoonSh = UCASE(Upload.Form("qre_a17_afternoonSh").values)
	qre_a17_nightSh 	= UCASE(Upload.Form("qre_a17_nightSh").values)
	qre_a17_weekdays 	= UCASE(Upload.Form("qre_a17_weekdays").values)
	qre_a17_weekends	= UCASE(Upload.Form("qre_a17_weekends").values)	
	qre_answer18		= UCASE(Upload.Form("qre_answer18").values)	
	qre_a18_time		= UCASE(Upload.Form("qre_a18_time").values)	
	qre_answer19		= UCASE(Upload.Form("qre_answer19").values)				

	'VERIF FILDS. IF THERE ARE SOME RESULTS IN THE NEXT FIELD 
	'PUT YES OPTION IN THE BEFORE FIELD
	IF LEN(TRIM(qre_a3_G)) >0 THEN
		qre_answer3 = "Y"
	END IF
	
	IF LEN(TRIM(qre_a9_whichOne)) >0 THEN
		qre_answer9 = "Y"
	END IF
	
	IF LEN(TRIM(qre_a11_whichOne)) >0 THEN
		qre_answer11 = "Y"
	END IF
	
	IF LEN(TRIM(qre_a12_whichOne)) >0 THEN
		qre_answer12 = "Y"
	END IF
	
	IF LEN(TRIM(qre_a18_time)) >0 THEN
		qre_answer18 = "Y"
	END IF
	
	'FORMAT qre_answer17
	IF LEN(TRIM(qre_a17_anySh)) > 0 THEN
		qre_answer17 = TRIM(qre_a17_anySh)
	END IF		
	
	IF LEN(TRIM(qre_a17_morningSh)) > 0 THEN
		IF LEN(TRIM(qre_answer17)) > 0 THEN
			qre_answer17 = qre_answer17 &", "& TRIM(qre_a17_morningSh)
		ELSE
			qre_answer17 =  TRIM(qre_a17_morningSh)
		END IF		
	END IF
	
	IF LEN(TRIM(qre_a17_afternoonSh)) > 0 THEN
		IF LEN(TRIM(qre_answer17)) > 0 THEN
			qre_answer17 = qre_answer17 &", "& TRIM(qre_a17_afternoonSh)
		ELSE
			qre_answer17 =  TRIM(qre_a17_afternoonSh)
		END IF		
	END IF
	
	IF LEN(TRIM(qre_a17_nightSh)) > 0 THEN
		IF LEN(TRIM(qre_answer17)) > 0 THEN
			qre_answer17 = qre_answer17 &", "& TRIM(qre_a17_nightSh)
		ELSE
			qre_answer17 =  TRIM(qre_a17_nightSh)
		END IF		
	END IF
	
	IF LEN(TRIM(qre_a17_weekdays)) > 0 THEN
		IF LEN(TRIM(qre_answer17)) > 0 THEN
			qre_answer17 = qre_answer17 &", "& TRIM(qre_a17_weekdays)
		ELSE
			qre_answer17 =  TRIM(qre_a17_weekdays)
		END IF		
	END IF
		
	IF LEN(TRIM(qre_a17_weekends)) > 0 THEN
		IF LEN(TRIM(qre_answer17)) > 0 THEN
			qre_answer17 = qre_answer17 &", "& TRIM(qre_a17_weekends)
		ELSE
			qre_answer17 =  TRIM(qre_a17_weekends)
		END IF		
	END IF		
	
	'PUT THE QUESTIONS IN THE VARIABLES
	qre_question1		= "Are you eligible to work in Canada?"
	qre_question2		= "Do you speak, read and write English?"
	qre_q2_oLang		= "Any other Language"
	qre_question3		= "Do you have valid driver license?"
	qre_q3_G			= "Type of license"
	qre_question4		= "Do you have your own vehicle?"
	qre_question5		= "What are your plans for the future?"
	qre_question6		= "Would you be interested in learning new skills?"
	qre_question7		= "Are you flexible in job description?"
	qre_question8		= "How long do you have experience in the cleaning industry?"
	qre_question9		= "Are you knowledgeable in assembling basic cleaning tools? Example: Squeegee, brush, etc? What devices have you previously used?"
	qre_q9_whichOne		= "Which one?"
	qre_question10		= "Are you experienced in floor machines, Ex: Auto scrubbers?"
	qre_question11		= "Is there any specific task that you dont perform?"
	qre_q11_whichOne	= "Which one?"
	qre_question12		= "Do you have a previous experience in warehouse, cleaning, floors or logistic?"
	qre_q12_whichOne	= "Which one?"
	qre_question13		= "Do you have ability to lift up to 25lbs repetitively?"
	qre_question14		= "Do you have ability to push Pallet Truck up to 50lbs?"
	qre_question15		= "How many years do you have experience as a supervisor?"
	qre_question16		= "Do you have any experience with changing parts of the machine, for example: squeegee, brush, etc.?"
	qre_question17		= "Would you be available for early morning, afternoon or night shifts?"
	qre_question18		= "What is your availability?"
	qre_q18_time		= "Time"
	qre_question19		= "Is there anything else you would like me to know?"
	
	'CREATE VARIABLE MSG
	MSG = ""
	
	'Se houver algum erro ser� exibida essa mensagem e a descri��o do erro 
	 If Err Then 
		IF REPLACE(TRIM(ERR.NUMBER),"-","") = "2147220399" THEN
			descricao_erro = Err.Description
			
			MSG = "File too big. More than 15mb!"

		ELSEIF REPLACE(TRIM(ERR.NUMBER),"-","") = "2147220494"  THEN
			descricao_erro = Err.Description
			
			MSG = "Only PDF is accept!"
			
		ELSE
			descricao_erro = Err.Description
				
			MSG = "File Error!" & descricao_erro
		END IF
	 End if 	
	
	' FILE NAME
	nome_arquivo 	= "FILE_"&replace(formatadata(date), "/","")&"_"&replace(formataHora(time), ":","")&"."		
	
	IF LEN(TRIM(MSG)) = 0 THEN				
		' Selecionamos cada arquivo que foi submetido do formul�rio 
		For each File in Upload.Files
	
			If Not File.IsMissing Then
					
				' Aqui checamos se o tamanho dele � maior que 0 byte. Isso � necess�rio pois se a pessoa submeter o formul�rio com o endere�o do arquivo errado, ser� criado um 
				If File.Size > 0 Then
				
					'pega extensao do arquivo
					extensao = File.FileExt 
	
					'INSERT IN DATABASE
					sqlVar = "pr_ma_ResumeAplications 1, "
					sqlVar = sqlVar & ""&stringsql(qre_name)&", "
					sqlVar = sqlVar & ""&stringsql(qre_tel)&", "
					sqlVar = sqlVar & ""&stringsql(qre_question1)&", "
					sqlVar = sqlVar & ""&stringsql(qre_answer1)&", "
					sqlVar = sqlVar & ""&stringsql(qre_question2)&", "
					sqlVar = sqlVar & ""&stringsql(qre_answer2)&", "
					sqlVar = sqlVar & ""&stringsql(qre_q2_oLang)&", "
					sqlVar = sqlVar & ""&stringsql(qre_a2_oLang)&", "
					sqlVar = sqlVar & ""&stringsql(qre_question3)&", "
					sqlVar = sqlVar & ""&stringsql(qre_answer3)&", "
					sqlVar = sqlVar & ""&stringsql(qre_q3_G)&", "
					sqlVar = sqlVar & ""&stringsql(qre_a3_G)&", "
					sqlVar = sqlVar & ""&stringsql(qre_question4)&", "
					sqlVar = sqlVar & ""&stringsql(qre_answer4)&", "
					sqlVar = sqlVar & ""&stringsql(qre_question5)&", "
					sqlVar = sqlVar & ""&stringsql(qre_answer5)&", "
					sqlVar = sqlVar & ""&stringsql(qre_question6)&", "				
					sqlVar = sqlVar & ""&stringsql(qre_answer6)&", "
					sqlVar = sqlVar & ""&stringsql(qre_question7)&", "
					sqlVar = sqlVar & ""&stringsql(qre_answer7)&", "
					sqlVar = sqlVar & ""&stringsql(qre_question8)&", "
					sqlVar = sqlVar & ""&stringsql(qre_answer8)&", "
					sqlVar = sqlVar & ""&stringsql(qre_question9)&", "
					sqlVar = sqlVar & ""&stringsql(qre_answer9)&", "
					sqlVar = sqlVar & ""&stringsql(qre_q9_whichOne)&", "
					sqlVar = sqlVar & ""&stringsql(qre_a9_whichOne)&", "
					sqlVar = sqlVar & ""&stringsql(qre_question10)&", "
					sqlVar = sqlVar & ""&stringsql(qre_answer10)&", "
					sqlVar = sqlVar & ""&stringsql(qre_question11)&", "
					sqlVar = sqlVar & ""&stringsql(qre_answer11)&", "
					sqlVar = sqlVar & ""&stringsql(qre_q11_whichOne)&", "
					sqlVar = sqlVar & ""&stringsql(qre_a11_whichOne)&", "
					sqlVar = sqlVar & ""&stringsql(qre_question12)&", "
					sqlVar = sqlVar & ""&stringsql(qre_answer12)&", "
					sqlVar = sqlVar & ""&stringsql(qre_q12_whichOne)&", "
					sqlVar = sqlVar & ""&stringsql(qre_a12_whichOne)&", "
					sqlVar = sqlVar & ""&stringsql(qre_question13)&", "
					sqlVar = sqlVar & ""&stringsql(qre_answer13)&", "
					sqlVar = sqlVar & ""&stringsql(qre_question14)&", "
					sqlVar = sqlVar & ""&stringsql(qre_answer14)&", "
					sqlVar = sqlVar & ""&stringsql(qre_question15)&", "				
					sqlVar = sqlVar & ""&stringsql(qre_answer15)&", "
					sqlVar = sqlVar & ""&stringsql(qre_question16)&", "
					sqlVar = sqlVar & ""&stringsql(qre_answer16)&", "
					sqlVar = sqlVar & ""&stringsql(qre_question17)&", "
					sqlVar = sqlVar & ""&stringsql(qre_answer17)&", "
					sqlVar = sqlVar & ""&stringsql(qre_question18)&", "
					sqlVar = sqlVar & ""&stringsql(qre_answer18)&", "
					sqlVar = sqlVar & ""&stringsql(qre_q18_time)&", "
					sqlVar = sqlVar & ""&stringsql(qre_a18_time)&", "
					sqlVar = sqlVar & ""&stringsql(qre_question19)&", "
					sqlVar = sqlVar & ""&stringsql(qre_answer19)&", "
					sqlVar = sqlVar & ""&stringsql(pasta&nome_arquivo&extensao)&", "
					sqlVar = sqlVar & ""&stringsql(nome_arquivo&extensao)&" "				
										
					conexao.execute(ucase(sqlVar))
						
					'salva de acordo com o nome desejado
					File.SaveAs(pasta&nome_arquivo&extensao)
					
					'CREATE MAIL
					body = ""
					body = body&"<div class='text-center'>"
					body = body&"	<img src='imagens/bullet.gif' width='1' height='1' border='0'>"
					body = body&"</div>"
					body = body&"<div style='padding-left:15px'>"
					body = body&"	<img src='imagens/ServiceMaster_Clean_logo.png' width='240'>"
					body = body&"</div>"
					body = body&"<div class='text-center'>"
					body = body&"	<img src='imagens/bullet.gif' width='1' height='1' border='0'>"
					body = body&"</div>"
					body = body&"<table border='0' cellpadding='0' cellspacing='0' width='90%' style='font-size: 13px; font-family: Tahoma; color: #000000; margin-left:20px'>"
					body = body&"<tr>"
					body = body&"	<td>Resume Aplication from: <b>"&qre_name&"</b></td>"
					body = body&"</tr>"
					body = body&"<tr height='10'>"
					body = body&"	<td></td>"
					body = body&"</tr>"
					body = body&"<tr>"
					body = body&"	<td align='left'><b>Name</b>: "&qre_name&" </b></td>"
					body = body&"</tr>"
					body = body&"<tr>"
					body = body&"	<td align='left'><b>Telephone</b>: "&qre_tel&" </b></td>"
					body = body&"</tr>"
					body = body&"<tr height='5'>"
					body = body&"	<td></td>"
					body = body&"</tr>"
					body = body&"<tr>"
					body = body&"	<td align='left' style='padding:5px'><b>1) Are you eligible to work in Canada?</b>: "&returnStatus(qre_answer1)&" </b></td>"
					body = body&"</tr>"
					
					body = body&"<tr>"
					body = body&"	<td align='left' style='padding:5px'><b>2) Do you speak, read and write English?</b>: "&returnStatus(qre_answer2)&" </b></td>"
					body = body&"</tr>"					
					body = body&"<tr>"
					body = body&"	<td align='left' style='padding:5px'><b>Any other Language</b>: "&qre_a2_oLang&" </b></td>"
					body = body&"</tr>"
					
					body = body&"<tr>"
					body = body&"	<td align='left' style='padding:5px'><b>3) Do you have valid driver�s license?</b>: "&returnStatus(qre_answer3)&" "&qre_a3_G&" </b></td>"
					body = body&"</tr>"	
					
					body = body&"<tr>"
					body = body&"	<td align='left' style='padding:5px'><b>4) Do you have your own vehicle?</b>: "&returnStatus(qre_answer4)&" </b></td>"
					body = body&"</tr>"
					
					body = body&"<tr>"
					body = body&"	<td align='left' style='padding:5px'><b>5) What are your plans for the future?</b>: "&qre_answer5&" </b></td>"
					body = body&"</tr>"
					
					body = body&"<tr>"
					body = body&"	<td align='left' style='padding:5px'><b>6) Would you be interested in learning new skills?</b>: "&returnStatus(qre_answer6)&" </b></td>"
					body = body&"</tr>"
					
					body = body&"<tr>"
					body = body&"	<td align='left' style='padding:5px'><b>7) Are you flexible in job description?</b>: "&returnStatus(qre_answer7)&" </b></td>"
					body = body&"</tr>"
					
					body = body&"<tr>"
					body = body&"	<td align='left' style='padding:5px'><b>8) How long do you have experience in the cleaning industry?</b>: "&returnStatus(qre_answer8)&" </b></td>"
					body = body&"</tr>"
					
					body = body&"<tr>"
					body = body&"	<td align='left' style='padding:5px'><b>9) Are you knowledgeable in assembling basic cleaning tools?</b>: "&returnStatus(qre_answer9)&". "&qre_a9_whichOne&" </b></td>"
					body = body&"</tr>"
					
					body = body&"<tr>"
					body = body&"	<td align='left' style='padding:5px'><b>10) Are you experienced in floor machines, Ex: Auto scrubbers?</b>: "&returnStatus(qre_answer10)&" </b></td>"
					body = body&"</tr>"
					
					body = body&"<tr>"
					body = body&"	<td align='left' style='padding:5px'><b>11) Is there any specific task that you don�t perform?</b>: "&returnStatus(qre_answer11)&". "&qre_a11_whichOne&" </b></td>"
					body = body&"</tr>"
					
					body = body&"<tr>"
					body = body&"	<td align='left' style='padding:5px'><b>12) Do you have a previous experience in warehouse, cleaning, floors or logistic?</b>: "&returnStatus(qre_answer12)&". "&qre_a12_whichOne&" </b></td>"
					body = body&"</tr>"
					
					body = body&"<tr>"
					body = body&"	<td align='left' style='padding:5px'><b>- Do you have ability to lift up to 25lbs repetitively?</b>: "&returnStatus(qre_answer13)&" </b></td>"
					body = body&"</tr>"
					
					body = body&"<tr>"
					body = body&"	<td align='left' style='padding:5px'><b>- Do you have ability to push Pallet Truck up to 50lbs?</b>: "&returnStatus(qre_answer14)&" </b></td>"
					body = body&"</tr>"
					
					body = body&"<tr>"
					body = body&"	<td align='left' style='padding:5px'><b>- How many years do you have experience as a supervisor?</b>: "&qre_answer15&" </b></td>"
					body = body&"</tr>"	
					
					body = body&"<tr>"
					body = body&"	<td align='left' style='padding:5px'><b>- Do you have any experience with changing parts of the machine, for example: squeegee, brush, etc.?</b>: "&qre_answer16&" </b></td>"
					body = body&"</tr>"					
					
					body = body&"<tr>"
					body = body&"	<td align='left' style='padding:5px'><b>13) Would you be available for early morning, afternoon or night shifts?</b>: "&qre_answer17&" </b></td>"
					body = body&"</tr>"				
					
					body = body&"<tr>"
					body = body&"	<td align='left' style='padding:5px'><b>14) What is your availability?</b>: "&returnStatus(qre_answer18)&". "&qre_a18_time&" </b></td>"
					body = body&"</tr>"	
					
					body = body&"<tr>"
					body = body&"	<td align='left' style='padding:5px'><b>15) Is there anything else you would like me to know?</b>: "&qre_answer19&" </b></td>"
					body = body&"</tr>"
					body = body&"</table>"						
					
					SEND = EnviaEmail("ResumeAplication", "xx", "xx", "xx", "", "", "HTML", "New Resume Application", body, pasta&nome_arquivo&extensao)%>
					
					<script>
					// mostra aviso de erro 
					$('#warning').modal('show') 
					$('#warningTitle').text('System Alert') 
					$('#warningDescription').text('Resume has been sent success!') 
					$('#warningImage').removeClass('')  
					$('#warningImage').addClass('glyphicon-ok text-success'); 									
					
					$('#warning').ready(function(e) {
						 $('#ok').focus();	
					});
									
					// redireciona 
					$("#ok").click(function(){
						$(location).attr('href','default.asp')
					});					
					</script>																						
								 
				<%'Caso for um arquivo inv�lido, ou seja, o tamanho dele for igual a zero ent�o aparecer� a mensagem e em seguida terminamos a condi��o. 
				 Else 
					
					MSG = "File is empt!"				 
					  
				 End if
			end if 
		 
		'Caso mais de um arquivo tenha sido enviado, enviamos o sistema para o pr�ximo. 
		 Next 
				 
		'Aqui destru�mos a inst�ncia do objeto ASP Smart Upload para n�o haver, casualmente, travas no sistema e outros erros 
		 Set Upload = Nothing					 			 
	END IF		
END IF%>
    
    
<nav class="navbar navbar-inverse navbar-fixed-top" style="background:#00a2b2; border:0px;">
    <div class="container">    
        <a class="navbar-brand" href="default.asp" style="color:#fff; font-weight:bold; text-align:left !important">ServiceMaster Clean - System</a>          	
    </div>
</nav>
  
<div class="mx-auto">
    
    <br/><br><br>
   
    <div class="text-center">
        <img src="imagens/bullet.gif" width="1" height="1" border="0">
    </div>
    <div class="text-center">
        <img src="imagens/ServiceMaster_Clean_logo.png" width="240">
    </div>
    <div class="text-center">
        <img src="imagens/bullet.gif" width="1" height="1" border="0">
    </div>
    
    <br/>
    
    <form action="<%=wprograma%>.asp?typeIn=1" name="forme" id="forme" method="post" class="form-signin" onSubmit="return validaformAntes(this)" enctype="multipart/form-data">    
    
    <div class="row" style="margin:0px">
        <div class="col-sm-2 col-md-3 col-lg-4"></div>
        <div class="col-sm-8 col-md-6 col-lg-4">
            <div class="col-auto">
                <label  class="control-label">Name <font style="color:#FF0000;">*</font></label><br>
                <input type="text" name="qre_name" id="qre_name" value="<%=qre_name%>" maxlength="100" class="form-control text-uppercase" placeholder="NAME" title="Name!" parametro="no" requerido="yes" msg="Type your name!">
            </div>
            <br>
            <div class="col-auto">
                <label  class="control-label">Telephone <font style="color:#FF0000;">*</font></label><br>
                <input type="text" name="qre_tel" id="qre_tel" value="<%=qre_tel%>" maxlength="14" class="form-control" placeholder="TELEPHONE" title="Telephone!" onKeypress="mascaraTel(this); return somenteNumeros(event); verifNum(this.value, this.name);" onKeyUp="mascaraTel(this)" onKeyDown="mascaraTel(this); verifNum(this.value, this.name);" onBlur="verifNum(this.value, this.name);" parametro="no" requerido="yes" msg="Type your telephone!">
                <sup style="padding-left:5px; top:1px"><b>Ex.: (999) 999-9999</b></sup>
            </div>
            <br>
            <div class="col-auto">
                <label  class="control-label">Resume Upload <font style="color:#FF0000;">*</font></label><br>
                
                <div class="form-group">
                    <div class="input-group input-file" name="Fichier1">
                        <span class="input-group-btn">
                            <button class="btn btn-default btn-choose" type="button">Choose</button>
                        </span>
                        <input type="text" class="form-control" id="qre_file" name="qre_file" placeholder='Choose a file...' readonly parametro="no" requerido="yes" msg="Select your resume in PDF!" />
                        <span class="input-group-btn">
                            <button class="btn btn-reset" type="button" style="background-color:#00a2b2; color:#fff">Reset</button>
                        </span>
                    </div>
                </div>                            
       			<sup style="font-weight:bold; top:-15px">ONLY PDF LESS THAN 15MB IS ACCEPT!</sup>
            </div>
        </div>
        <div class="col-sm-2 col-md-3 col-lg-4"></div>
    </div>
    
    <br> 
    
    <div class="row">
        <div class="col-sm-2 col-md-3 col-lg-4"></div>
        <div class="col-sm-8 col-md-6 col-lg-4">
            <div class="col-auto">
                <label  class="control-label">1) Are you eligible to work in Canada?  <font style="color:#FF0000;">*</font></label>
                <div class="radio">
                    <label>
                        <input type="radio" name="qre_answer1" id="qre_answer1" value="Y" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        Yes
                    </label>

                    <label>
                        <input type="radio" name="qre_answer1" id="qre_answer1" value="N" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        No
                    </label>
                </div>
            </div>
            
            <div class="col-auto">
                <label  class="control-label">2) Do you speak, read and write English? <font style="color:#FF0000;">*</font></label>
                <div class="radio">
                    <label>
                        <input type="radio" name="qre_answer2" id="qre_answer2" value="Y" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        Yes
                    </label>

                    <label>
                        <input type="radio" name="qre_answer2" id="qre_answer2" value="N" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        No
                    </label>
                </div>
                
                Any other Language: <input type="text" class="form-group text-uppercase" id="qre_a2_oLang" name="qre_a2_oLang" value="<%=qre_a2_oLang%>" maxlength="50">
            </div>
            
            <div class="col-auto">
                <label  class="control-label">3) Do you have valid driver�s license? <font style="color:#FF0000;">*</font></label>
                <div class="radio">
                    <label>
                        <input type="radio" name="qre_answer3" id="qre_answer3" onClick="document.getElementsByName('qre_a3_G')[0].checked=true" value="Y" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        Yes
                    </label>
                    
                    <label>
                        <input type="radio" name="qre_a3_G" id="qre_a3_G" onClick="document.getElementsByName('qre_answer3')[0].checked=true" value="G1" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        G1
                    </label>
                    
                    <label>
                        <input type="radio" name="qre_a3_G" id="qre_a3_G" onClick="document.getElementsByName('qre_answer3')[0].checked=true" value="G2" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        G2
                    </label>
                    
                    <label>
                        <input type="radio" name="qre_a3_G" id="qre_a3_G" onClick="document.getElementsByName('qre_answer3')[0].checked=true" value="GF" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        G Full
                    </label>
                    <br><br>
                    <label>
                        <input type="radio" name="qre_answer3" id="qre_answer3" onClick="selectDriverNo()" value="N" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        No
                    </label>
                </div>
            </div>
            
            <div class="col-auto">
                <label  class="control-label">4) Do you have your own vehicle? <font style="color:#FF0000;">*</font></label>
                <div class="radio">
                    <label>
                        <input type="radio" name="qre_answer4" id="qre_answer4" value="Y" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        Yes
                    </label>

                    <label>
                        <input type="radio" name="qre_answer4" id="qre_answer4" value="N" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        No
                    </label>
                </div>
                
            </div>
            
            <div class="col-auto">
                <label  class="control-label">5) What are your plans for the future? </label>
                <textarea class="form-group text-uppercase" id="qre_answer5" name="qre_answer5" maxlength="250" style="width:90%; height:100px"></textarea>
            </div>
            
            <div class="col-auto">
                <label  class="control-label">6) Would you be interested in learning new skills? <font style="color:#FF0000;">*</font></label>
                <div class="radio">
                    <label>
                        <input type="radio" name="qre_answer6" id="qre_answer6" value="Y" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        Yes
                    </label>

                    <label>
                        <input type="radio" name="qre_answer6" id="qre_answer6" value="N" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        No
                    </label>
                </div>
            </div>
            
            <div class="col-auto">
                <label  class="control-label">7) Are you flexible in job description? <font style="color:#FF0000;">*</font> </label>
                <div class="radio">
                    <label>
                        <input type="radio" name="qre_answer7" id="qre_answer7" value="Y" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        Yes
                    </label>

                    <label>
                        <input type="radio" name="qre_answer7" id="qre_answer7" value="N" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        No
                    </label>
                </div>
            </div>
            
            <div class="col-auto">
                <label  class="control-label">8) How long do you have experience in the cleaning industry?  <font style="color:#FF0000;">*</font></label>
                <div class="radio">
                    <label>
                        <input type="radio" name="qre_answer8" id="qre_answer8" value="N" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        No
                    </label>
                    
                    <label>
                        <input type="radio" name="qre_answer8" id="qre_answer8" value="Less than 1 year" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        Less than 1 year
                    </label>
                    <br><br>
                    <label>
                        <input type="radio" name="qre_answer8" id="qre_answer8" value="More than 1 year" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        More than 1 year
                    </label>                                               
                </div>
            </div>
            
            <div class="col-auto">
                <label  class="control-label">9) Are you knowledgeable in assembling basic cleaning tools? Example: Squeegee, brush, etc? What devices have you previously used? <font style="color:#FF0000;">*</font> </label>
                <div class="radio">
                    <label>
                        <input type="radio" name="qre_answer9" id="qre_answer9" value="Y" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        Yes.
                    </label>
                    
                    Which one? <input type="text" class="form-group text-uppercase" id="qre_a9_whichOne" name="qre_a9_whichOne" onKeyUp="desmarkFields(this,2, 'qre_answer9')" onBlur="desmarkFields(this,2, 'qre_answer9')" maxlength="100">
                    
                    <label>
                        <input type="radio" name="qre_answer9" id="qre_answer9" onClick="desmarkFields(this,1, 'qre_a9_whichOne')" value="N" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        No
                    </label>
                </div>                    
            </div>
            
            <div class="col-auto">
                <label  class="control-label">10) Are you experienced in floor machines, Ex: Auto scrubbers? <font style="color:#FF0000;">*</font> </label>
                <div class="radio">
                    <label>
                        <input type="radio" name="qre_answer10" id="qre_answer10" value="Y" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        Yes
                    </label>

                    <label>
                        <input type="radio" name="qre_answer10" id="qre_answer10" value="N" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        No
                    </label>
                </div>
            </div>
            
            <div class="col-auto">
                <label  class="control-label">11) Is there any specific task that you don�t perform? <font style="color:#FF0000;">*</font> </label>
                <div class="radio">
                    <label>
                        <input type="radio" name="qre_answer11" id="qre_answer11" value="Y" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        Yes.
                    </label>
                    
                    Which one? <input type="text" class="form-group text-uppercase" id="qre_a11_whichOne" name="qre_a11_whichOne" onKeyUp="desmarkFields(this,2, 'qre_answer11')" onBlur="desmarkFields(this,2, 'qre_answer11')" maxlength="100">
                    
                    <label>
                        <input type="radio" name="qre_answer11" id="qre_answer11" onClick="desmarkFields(this,1, 'qre_a11_whichOne')" value="N" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        No
                    </label>
                </div>                    
            </div>
            
            <div class="col-auto">
                <label  class="control-label">12) Do you have a previous experience in warehouse, cleaning, floors or logistic?  <font style="color:#FF0000;">*</font></label>
                <div class="radio">
                    <label>
                        <input type="radio" name="qre_answer12" id="qre_answer12" value="Y" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        Yes.
                    </label>
                    
                    Which one? <input type="text" class="form-group text-uppercase" id="qre_a12_whichOne" name="qre_a12_whichOne" onKeyUp="desmarkFields(this,2, 'qre_answer12')" onBlur="desmarkFields(this,2, 'qre_answer12')" maxlength="100">
                    
                    <label>
                        <input type="radio" name="qre_answer12" id="qre_answer12" onClick="desmarkFields(this,1, 'qre_a12_whichOne')" value="N" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        No
                    </label>
                </div>                    
            </div>                    
            
            <%' SE TIVER JANITORIAL NO LINK MOSTRA QUADRO
			IF janitorial = 1 THEN%>
            
                <div class="panel-group">                
                    <div class="panel panel-default">
                        <div class="panel-heading font-weight-bold">Janitorial Services</div>
                        <div class="panel-body">                        
                            <label  class="control-label">� Do you have ability to lift up to 25lbs repetitively?  <font style="color:#FF0000;">*</font></label>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="qre_answer13" id="qre_answer13" value="Y" />
                                    <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                                    Yes
                                </label>
            
                                <label>
                                    <input type="radio" name="qre_answer13" id="qre_answer13" value="N" />
                                    <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                                    No
                                </label>
                            </div> 
                            
                            <label  class="control-label">� Do you have ability to push Pallet Truck up to 50lbs?<font style="color:#FF0000;">*</font> </label>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="qre_answer14" id="qre_answer14" value="Y" />
                                    <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                                    Yes
                                </label>
            
                                <label>
                                    <input type="radio" name="qre_answer14" id="qre_answer14" value="N" />
                                    <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                                    No
                                </label>
                            </div>                        
                        </div>
                    </div>                                
                </div>
                
            <%END IF%>
            
            <%' SE TIVER JANITORIAL NO LINK MOSTRA QUADRO
			IF supervisor = 1 THEN%>
                <div class="panel-group">                
                    <div class="panel panel-default">
                        <div class="panel-heading font-weight-bold">Supervisors</div>
                        <div class="panel-body">                        
                            <label  class="control-label">� How many years do you have experience as a supervisor?  <font style="color:#FF0000;">*</font></label>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="qre_answer15" id="qre_answer15" value="NO" />
                                    <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                                    No
                                </label>
                                
                                <label>
                                    <input type="radio" name="qre_answer15" id="qre_answer15" value="Less than 1 year" />
                                    <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                                    Less than 1 year
                                </label>
                                <br><br>
                                <label>
                                    <input type="radio" name="qre_answer15" id="qre_answer15" value="More than 1 year" />
                                    <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                                    More than 1 year
                                </label>                                               
                            </div> 
                            
                            <label  class="control-label">� Do you have any experience with changing parts of the machine, for example: squeegee, brush, etc.?  <font style="color:#FF0000;">*</font> </label>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="qre_answer16" id="qre_answer16" value="YES" />
                                    <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                                    Yes
                                </label>
                                
                                 <label>
                                    <input type="radio" name="qre_answer16" id="qre_answer16" value="SOME" />
                                    <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                                    Some
                                </label>
            
                                <label>
                                    <input type="radio" name="qre_answer16" id="qre_answer16" value="NO" />
                                    <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                                    No
                                </label>
                            </div>                        
                        </div>
                    </div>                                
                </div>
                
            <%END IF%>
            
            <div class="col-auto">
                <label  class="control-label">13) Would you be available for early morning, afternoon or night shifts?  <font style="color:#FF0000;">*</font></label>
                <div class="checkbox" style="height:10px; min-height:10px; max-height:10px">
                    <label>
                        <input type="checkbox" id="qre_a17_anySh" name="qre_a17_anySh" class="form-check-input position-static" value="Any" checked />
                        <span class="cr" style="width:12px; height:12px"><i class="cr-icon glyphicon glyphicon-check" style="font-size:13px;"></i></span>                                         
                    </label> 
                     Any
                     
                    <label>
                        <input type="checkbox" id="qre_a17_morningSh" name="qre_a17_morningSh" class="form-check-input position-static" value="Morning Shift" />
                        <span class="cr" style="width:12px; height:12px"><i class="cr-icon glyphicon glyphicon-check" style="font-size:13px;"></i></span>                                         
                    </label>
                    Morning Shift
                    
                    <label>
                        <input type="checkbox" id="qre_a17_afternoonSh" name="qre_a17_afternoonSh" class="form-check-input position-static" value="AFTERNOON SHIFT" />
                        <span class="cr" style="width:12px; height:12px"><i class="cr-icon glyphicon glyphicon-check" style="font-size:13px;"></i></span>                                         
                    </label>
                     Afternoon Shift
                    
                    <label>
                        <input type="checkbox" id="qre_a17_nightSh" name="qre_a17_nightSh" class="form-check-input position-static" value="NIGHT SHIFT" />
                        <span class="cr" style="width:12px; height:12px"><i class="cr-icon glyphicon glyphicon-check" style="font-size:13px;"></i></span>                                         
                    </label>
                     Night Shift
                     
                     <label>
                        <input type="checkbox" id="qre_a17_weekdays" name="qre_a17_weekdays" class="form-check-input position-static" value="WEEKDAYS" />
                        <span class="cr" style="width:12px; height:12px"><i class="cr-icon glyphicon glyphicon-check" style="font-size:13px;"></i></span>                                         
                    </label>
                     Weekdays
                     
                     <label>
                        <input type="checkbox" id="qre_a17_weekends" name="qre_a17_weekends" class="form-check-input position-static" value="WEEKENDS" />
                        <span class="cr" style="width:12px; height:12px"><i class="cr-icon glyphicon glyphicon-check" style="font-size:13px;"></i></span>                                         
                    </label>
                     Weekends
                                              
                </div>                                                           
            </div>
            
            <br><br>
            
            <div class="col-auto">
                <label  class="control-label">14) What is your availability?  <font style="color:#FF0000;">*</font></label>
                <div class="radio">
                    <label>
                        <input type="radio" name="qre_answer18" id="qre_answer18" value="Y" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        Yes.
                    </label>
                    
                    Time: <input type="text" class="form-group text-uppercase" id="qre_a18_time" name="qre_a18_time" onKeyUp="desmarkFields(this,2, 'qre_answer18')" onBlur="desmarkFields(this,2, 'qre_answer18')" maxlength="100">
                    
                    <label>
                        <input type="radio" name="qre_answer18" id="qre_answer18" onClick="desmarkFields(this,1, 'qre_a18_time')" value="N" />
                        <span class="cr"><i class="cr-icon glyphicon glyphicon-ok-sign" style="font-size:18px;"></i></span>
                        No
                    </label>
                </div>                    
            </div>
            
            <div class="col-auto">
                <label  class="control-label">15) Is there anything else you would like me to know? </label>
                <textarea class="form-group text-uppercase" id="qre_answer19" name="qre_answer19" maxlength="250" style="width:95%; height:100px"></textarea>
            </div>
            
            <div class="col-auto" align="center">
                <button type="submit" id="apply" name="apply" class="btn" style="background-color:#00a2b2; color:#fff">Apply</button>
            </div>
                                                            
        </div>                        
        
        <div class="col-sm-2 col-md-3 col-lg-4"></div>
    </div>                        
          
    </form>

</div>   

</body>
</html>
  
<script>

<%' PUT MSGS TO USERS
IF LEN(TRIM(MSG)) >0 THEN%>
	flameAlert('<%=MSG%>', '', '', '')		
<%END IF%>

//FUNCTION VERIFY THE FORM BEFORM SEND
function validaformAntes(v){	
	 
	 //get fields
	var name = $("#qre_name").val().trim()
	var tel  = $("#qre_tel").val().trim()
	var file = $("#qre_file").val().trim()
	
	// verify name 
	if(name.length == 0){
		flameAlert('Please, put your name!', '', '', '')							
		return false
	}
	
	// verify tel 
	if(tel.length == 0 || tel.length != 14){
		flameAlert('Please, put your tel corretly!', '', '', '')							
		return false
	}
	
	// verify tel 
	if(file.length == 0){
		flameAlert('Please, put your resume!', '', '', '')							
		return false
	}
	
	//VERIFY ALL RADIO BUTTON IS CHECKED
	var i;
	var name = ""
	for (i = 1; i < 19; i++) {
		name = "qre_answer" + i
		
		//jump de question 5 / 17
		if(i != 5 && i != 13 && i != 14 && i != 15 && i != 16 && i != 17){	
		
			if($("#forme").find('input[name='+name+']:checked').length == 0) {  
				
				//verify last question
				if (i==18){
					msgAlert = 	'Please, answer the question 14!'
				}else{
					msgAlert = 	'Please, answer the question '+i+'!'
				}
				
				// chama fun��o do alert
				flameAlert(msgAlert, '', '', '')							
				return false							
			}
			
		}else{
			
			if(i == 13 || i == 14){			
				<%'VERIFY JANITORIAL
				IF janitorial = 1 THEN%>
					if($("#forme").find('input[name=qre_answer13]:checked').length == 0 || $("#forme").find('input[name=qre_answer14]:checked').length == 0){
						flameAlert('Please, answer the janitor question!', '', '', '')							
						return false
					}
				
				<%END IF%>
			}
			
			if(i == 15 || i == 16){						
				<%'VERIFY SUPERVISOR
				IF supervisor = 1 THEN%>
					
					if($("#forme").find('input[name=qre_answer15]:checked').length == 0 || $("#forme").find('input[name=qre_answer16]:checked').length == 0){
						flameAlert('Please, answer the supervisor question!', '', '', '')							
						return false
					}
				
				<%END IF%>					
			}
		}		
	}					
	
	return validaform(v)
	
}

// VERIFY FIELDS
function desmarkFields(v, t, field) {	
	
	var fields = document.getElementsByName(field)
	
	if(t==1){		
		document.getElementById(field).value = ''
	}
	
	
	if(t==2){
		if(v.value.trim().length>0){					
			fields[0].checked = true			
		}else{
			fields[1].checked = true		
		}
	}

}

function selectDriverNo() {
	var qre_a3_G = document.getElementsByName('qre_a3_G')
	
	// loop
	for(i=0; i< qre_a3_G.length;i++){		
		qre_a3_G[i].checked		= false
	}
}

// FUNCTION TO UPLOAD FIELD
function bs_input_file() {
	$(".input-file").before(
		function() {
			if ( ! $(this).prev().hasClass('input-ghost') ) {
				var element = $("<input type='file' class='input-ghost' style='visibility:hidden; height:0'>");
				element.attr("name",$(this).attr("name"));
				element.change(function(){
					element.next(element).find('input').val((element.val()).split('\\').pop());
				});
				$(this).find("button.btn-choose").click(function(){
					element.click();
				});
				$(this).find("button.btn-reset").click(function(){
					element.val(null);
					$(this).parents(".input-file").find('input').val('');
				});
				$(this).find('input').css("cursor","pointer");
				$(this).find('input').mousedown(function() {
					$(this).parents('.input-file').prev().click();
					return false;
				});
				return element;
			}
		}
	);
}
$(function() {
	bs_input_file();
});
</script>

<!--#include file="include/fechaConexao.asp"-->