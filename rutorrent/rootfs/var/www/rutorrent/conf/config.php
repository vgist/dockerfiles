<?php
	@define('HTTP_USER_AGENT', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36', true);
	@define('HTTP_TIME_OUT', 30, true);
	@define('HTTP_USE_GZIP', true, true);
	$httpIP = null;
	$httpProxy = array
	(
		'use' 	=> false,
		'proto'	=> 'http',
		'host'	=> 'PROXY_HOST_HERE',
		'port'	=> 3128
	);
	@define('RPC_TIME_OUT', 5, true);
	@define('LOG_RPC_CALLS', false, true);
	@define('LOG_RPC_FAULTS', true, true);
	@define('PHP_USE_GZIP', false, true);
	@define('PHP_GZIP_LEVEL', 2, true);
	$schedule_rand = 10;
	$do_diagnostic = true;
	$log_file = '/tmp/errors.log';
	$saveUploadedTorrents = true;
	$overwriteUploadedTorrents = false;
	$topDirectory = '/data/torrents';
	$forbidUserSettings = false;
	$scgi_port = 0;
	$scgi_host = "unix:///data/scgi.socket";
	$XMLRPCMountPoint = "/RPC2";
	$pathToExternals = array(
		"php" 	=> '/usr/bin/php',
		"pgrep" => '/usr/bin/pgrep',
		"curl"	=> '/usr/bin/curl',
		"gzip"	=> '/usr/bin/gzip',
		"id"	=> '/usr/bin/id',
		"stat"	=> '/bin/stat',
	);
	$localhosts = array(
		"127.0.0.1",
		"localhost",
	);
	$profilePath = '../share';
	$profileMask = 0777;
	$tempDirectory = null;
	$canUseXSendFile = false;
	$locale = "UTF8";
	$enableCSRFCheck = false;
	$enabledOrigins = array();
