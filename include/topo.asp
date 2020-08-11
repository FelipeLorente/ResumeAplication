<!doctype html>
<html lang="en">
  <head>  

    <title>ServiceMaster Clean</title>

    <meta charset="iso-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    
    <!--imports do select flex-->
    <link href="css/SelectFlex/flexselect.css" rel="stylesheet" type="text/css">
    <script src="js/SelectFlex/javascriptSelectFlex.js"></script>
    <script src="js/SelectFlex/jquery.flexselect.js"></script>
    
    <!-- CSS programado-->          	    
	<link rel="stylesheet" type="text/css" href="BootStrap/css/style.css" />
                    
    <!-- Bootstrap core CSS -->    
    <link rel="stylesheet" type="text/css" href="BootStrap/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="BootStrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="BootStrap/css/bootstrap-theme.css" />    
    <link rel="stylesheet" type="text/css" href="BootStrap/css/bootstrap-theme.min.css" />   
    <link rel="stylesheet" type="text/css" href="BootStrap/css/bootstrap-select.css">   
    <link rel="stylesheet" type="text/css" href="Bootstrap/css/bootstrap-select.min.css">
    <link rel="stylesheet" type="text/css" href="Bootstrap/css/bootstrap-datetimepicker.css" /> 
    <link rel="stylesheet" type="text/css" href="Bootstrap/css/font-awesome.min.css">  
    
    <script language="javascript" src="BootStrap/js/npm.js"></script>      
    <script language="javascript" src="BootStrap/js/jquery.min.js"></script>     
    <script language="javascript" src="BootStrap/js/jquery.validate.min.js"></script>     
    <script language="javascript" src="BootStrap/js/bootstrap.js"></script>   
    <script language="javascript" src="BootStrap/js/bootstrap.min.js"></script>   
    <script language="javascript" src="BootStrap/js/js.js" type="text/javascript"></script> 
    <script language="javascript" src="BootStrap/js/bootstrap-select.js"></script> 
    <script language="javascript" src="Bootstrap/js/bootstrap-select.min.js"></script>
    <script language="javascript" src="Bootstrap/js/moment-with-locales.js"></script>
    <script language="javascript" src="Bootstrap/js/bootstrap-datetimepicker.js"></script>  
   
    <style>
		body {
		  padding-top: 0px; overflow-x:hidden
		}
		.starter-template {
		  padding: 40px 15px;
		  text-align: center;
		}
	  </style>
  </head>

  <body>
  
<!-- MODAL AVISO glyphicon-remove-->
<div class="modal fade" id="warning" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" id="warningClass" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background:#00a2b2">
        <h4 class="modal-title" id="warningTitle" style="color:#FFFFFF;font-weight:bold;font-size:16px"></h4>
      </div>
      <div class="modal-body">
      		<table border="0">
            <tr> 
                <td style="padding-right:30px;" width="10%"> 
                    <i id="warningImage" class="glyphicon" style="font-size:36px"></i>
                </td>
                <td width="80%" id="warningDescription"></td>
            </tr>
            </table>
      </div>
      <div class="modal-footer">
         <input type="button" id="ok" name="ok" value="Ok" class="btn btn-primary" data-dismiss="modal" aria-label="Close" style="background:#00a2b2;">     
      </div>
    </div>
  </div>
</div>

<!-- MODAL CONFIRMA glyphicon-remove-->
<div class="modal fade" id="warningClass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" id="warningClassConfirm" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background:#00a2b2">
        <h4 class="modal-title" id="warningTitleConfirm" style="color:#FFFFFF;font-weight:bold;font-size:16px"></h4>
      </div>
      <div class="modal-body">
      		<table border="0">
            <tr> 
                <td style="padding-right:30px;" width="10%"> 
                    <i id="warningImageConfirm" class="glyphicon" style="font-size:36px"></i>
                </td>
                <td width="80%" id="warningDescriptionConfirm"></td>
            </tr>
            </table>
      </div>
      <div class="modal-footer">
      	 <input type="button" id="nao" name="nao" value="N�o" class="btn btn-primary" data-dismiss="modal" aria-label="Close" style="background:#00a2b2;">
         <input type="button" id="sim" name="sim" value="Sim" class="btn btn-primary" data-dismiss="modal" style="background:#00a2b2;">     
      </div>
    </div>
  </div>
</div>


