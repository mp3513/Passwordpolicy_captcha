<?php

/***********************   
	Change According To your Need :AcroCorp
	Create/modified Date : 18 Oct 2012	
 ***********************/
	
	/******************* Get Connection  ********************/
	function getDatabaseConnection()
	{

		
		$serverName = "JOLEENWW7\SQLEXPRESS"; 
		$dbName		= "Acrocorp25oct02";
			
		$connectionInfo = array( "Database"=>$dbName);
		$conn = sqlsrv_connect( $serverName, $connectionInfo) or die( print_r( sqlsrv_errors(), true));;	
		return $conn;	
	}
	/******************* Close Connection  ********************/
	function closeDatabaseConnection($conn)
	{
		sqlsrv_close( $conn);
	}
	
			
?>

