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

                if ($this->modx->resource) {
                    $fenom->addAccessorSmart('resource', 'resource', Fenom::ACCESSOR_PROPERTY);
                    $fenom->resource = $this->modx->resource->toArray();
                }

                $fenom->addModifier('uri2id', function ($input) {
                    return $this->modx->findResource($input);
                });

                $fenom->addModifier('units', function ($input, $titles) {
                    return $this->units($input, $titles);
                });

                $fenom->addModifier('averagePercentage', function ($input, $number) {
                    return $this->averagePercentage($input, $number);
                });

                $fenom->addModifier('totalAverageRating', function ($input) {
                    return $this->totalAverageRating($input);
                });

                $fenom->addModifier('totalAverageRatingPercent', function ($input) {
                    return $this->totalAverageRatingPercent($input);
                });

                $fenom->addModifier('round', function (...$args) {
                    return round(...$args);
                });

                $fenom->addModifier('getViewedIDs', function ($input) {
                    return $this->getViewedIDs($input);
                });

                $fenom->addModifier('addViewedID', function ($input) {
                    return $this->addViewedID($input);
                });

                $fenom->addModifier('primaryParent', function ($input) {
                    return $this->primaryParent($input);
                });

                $fenom->addModifier('getColors', function ($input) {
                    return $this->getColors($input);
                });

                $fenom->addModifier('getImages', function ($input) {
                    return $this->getImages($input);
                });

                $fenom->addModifier('productsCount', function ($input) {
                    return $this->productsCount($input);
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
            case 'xLikeOnVote':
                if ($scriptProperties['class'] == 'modResource' && $scriptProperties['list'] == 'default') {
                    if ($resource = $this->modx->getObject($scriptProperties['class'], array('id' => $scriptProperties['parent']))) {
                        $resource->setTVValue('rating', $scriptProperties['rating']);
                        $resource->save();
                    }
                }
                break;
            case 'OnBeforeCommentPublish':
            case 'OnBeforeCommentDelete':
            case 'OnBeforeCommentUndelete':
            case 'OnBeforeCommentUnpublish':
            case 'OnBeforeCommentSave':
                $commment = $event->params['TicketComment'];
                $thread = $this->modx->getObject('TicketThread', $commment->get('thread'));
                $resource = $this->modx->getObject('modResource', $thread->get('resource'));
                $c_properties = $commment->get('properties');
                $r_properties = $resource->get('properties');                
                $fields = ['vote-overall','vote-price','vote-quality','advantages','disadvantages','recommend','city','time'];
                foreach ($fields as $name) {
                    if (isset($_POST[$name])) {
                        $c_properties[$name] = $this->modx->stripTags($_POST[$name]);
                    }
                }
                $c_properties['vote-medium'] = ($c_properties['vote-overall'] + $c_properties['vote-price'] + $c_properties['vote-quality']) / 3;
                if (isset($_POST['message'])) {
                    $text = $this->modx->stripTags($_POST['message']);
                    $commment->set('text', $text);
                    $commment->set('raw', $text);
                }
                if (isset($_FILES['file'])) {
                    $pathinfo = pathinfo($_FILES['file']['name']);
                    $uploadFile = uniqid() . '.' . $pathinfo['extension'];
                    $uploadDir = 'images/comments/' . $resource->id . '/';
                    $uploadPath = MODX_ASSETS_PATH . $uploadDir . $uploadFile;
                    $uploadUrl = MODX_ASSETS_URL . $uploadDir . $uploadFile;
                    if (!is_dir(MODX_ASSETS_PATH . $uploadDir)) {
                        mkdir(MODX_ASSETS_PATH . $uploadDir);
                    }
                    if (move_uploaded_file($_FILES['file']['tmp_name'], $uploadPath)) {
                        $c_properties['file'] = [
                            'url' => $uploadUrl,
                            'name' => $pathinfo['filename'],
                            'type' => $_FILES['file']['type'],
                            'size' => $_FILES['file']['size'],
                            'path' => $uploadDir,
                            'file' => $uploadFile
                        ];
                    }
                }
                $commment->set('properties', $c_properties);

                // rating
                $votes = [
                    'vote-overall',
                    'vote-price',
                    'vote-quality'
                ];
                $value = 0;

                if (!$c_properties['counted'] && $commment->published && !$commment->deleted) {
                    $value = 1;
                    $c_properties['counted'] = true;
                    $commment->set('properties', $c_properties);
                }
                
                if ($c_properties['counted'] && (!$commment->published || $commment->deleted)) {
                    $value = -1;
                    $c_properties['counted'] = false;
                    $commment->set('properties', $c_properties);
                }
                
                if ($value != 0) {
                    // update stars count
                    foreach ($votes as $name) {
                        // create arrays in empty
                        if(!isset($r_properties[$name])) {
                            $r_properties[$name] = [
                                1 => 0,
                                2 => 0,
                                3 => 0,
                                4 => 0,
                                5 => 0,
                            ];
                        }
                        $r_properties[$name][$c_properties[$name]] += $value;
                        if(!isset($r_properties['vote-total'])) {
                            $r_properties['vote-total'] = [
                                1 => 0,
                                2 => 0,
                                3 => 0,
                                4 => 0,
                                5 => 0,
                            ];
                        }
                        $r_properties['vote-total'][$c_properties[$name]] += $value;
                        if(!isset($r_properties['stars-count'])) {
                            $r_properties['stars-count'] = 0;
                        }
                        $r_properties['stars-count'] += $value;
                    }

                    if(!isset($r_properties['recommendations'])) {
                        $r_properties['recommendations'] = 0;
                    }
                    if($c_properties['recommend']) {
                        $r_properties['recommendations'] += $value;
                    }

                    $resource->set('properties', $r_properties);
                    $resource->save();
                }
                break;
            case 'OnBeforeCommentRemove':
                $votes = [
                    'vote-overall',
                    'vote-price',
                    'vote-quality'
                ];
                $commment = $event->params['TicketComment'];
                $thread = $this->modx->getObject('TicketThread', $commment->get('thread'));
                $resource = $this->modx->getObject('modResource', $thread->get('resource'));
                $c_properties = $commment->get('properties');
                $r_properties = $resource->get('properties');
                
                if ($c_properties['counted']) {
                    // update stars count
                    foreach ($votes as $name) {
                        $r_properties[$name][$c_properties[$name]]--;
                        $r_properties['vote-total'][$c_properties[$name]]--;
                        $r_properties['stars-count']--;
                    }
                    if($c_properties['recommend']) {
                        $r_properties['recommendations'] += -1;
                    }

                    $resource->set('properties', $r_properties);
                    $resource->save();
                }
                if ($c_properties['file']) {
                    unlink(MODX_ASSETS_PATH . $c_properties['file']['path'] . $c_properties['file']['file']);
                }
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

    public function productsCount($parent)
    {
        $count = 0;
        $q = $this->modx->newQuery('modResource');
        $q->where(array(
            'parent' => $parent,
            'deleted' => false,
            'published' => true,
        )); 
        $q->select('id,parent,class_key'); 
        if ($q->prepare() && $q->stmt->execute()) {
            $resources = $q->stmt->fetchAll(PDO::FETCH_ASSOC);
            foreach ($resources as $resource) {
                if ($resource['class_key'] == 'msProduct') {
                    $count++;
                }

                $children = $this->modx->getCount('modResource', [
                    'parent' => $resource['id'],
                    'deleted' => false,
                    'published' => true,
                ]);
                if ($children > 0) {
                    $count += $this->productsCount($resource['id']);
                }
            }
        }

        return $count;
    }

    public function getColors($id)
    {
        $thumbs = [
            'small',
            'medium'
        ];
        $q = $this->modx->newQuery('AppProductColor');
        $q->innerJoin('AppColor','AppColor', 'AppColor.id = AppProductColor.color_id'); 
        $q->leftJoin('msProductFile','Image', 'Image.id = AppProductColor.product_file_id'); 
        foreach ($thumbs as $thumb) {
            $q->leftJoin('msProductFile', $thumb, $thumb . '.parent = Image.id'); 
            $q->where(array(
                $thumb . '.path:LIKE' => '%'. $thumb . '%'
            ));
            $q->select($thumb . '.url as ' . $thumb);
        }
        $q->where(array(
            'AppProductColor.product_id' => $id
        ));
        $q->groupby('AppProductColor.id');
        $q->select('AppProductColor.id,Image.id as file,AppColor.label,AppColor.color,Image.url as image');
        if ($q->prepare() && $q->stmt->execute()) {
            $colors = $q->stmt->fetchAll(PDO::FETCH_ASSOC);
            return $colors;
        }
    }

    public function getImages($id)
    {
        $thumbs = [
            // 'small',
            // 'medium'
        ];
        $q = $this->modx->newQuery('msProductFile');
        $q->where(array(
            'msProductFile.product_id' => $id,
            'msProductFile.parent' => 0,
            'msProductFile.active' => 1
        )); 
        foreach ($thumbs as $thumb) {
            $q->leftJoin('msProductFile', $thumb, $thumb . '.parent = msProductFile.id'); 
            $q->where(array(
                $thumb . '.path:LIKE' => '%'. $thumb . '%'
            ));
            $q->select($thumb . '.url as ' . $thumb);
        }
        $q->sortby('rank', 'ASC');
        $q->select($this->modx->getSelectColumns('msProductFile','msProductFile',''));
        if ($q->prepare() && $q->stmt->execute()) {
            return $q->stmt->fetchAll(PDO::FETCH_ASSOC);
        }
    }

    public function getCart()
    {
        $cart = $this->modx->runSnippet('msCart', [
            'tpl' => '@FILE chunks/partials/cart.tpl'
        ]);

        if (!empty($cart)) {
            return array(
                'success' => true,
                'html' => $cart
            );
        }

        return array(
            'success' => false,
            'message' => 'Cart not found'
        );
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

    public function primaryParent($id) {
        $resource = $this->modx->getObject('modResource', $id);

        if ($resource->parent == 0) {
            return $resource->id;
        } else {
            return $this->primaryParent($resource->parent);
        }
    }

    public function addViewedID($id) {
        if(!isset($_SESSION['viewed'])) {
            $_SESSION['viewed'] = array();
        }
        if(!in_array($id, $_SESSION['viewed'])) {
            $_SESSION['viewed'][] = $id;
        }
    }

    public function getViewedIDs($id) {
        $ids = $_SESSION['viewed'];
        if(!empty($ids)) {
            $key = array_search($id, $ids);
            
            if($key !== false) {
                unset($ids[$key]);
            }
            
            $ids = array_reverse($ids);
            
            return implode(',',$ids);
        }
        return false;
    }

    public function units($number, $titles) {
        $keys = array(2, 0, 1, 1, 1, 2);
        $mod = $number % 100;
        $suffix_key = ($mod > 7 && $mod < 20) ? 2: $keys[min($mod % 10, 5)];
        return $titles[$suffix_key];
    }

    public function averageRatingPercent($properties, $number) {
        return $properties['vote-total'][$number] / $properties['stars-count'] * 100;
    }

    public function totalAverageRating($properties) {
        $total = 0;
        foreach($properties['vote-total'] as $num=>$count) {
            $total += $num*$count;
        }
        return round($total / $properties['stars-count'], 1);
    }

    public function totalAverageRatingPercent($properties) {
        $total = 0;
        foreach($properties['vote-total'] as $num=>$count) {
            $total += $num*$count;
        }
        return round($total / $properties['stars-count'] / 5 * 100, 0);
    }
}