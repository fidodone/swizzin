<!doctype html>
<html>
<meta http-equiv="refresh" content="60" charset="UTF-8"/>
<meta name="robots" content="noindex" content="nofollow” />
<meta http-equiv="Cache-Control" content="no-cache">
<meta name="copyright" content="pgblitz.com" />
<title>Nixon Monitor</title>
<meta name="viewport" content="width=device-width, initial-scale=0.5">
<link rel="icon" type="image/png" href="https://i.ibb.co/Gx9qhRk/Logo.png" sizes="32x32">
<style type="text/css">
body {
	background-color: #2E2E2E;
	text-align: center;
}
.test {
}
body,td,th {
	color: #FFFFFF;
	font-size: 16px;
	font-family: Segoe, "Segoe UI", "DejaVu Sans", "Trebuchet MS", Verdana, sans-serif;
}
a:link {
	color: #E8DD06;
}
a:visited {
	color: #E8DD06;
}
div {
  width: 100%;
  height: 100%;
  background-image: -webkit-linear-gradient(rgba(255, 255, 255, 0), rgba(255, 255, 255, 0)), url('https://i.ibb.co/R6J7HrM/teste2.png');
  background-size: 100% 100%;
}
</style>
</head>
<body text="#FFFFFF">
<div>
<table width="100%" border="0" cellpadding="5" cellspacing="0">
  <tbody>
    <tr>
      <td width="104">&nbsp;</td>
		<td width="876" align="lef">
			<h1>
				<strong style="color: #FFFFFF; font-family: Arial; font-size: 48px; font-weight: bolder;">NixonCloud<br>
					<span style="color: #A9A9A9; font-size: 18px">As informações são atualizadas a cada 60 segundos</span>	
					<br>
				</strong>
			</h1>
		</td>
	<td width="104" align="left">
	       <a href="">
			<img src="https://i.ibb.co/Gx9qhRk/Logo.png" width="70%" height="75%" />
	       </a>
	</td>
    </tr>
  </tbody>
</table>
</div>
<br>
<table width="530" align="center" cellpadding="5">
</table>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
</table>
<table width="100%" cellpadding="10">
  <tbody>
    <tr>
    <td height="100" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td width="90%" height="30" style="color: #58ACFA; font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', 'DejaVu Sans', Verdana, sans-serif; font-weight: bolder; font-size: large; text-align: center;">Log de Upload</td>
            </tr>
          </tbody>
        </table>
        <table width="60%" height="44" border="1" align="center" cellpadding="5" cellspacing="0">
          <tbody>
            <tr>
              <td colspan="6" bgcolor="#FFFFFF" style="color: #F7F6F6; font-family: Segoe, 'Segoe UI', 'DejaVu Sans', 'Trebuchet MS', Verdana, sans-serif; font-weight: bold; font-size: medium;"><span class="test" style="color: #000000; font-family: Segoe, 'Segoe UI', 'DejaVu Sans', 'Trebuchet MS', Verdana, sans-serif; font-size: 16px;">
                <?php $output = shell_exec('tail -n 12 /log/USER.log');
echo "<pre>$output</pre>";
?>
              </span></td>
            </tr>
          </tbody>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td width="90%" height="30" style="color: #FA5858; font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', 'DejaVu Sans', Verdana, sans-serif; font-weight: bolder; font-size: large; text-align: center;"><br>
                Log de Erros</td>
            </tr>
          </tbody>
        </table>
        <table width="60%" height="44" border="1" align="center" cellpadding="5" cellspacing="0">
          <tbody>
            <tr>
              <td colspan="6" bgcolor="#FFFFFF" style="color: #F7F6F6; font-family: Segoe, 'Segoe UI', 'DejaVu Sans', 'Trebuchet MS', Verdana, sans-serif; font-weight: bold; font-size: 16px;"><span class="test" style="color: #000000; font-family: Segoe, 'Segoe UI', 'DejaVu Sans', 'Trebuchet MS', Verdana, sans-serif;">
                <?php $output = shell_exec('echo "Nenhum erro encontrado!"');
echo "<pre>$output</pre>";
?>
              </span></td>
            </tr>
          </tbody>
        </table>
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td width="90%" height="30" style="color: #E8DD06; font-family: 'Lucida Grande', 'Lucida Sans Unicode', 'Lucida Sans', 'DejaVu Sans', Verdana, sans-serif; font-weight: bolder; font-size: large; text-align: center;"><br>
                Informações da Seedbox</td>
            </tr>
          </tbody>
        </table>
        <table width="60%" border="1" align="center" cellpadding="0" cellspacing="0">
         
              </span></td>
            </tr>
            <tr>
              <td width="15%" bgcolor="#000000" style="font-size: medium"><span style="color: #F7F6F6; font-weight: bold; font-size: medium;"><strong>&nbsp;&nbsp;Seedbox</strong></span></td>
              <td width="18%" height="21" style="font-size: medium"><span class="test" style="color: #FFFFFF;">
                <?php $output = shell_exec('cat /plexguide/pg.os');
echo "<pre>$output</pre>";
?>

              </span></td>
              <td width="15%" bgcolor="#000000" style="font-size: medium"><span class="test" style="color: #FFFFFF; font-family: Segoe, 'Segoe UI', 'DejaVu Sans', 'Trebuchet MS', Verdana, sans-serif; font-size: medium; font-weight: bold;"><span style="color: #F7F6F6; font-weight: bold; font-size: medium;"><strong> &nbsp;&nbsp;Uso do Disco</strong></span></span></td>
              <td width="18%" height="21" style="font-size: medium"><span class="test" style="color: #FFFFFF; font-family: Segoe, 'Segoe UI', 'DejaVu Sans', 'Trebuchet MS', Verdana, sans-serif; font-size: medium;">
                <?php $output = shell_exec('cat /opt/pgui/pg.used');
echo "<pre>$output</pre>" ?>
              </span></td>
              <td width="15%" bgcolor="#000000" style="font-size: medium"><span class="test" style="color: #FFFFFF; font-family: Segoe, 'Segoe UI', 'DejaVu Sans', 'Trebuchet MS', Verdana, sans-serif; font-size: medium; font-weight: bold;"><span style="color: #F7F6F6; font-weight: bold; font-size: medium;"><strong>&nbsp;&nbsp;Espaço em Disco</strong></span></span></td>
              <td width="18%" height="21" style="font-size: medium"><span class="test" style="color: #FFFFFF; font-family: Segoe, 'Segoe UI', 'DejaVu Sans', 'Trebuchet MS', Verdana, sans-serif; font-size: medium;">
                <?php $output = shell_exec('cat /opt/pgui/pg.capacity');
echo "<pre>$output</pre>";
?>

				  </span></td>
				</tr>
				<!--added -->
			</tbody>
		</table>
       
      </td>
    </tr>
  </tbody>
</table>
</body>
</html>
