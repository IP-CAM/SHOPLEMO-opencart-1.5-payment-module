<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		:: <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	<?php } ?>
  </div>
	<?php if (count($errors) > 0) { ?>
		<div class="warning">
			<?php foreach ($errors as $index => $error) { ?>
				<p>
					<?php echo $shoplemoLang->error_messages[$index]; ?>
				</p>
			<?php } ?>
		</div>
	<?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/payment.png" alt="" /> <?php echo $shoplemoLang->title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $shoplemoLang->saveButton; ?></a><a href="<?php echo $formCancelUrl; ?>" class="button"><?php echo $shoplemoLang->cancelButton; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $formActionUrl; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
		<tr>
			<td colspan="2"><h4><?php echo $shoplemoLang->integrationSettingsTitle; ?><br /><?php echo $shoplemoLang->integrationSettingsTitleDesc; ?></h4></td>
		</tr>
		<tr>
			<td><?php echo $shoplemoLang->integrationKey; ?></td>
			<td>
				<input type="text" name="shoplemo_api_key" value="<?php echo $shoplemo_api_key; ?>" class="form-control"/>
				<?php if (array_key_exists('required_field_api_key', $errors) || !isset($shoplemo_api_key) || !isset($shoplemo_api_key)) { ?>
					<p><span class="text-danger"><?php echo $shoplemoLang->error_messages['required_field_api_key']; ?></span></p>
				<?php } ?>
			</td>
		</tr>
		<tr>
			<td><?php echo $shoplemoLang->integrationSecret; ?></td>
			<td>
				<input type="text" name="shoplemo_secret_key" value="<?php echo $shoplemo_secret_key; ?>" class="form-control"/>
				<?php if (array_key_exists('required_field_api_secret', $errors) || !isset($shoplemo_secret_key) || !isset($shoplemo_secret_key)) { ?>
					<p><span class="text-danger"><?php echo $shoplemoLang->error_messages['required_field_api_secret']; ?></span></p>
				<?php } ?>
			</td>
		</tr>
		<tr>
			<td><?php echo $shoplemoLang->integrationCallbackUrl; ?></td>
			<td>
				<div class="alert alert-info">
					<i class="fa fa-exclamation-circle"></i> <?php echo $callback_url; ?>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2"><h4><?php echo $shoplemoLang->orderSettingsTitle; ?></h4></td>
		</tr>
		<tr>
			<td><?php echo $shoplemoLang->onPaymentApproved; ?></td>
			<td>
				<select name="shoplemo_order_completed_id" class="form-control">
					<?php if (!isset($shoplemo_order_completed_id)) { ?>
						<option value='' selected><?php echo $shoplemoLang->onPaymentCallbackSelect; ?></option>
					<?php
					}
					foreach ($order_statuses as $order_status)
					{
					?>
						<option value="<?php echo $order_status['order_status_id']; ?>" <?php if ($order_status['order_status_id'] == $shoplemo_order_completed_id) { ?>selected="selected" <?php } ?>><?php echo $order_status['name']; ?></option>
					<?php } ?>
				</select>
				<p><span class="help"><?php echo $shoplemoLang->onPaymentApprovedDesc; ?></span></p>
				<?php if (array_key_exists('required_field_onPaymentApproved', $errors) || !isset($shoplemo_order_completed_id) || !isset($shoplemo_order_completed_id)) { ?>
					<p><span class="text-danger"><?php echo $shoplemoLang->error_messages['required_field_onPaymentApproved']; ?></span></p>
				<?php } ?>
			</td>
		</tr>
		<tr>
			<td><?php echo $shoplemoLang->onPaymentCanceled; ?></td>
			<td>
				<select name="shoplemo_order_canceled_id" class="form-control">
					<?php if (!isset($shoplemo_order_canceled_id)) { ?>
						<option value='0' selected><?php echo $shoplemoLang->onPaymentCallbackSelect; ?></option>
					<?php
					}
					foreach ($order_statuses as $order_status)
					{
					?>
						<option value="<?php echo $order_status['order_status_id']; ?>" <?php if ($order_status['order_status_id'] == $shoplemo_order_canceled_id) { ?>selected="selected" <?php } ?>><?php echo $order_status['name']; ?></option>
					<?php } ?>
				</select>
				<p><span class="help"><?php echo $shoplemoLang->onPaymentCanceledDesc; ?></span></p>
				<?php if (array_key_exists('required_field_onPaymentCanceled', $errors) || !isset($shoplemo_order_canceled_id) || !isset($shoplemo_order_canceled_id)) { ?>
					<p><span class="text-danger"><?php echo $shoplemoLang->error_messages['required_field_onPaymentCanceled']; ?></span></p>
				<?php } ?>
			</td>
		</tr>
		<tr>
			<td colspan="2"><h4><?php echo $shoplemoLang->otherSettingsTitle; ?></h4></td>
		</tr>
		<tr>
			<td><?php echo $shoplemoLang->extensionStatus; ?></td>
			<td>
				<select name="shoplemo_status" class="form-control">
					<option value="1" <?php if ($shoplemo_status == 1) { ?> selected="selected" <?php } ?>><?php echo $shoplemoLang->extensionActive; ?></option>
					<option value="0" <?php if ($shoplemo_status == 0) { ?> selected="selected" <?php } ?>><?php echo $shoplemoLang->extensionInactive; ?></option>
				</select>
			</td>
		</tr>
		<tr>
			<td><?php echo $shoplemoLang->extensionLang; ?></td>
			<td>
				<select name="shoplemo_lang" class="form-control">
				<?php
				foreach ($availableLanguages as $key => $val)
				{
				?>
					<option value="<?php echo $key; ?>" <?php if ($shoplemo_lang == $key) { ?> selected="selected" <?php } ?>><?php echo $val; ?></option>
				<?php } ?>
				</select>
			</td>
		</tr>
		<tr>
			<td><?php echo $shoplemoLang->minimumCartTotal; ?></td>
			<td>
				<input name="shoplemo_minimum_cart_total" value="<?php echo $shoplemo_minimum_cart_total; ?>" class="form-control">
				<?php if (array_key_exists('required_field_minimum_cart_total', $errors) || !isset($shoplemo_minimum_cart_total) || !isset($shoplemo_minimum_cart_total)) { ?>
					<p><span class="text-danger"><?php echo $shoplemoLang->error_messages['required_field_minimum_cart_total']; ?></span></p>
				<?php } ?>
			</td>
		</tr>
		<tr>
			<td><?php echo $shoplemoLang->paymentOptionSortOrder; ?></td>
			<td>
				<input name="shoplemo_sort_order" value="<?php echo $shoplemo_sort_order; ?>" class="form-control">
				<p><span class="help"><?php echo $shoplemoLang->paymentOptionSortOrderDesc; ?></span></p>
			</td>
		</tr>
		<tr>
			<td><?php echo $shoplemoLang->paymentGeoZoneId; ?></td>
			<td>
				<select name="shoplemo_geo_zone_id" id="input-order-status-completed" class="form-control">
					<option value='' selected><?php echo $shoplemoLang->paymentGeoZoneNull; ?></option>
					<?php
					foreach ($geo_zones as $geo_zone)
					{
					?>
						<option value="<?php echo $geo_zone['geo_zone_id']; ?>" <?php if ($geo_zone['geo_zone_id'] == $shoplemo_geo_zone_id) { ?> selected="selected" <?php } ?>><?php echo $geo_zone['name']; ?></option>
					<?php } ?>
				</select>
				<p><span class="help"><?php echo $shoplemoLang->paymentGeoZoneIdDesc; ?></span></p>
			</td>
		</tr>
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?> 