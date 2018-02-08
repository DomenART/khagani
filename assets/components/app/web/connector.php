<?php
define('MODX_REQP', false);

if (file_exists(dirname(dirname(dirname(dirname(dirname(__FILE__))))) . '/config.core.php')) {
    /** @noinspection PhpIncludeInspection */
    require_once dirname(dirname(dirname(dirname(dirname(__FILE__))))) . '/config.core.php';
} else {
    require_once dirname(dirname(dirname(dirname(dirname(dirname(dirname(__FILE__))))))) . '/config.core.php';
}
/** @noinspection PhpIncludeInspection */
require_once MODX_CORE_PATH . 'config/' . MODX_CONFIG_KEY . '.inc.php';
/** @noinspection PhpIncludeInspection */
require_once MODX_CONNECTORS_PATH . 'index.php';

$_SERVER['HTTP_MODAUTH']= $modx->user->getUserToken($modx->context->get('key'));

$modelPath = $modx->getOption('app_core_path', array(), $modx->getOption('core_path') . 'components/app/') . 'model/';
/** @var App $App */
$App = $modx->getService('App', 'App', $modelPath);
$modx->lexicon->load('app:default');

// handle request
$corePath = $modx->getOption('app_core_path', null, $modx->getOption('core_path') . 'components/app/');
$path = $modx->getOption('processorsPath', $App->config, $corePath . 'processors/');
$path = $path . 'web/';
$modx->getRequest();

/** @var modConnectorRequest $request */
$request = $modx->request;
$request->handleRequest([
    'processors_path' => $path,
    'location' => '',
]);