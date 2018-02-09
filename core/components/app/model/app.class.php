<?php

class App
{
    /** @var modX $modx */
    public $modx;
    /** @var pdoFetch $pdo */
    public $pdoTools;
    public $config = [];

    const assets_version = '1.00';


    /**
     * @param modX $modx
     * @param array $config
     */
    function __construct(modX &$modx, array $config = [])
    {
        $this->modx =& $modx;
        $corePath = $this->modx->getOption('app_core_path', $config, $this->modx->getOption('core_path') . 'components/app/');
        $assetsUrl = $this->modx->getOption('app_assets_url', $config, $this->modx->getOption('assets_url') . 'components/app/');

        $this->config = array_merge([
            'corePath' => $corePath,
            'modelPath' => $corePath . 'model/',
            'processorsPath' => $corePath . 'processors/',
            'assetsUrl' => $assetsUrl,
            'connectorUrl' => $assetsUrl . 'connector.php',
        ], $config);
        
        $this->modx->addPackage('app', $this->config['modelPath']);
        $this->modx->lexicon->load('app:default');
    }


    /**
     * Initialize App
     */
    public function initialize()
    {
        $this->pdoTools = $this->modx->getService('pdoFetch');
        if (!isset($_SESSION['csrf-token'])) {
            $_SESSION['csrf-token'] = bin2hex(openssl_random_pseudo_bytes(16));
        }

        //$this->modx->addPackage('app', $this->config['modelPath']);
        /** @noinspection PhpIncludeInspection */
        //require_once $this->config['corePath'] . 'vendor/autoload.php';
    }


    /**
     * @param $action
     * @param array $data
     *
     * @return array|bool|mixed
     */
    public function runProcessor($action, array $data = [])
    {
        $action = 'web/' . trim($action, '/');
        /** @var modProcessorResponse $response */
        $response = $this->modx->runProcessor($action, $data, ['processors_path' => $this->config['processorsPath']]);
        if ($response) {
            $data = $response->getResponse();
            if (is_string($data)) {
                $data = json_decode($data, true);
            }

            return $data;
        }

        return false;
    }


