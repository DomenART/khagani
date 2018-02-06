<?php
class AppProductColorRemoveProcessor extends modObjectProcessor
{
    public $objectType = 'AppProductColor';
    public $classKey = 'AppProductColor';
    public $languageTopics = ['app'];
    //public $permission = 'remove';
    /**
     * @return array|string
     */
    public function process()
    {
        if (!$this->checkPermissions()) {
            return $this->failure($this->modx->lexicon('access_denied'));
        }
        $ids = $this->modx->fromJSON($this->getProperty('ids'));
        if (empty($ids)) {
            return $this->failure($this->modx->lexicon('app_product_color_err_ns'));
        }
        foreach ($ids as $id) {
            /** @var AppProductColor $object */
            if (!$object = $this->modx->getObject($this->classKey, $id)) {
                return $this->failure($this->modx->lexicon('app_product_color_err_nf'));
            }
            $object->remove();
        }
        return $this->success();
    }
}
return 'AppProductColorRemoveProcessor';