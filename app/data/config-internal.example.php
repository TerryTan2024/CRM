<?php
return [
  'database' => [
    'host' => 'espocrm-db',
    'port' => '',
    'charset' => NULL,
    'dbname' => 'espocrm',
    'user' => 'espocrm',
    'password' => 'change-me-db-password',
    'platform' => 'Mysql'
  ],
  'smtpPassword' => NULL,
  'logger' => [
    'path' => 'data/logs/espo.log',
    'level' => 'WARNING',
    'rotation' => true,
    'maxFileNumber' => 30,
    'printTrace' => false,
    'databaseHandler' => false,
    'sql' => false,
    'sqlFailed' => false
  ],
  'restrictedMode' => false,
  'cleanupAppLog' => true,
  'cleanupAppLogPeriod' => '30 days',
  'webSocketMessager' => 'ZeroMQ',
  'clientSecurityHeadersDisabled' => false,
  'clientCspDisabled' => false,
  'clientCspScriptSourceList' => [
    0 => 'https://maps.googleapis.com'
  ],
  'adminUpgradeDisabled' => false,
  'isInstalled' => true,
  'microtimeInternal' => 0,
  'cryptKey' => 'generate-a-new-crypt-key',
  'hashSecretKey' => 'generate-a-new-hash-secret-key',
  'defaultPermissions' => [
    'user' => 'www-data',
    'group' => 'www-data'
  ],
  'actualDatabaseType' => 'mysql',
  'actualDatabaseVersion' => '8.0',
  'instanceId' => 'generate-a-new-instance-id'
];
