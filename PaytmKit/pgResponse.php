<?php
include "../include/config.php";
header("Pragma: no-cache");
header("Cache-Control: no-cache");
header("Expires: 0");

// following files need to be included
require_once("./lib/config_paytm.php");
require_once("./lib/encdec_paytm.php");

$paytmChecksum = "";
$paramList = array();
$isValidChecksum = "FALSE";

$paramList = $_POST;
$paytmChecksum = isset($_POST["CHECKSUMHASH"]) ? $_POST["CHECKSUMHASH"] : ""; //Sent by Paytm pg

//Verify all parameters received from Paytm pg to your application. Like MID received from paytm pg is same as your application�s MID, TXN_AMOUNT and ORDER_ID are same as what was sent by you to Paytm PG for initiating transaction etc.
$isValidChecksum = verifychecksum_e($paramList, PAYTM_MERCHANT_KEY, $paytmChecksum); //will return TRUE or FALSE string.


if($isValidChecksum == "TRUE") {
	echo "<b>Checksum matched and following are the transaction details:</b>" . "<br/>";
	if ($_POST["STATUS"] == "TXN_SUCCESS") {
		echo "<b>Transaction status is success</b>" . "<br/>";
		//Process your transaction here as success transaction.
		//Verify amount & order id received from Payment gateway with your application's order id and amount.
	}
	else {
		echo "<b>Transaction status is failure</b>" . "<br/>";
	}

	if (isset($_POST) && count($_POST)>0 )
	{ 
		
		$log = $_SESSION['user'];
		$user = callingOne("users where email='$log' OR contact='$log'");

		$user_id = $user['user_id'];
        $order  = callingOne("orders where ordered=0 AND user_id='$user_id'");

		$data = [
			'ORDERID' => $paramList['ORDERID'],
    		'MID' => $paramList['MID'],
    		'TXNID' => $paramList['TXNID'],
			'TXNAMOUNT' => $paramList['TXNAMOUNT'],
    		'PAYMENTMODE' => $paramList['PAYMENTMODE'],
    		'CURRENCY' => $paramList['CURRENCY'],
    		'TXNDATE' => $paramList['TXNDATE'],
    		'STATUS' => $paramList['STATUS'],
    		'RESPCODE' => $paramList['RESPCODE'],
    		'RESPMSG' => $paramList['RESPMSG'],
    		'GATEWAYNAME' => $paramList['GATEWAYNAME'],
    		'BANKTXNID' => $paramList['BANKTXNID'],
    		'BANKNAME' => $paramList['BANKNAME'],
			"order_id" => $order['id'],
		];

	

		insertData("payments",$data);
		redirect("../index.php");
		// foreach($_POST as $paramName => $paramValue) {
		// 		echo "<br/>" . $paramName . " = " . $paramValue;
		// }
	}
	

}
else {
	echo "<b>Checksum mismatched.</b>";
	//Process transaction as suspicious.
}

?>