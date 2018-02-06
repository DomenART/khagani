<?php

class AppProductColorGetListProcessor extends modObjectGetListProcessor
{
    public $objectType = 'AppProductColor';
    public $classKey = 'AppProductColor';
    public $defaultSortField = 'id';
    public $defaultSortDirection = 'DESC';
    //public $permission = 'list';


    /**
     * We do a special check of permissions
     * because our objects is not an instances of modAccessibleObject
     *
     * @return boolean|string
     */
    public function beforeQuery()
    {
        if (!$this->checkPermissions()) {
            return $this->modx->lexicon('access_denied');
        }

        return true;
    }


    /**
     * @param xPDOQuery $c
     *
     * @return xPDOQuery
     */
    public function prepareQueryBeforeCount(xPDOQuery $c)
    {
		$product_id = $this->getProperty('product_id');
        $c->where(array('product_id' => $product_id));
        $c->innerJoin('AppColor', 'Color', 'AppProductColor.color_id = Color.id');
        $c->select('AppProductColor.*,Color.label,Color.color');

        return $c;
    }


    /**
     * @param xPDOObject $object
     *
     * @return array
     */
    public function prepareRow(xPDOObject $object)
    {
        $array = $object->toArray();
        $array['actions'] = [];

        // Edit
        $array['actions'][] = [
            'cls' => '',
            'icon' => 'icon icon-edit',
            'title' => $this->modx->lexicon('app_product_color_update'),
            //'multiple' => $this->modx->lexicon('app_product_colors_update'),
            'action' => 'updateColor',
            'button' => true,
            'menu' => true,
        ];

        // Remove
        $array['actions'][] = [
            'cls' => '',
            'icon' => 'icon icon-trash-o action-red',
            'title' => $this->modx->lexicon('app_product_color_remove'),
            'multiple' => $this->modx->lexicon('app_product_colors_remove'),
            'action' => 'removeColor',
            'button' => true,
            'menu' => true,
        ];

        return $array;
    }

}

return 'AppProductColorGetListProcessor';