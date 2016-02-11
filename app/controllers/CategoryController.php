<?php

use Phalcon\Paginator\Adapter\NativeArray as Paginator;
use Phalcon\Mvc\View\Simple as SimpleView;

class CategoryController extends ControllerBase
{

    public function indexAction()
    {
        $categories = Category::find();
        $this->view->categories = $categories;

    }

    /**
     * @param $c_name
     */
    public function showAction($c_name)
    {
        $sortByName = 0;
        $sortByPrice = -1;
        if ($this->request->isPost()) {
            $page = $this->request->getPost("page");
            $sortByPrice = $this->request->getPost("sortbyprice");
            $sortByName = $this->request->getPost("sortbyname");
            $this->view->pick('category/showpost');
            $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
        } else {
            $page = $this->request->getQuery('page', 'int');
        }

        $category = Category::findFirst("url = '/showcase/" . $c_name . "'");

        function cmpByName($a, $b)
        {
            if ($a->name == $b->name) {
                return 0;
            }
            return ($a->name < $b->name) ? -1 : 1;
        }

        function cmpByPrice($a, $b)
        {
            if ($a->price == $b->price) {
                return 0;
            }
            return ($a->price > $b->price) ? -1 : 1;
        }

        $inCat = InCategory::find("c_id=" . $category->id);
        $prod = array();
        foreach ($inCat as $inc) {
            array_push($prod, $inc->product);
        }

        if($sortByName != -1){
            usort($prod,"cmpByName");
            if($sortByName != 0)  $prod = array_reverse($prod);
        }
        if($sortByPrice != -1){
            usort($prod, "cmpByPrice");
            if($sortByPrice != 0)  $prod = array_reverse($prod);
        }

        $paginator = new Paginator(array(
            "data" => $prod,
            "limit" => 9,
            "page" => $page
        ));

        $params = array("page" => $paginator->getPaginate(), "products" => $prod, "cat_name" => $category->name,
            "c_name" => $c_name);

        $this->view->setVars($params);

    }

}
