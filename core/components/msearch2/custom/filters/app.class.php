<?php
class AppFilter extends mse2FiltersHandler {

	public function getMsColorValues(array $fields, array $ids) {
		$filters = array();
		$q = $this->modx->newQuery('AppProductColor');
		$q->where(array('product_id:IN' => $ids));
		$q->select('product_id,' . implode(',', $fields));
		$tstart = microtime(true);
		if ($q->prepare() && $q->stmt->execute()) {
			$this->modx->queryTime += microtime(true) - $tstart;
			$this->modx->executedQueries++;
			while ($row = $q->stmt->fetch(PDO::FETCH_ASSOC)) {
                $filters['color_id'][$row['color_id']][$row['product_id']] = $row['product_id'];
			}
		}
		else {
			$this->modx->log(modX::LOG_LEVEL_ERROR, "[mSearch2] Error on get filter params.\nQuery: " . $q->toSQL() .
				"\nResponse: " . print_r($q->stmt->errorInfo(), 1)
			);
		}

		return $filters;
	}

    public function buildColorFilter(array $values) {
        if (count($values) < 2 && empty($this->config['showEmptyFilters'])) {
            return array();
        }

        $results = array();
        foreach ($values as $value => $ids) {
            if (!isset($results[$value])) {
                $AppColor = $this->modx->getObject('AppColor', $value);
                $results[$value] = array(
                    'title' => $AppColor->get('label')
                    ,'value' => $value
                    ,'type' => $AppColor->get('color')
                    ,'resources' => array()
                );
            }

            foreach ($ids as $id) {
                $results[$value]['resources'][] = $id;
            }
        }

        ksort($results);
        return $results;
    }

}