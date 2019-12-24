<?php 
if ($shoplemo_response['status'] == 'success')
{
?>
<div id="shoplemo-area">
	<script src="https://payment.shoplemo.com/assets/js/shoplemo.js"></script>
	<iframe src="<?php echo $shoplemo_response['url']; ?>" id="shoplemoiframe" frameborder="0" scrolling="no" style="width: 100%;"></iframe>
	<script type="text/javascript">
	setTimeout(function(){ 
		iFrameResize({ log: true },'#shoplemoiframe');
	}, 1000);
	</script>
</div>
<?php
}
else
{
	foreach ($shoplemo_response['details'] as $detail)
	{
?>
	- <?php echo $detail; ?> </br>
<?php } } ?>