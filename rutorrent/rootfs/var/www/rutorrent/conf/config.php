<?php
	$httpUserAgent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36';
	$httpTimeOut = 30;
	$httpUseGzip = true;
	$httpIP = null;
	$httpProxy = array
	(
		'use' 	=> false,
		'proto'	=> 'http',
		'host'	=> 'PROXY_HOST_HERE',
		'port'	=> 3128
	);
	$rpcTimeOut = 5;
	$rpcLogCalls = false;
	$rpcLogFaults = true;
	$phpUseGzip = false;
	$phpGzipLevel = 2;
	$schedule_rand = 10;
	$do_diagnostic = true;
	$al_diagnostic = true;
	$log_file = '/tmp/errors.log';
	$saveUploadedTorrents = true;
	$overwriteUploadedTorrents = false;
	$topDirectory = '/data/torrents';
	$forbidUserSettings = false;
	$scgi_port = 0;
	$scgi_host = "unix:///data/scgi.socket";
	//$scgi_host = "127.0.0.1";
	$XMLRPCMountPoint = "/RPC2";
	$throttleMaxSpeed = 327625*1024;
	$pathToExternals = array(
		"php" 	=> '/usr/bin/php',
		"pgrep" => '/usr/bin/pgrep',
		"curl"	=> '/usr/bin/curl',
		"gzip"	=> '/usr/bin/gzip',
		"id"	=> '/usr/bin/id',
		"stat"	=> '/bin/stat',
	);
	$localHostedMode = true;
	$cachedPluginLoading = false;
	$pluginJSCacheExpire = 3*60;
	$miscCacheExpire = 3*60*24;
	$localhosts = array(
		"127.0.0.1",
		"localhost",
	);
	$profilePath = '../../share';
	$profileMask = 0777;
	$tempDirectory = null;
	$canUseXSendFile = false;
	$locale = "UTF8";
	$enableCSRFCheck = false;
	$enabledOrigins = array();