    /**
     * @param modSystemEvent $event
     * @param array $scriptProperties
     */
    public function handleEvent(modSystemEvent $event, array $scriptProperties)
    {
        extract($scriptProperties);
        switch ($event->name) {
            case 'pdoToolsOnFenomInit':
                /** @var Fenom|FenomX $fenom */
                $fenom->addAllowedFunctions([
                    'array_keys',
                    'array_values',
                ]);
                $fenom->addAccessorSmart('en', 'en', Fenom::ACCESSOR_PROPERTY);
                $fenom->en = $this->modx->getOption('cultureKey') == 'en';

                $fenom->addAccessorSmart('assets_version', 'assets_version', Fenom::ACCESSOR_PROPERTY);
                $fenom->assets_version = $this::assets_version;

                $fenom->addAccessorSmart('assets_url', 'assets_url', Fenom::ACCESSOR_PROPERTY);
                $fenom->assets_url = $this->config['assetsUrl'];

                $fenom->addModifier('uri2id', function ($input) {
                    return $this->modx->findResource($input);
                });

                $fenom->addModifier('getColors', function ($input) {
                    return $this->getColors($input);
                });

                $fenom->addModifier('getImages', function ($input) {
                    return $this->getImages($input);
                });

                $fenom->addModifier('productsCount', function ($input) {
                    return $input;
                });
                break;

            case 'OnHandleRequest':
                if ($this->modx->context->key == 'mgr') {
                    return;
                }

                // Remove slash and question signs at the end of url
                $uri = $_SERVER['REQUEST_URI'];
                if ($uri != '/' && in_array(substr($uri, -1), ['/', '?'])) {
                    $this->modx->sendRedirect(rtrim($uri, '/?'), ['responseCode' => 'HTTP/1.1 301 Moved Permanently']);
                }

                // Remove .html extension
                if (preg_match('#\.html$#i', $uri)) {
                    $this->modx->sendRedirect(preg_replace('#\.html$#i', '', $uri),
                        ['responseCode' => 'HTTP/1.1 301 Moved Permanently']
                    );
                }

                // Switch context - uncomment it if you have more than one context
                /*
                $c = $this->modx->newQuery('modContextSetting', [
                    'key' => 'http_host',
                    'value' => $_SERVER['HTTP_HOST'],
                ]);
                $c->select('context_key');
                $tstart = microtime(true);
                if ($c->prepare() && $c->stmt->execute()) {
                    $this->modx->queryTime += microtime(true) - $tstart;
                    $this->modx->executedQueries++;
                    if ($context = $c->stmt->fetch(PDO::FETCH_COLUMN)) {
                        if ($context != 'web') {
                            $this->modx->switchContext($context);
                        }
                    }
                }
                */
                break;
            case 'OnLoadWebDocument':
                break;
            case 'OnPageNotFound':
                break;
            case 'OnDocFormPrerender':
                // Compress output html for Google
                $this->modx->resource->_output = preg_replace('#\s+#', ' ', $this->modx->resource->_output);

                $data_js = preg_replace(array('/^\n/', '/\t{6}/'), '', '
                    App.config.connector_url = "' . $this->config['connectorUrl'] . '";
                    App.product_id = ' . $id . ';
                ');
                $this->modx->regClientStartupScript("<script type=\"text/javascript\">\n" . $data_js . "\n</script>", true);
                $this->modx->controller->addJavascript($this->config['assetsUrl'] . 'mgr/js/app.js');
                $this->modx->controller->addJavascript($this->config['assetsUrl'] . 'mgr/vendor/jscolor.min.js');
                $this->modx->controller->addJavascript($this->config['assetsUrl'] . 'mgr/js/product/misc/utils.js');
                $this->modx->controller->addJavascript($this->config['assetsUrl'] . 'mgr/js/product/misc/combo.js');
                $this->modx->controller->addJavascript($this->config['assetsUrl'] . 'mgr/js/product/widgets/images.panel.js');
                $this->modx->controller->addJavascript($this->config['assetsUrl'] . 'mgr/js/product/widgets/colors.windows.js');
                $this->modx->controller->addJavascript($this->config['assetsUrl'] . 'mgr/js/product/widgets/colors.grid.js');
                $this->modx->controller->addJavascript($this->config['assetsUrl'] . 'mgr/js/product/widgets/colors.tab.js');
                $this->modx->regClientCSS($this->config['assetsUrl'] . 'mgr/css/main.css');
                break;
        }
    }

    public function getColors($id)
    {
        $q = $this->modx->newQuery('AppProductColor');
        $q->innerJoin('AppColor','AppColor', 'AppColor.id = AppProductColor.color_id'); 
        $q->leftJoin('msProductFile','Image', 'Image.id = AppProductColor.product_file_id'); 
        $q->leftJoin('msProductFile','Thumb', 'Thumb.parent = Image.id'); 
        $q->where(array(
            'AppProductColor.product_id' => $id
        ));
        $q->select('AppProductColor.id,Image.id as file,AppColor.label,AppColor.color,Image.url as image,Thumb.url as thumb');
        if ($q->prepare() && $q->stmt->execute()) {
            $colors = $q->stmt->fetchAll(PDO::FETCH_ASSOC);
            return $colors;
        }
    }

    public function getImages($id)
    {
        $q = $this->modx->newQuery('msProductFile');
        $q->where(array(
            'msProductFile.product_id' => $id,
            'msProductFile.parent' => 0,
            'msProductFile.active' => 1
        ));
        $q->sortby('rank', 'ASC');
        $q->select($this->modx->getSelectColumns('msProductFile','msProductFile',''));
        if ($q->prepare() && $q->stmt->execute()) {
            $images = $q->stmt->fetchAll(PDO::FETCH_ASSOC);
            return $images;
        }
    }

    public function quickView($id)
    {
        $response = $this->runProcessor('product/quickview', [
            'id' => $id
        ]);

        if($response['success']) {
            $html = $this->pdoTools->getChunk('@FILE chunks/modals/quickview.tpl', $response['object']);

            return array(
                'success' => true,
                'html' => $html
            );
        }

        return array(
            'success' => false,
            'message' => 'Product not found'
        );
    }
}