<?php

class AppProductColorGetProcessor extends modObjectGetProcessor
{
    public $objectType = 'AppProductColor';
    public $classKey = 'AppProductColor';
    public $languageTopics = ['app:default'];
    //public $permission = 'view';


    /**
     * We doing special check of permission
     * because of our objects is not an instances of modAccessibleObject
     *
     * @return mixed
     */
    public function process()
    {
        if (!$this->checkPermissions()) {
            return $this->failure($this->modx->lexicon('access_denied'));
        }

        return parent::process();
    }

    public function beforeOutput() {
        $color_id = $this->object->get('color_id');

        if($AppColor = $this->modx->getObject('AppColor', $color_id)) {
            $this->object->set('color', $AppColor->get('color'));
            $this->object->set('label', $AppColor->get('label'));
        }
    }

}

return 'AppProductColorGetProcessor';