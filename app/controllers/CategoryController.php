<?php

use Phalcon\Paginator\Adapter\Model as Paginator;
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

        $category = Category::findFirst("url = './" . $c_name . "'");
        
        if($sortByName != -1){
            if($sortByName == 0) {
                $products = $this->modelsManager->executeQuery("SELECT p.id, p.c_id, p.name,
                    p.price, p.url, p.image, p.description AS product FROM product p, incategory ic
                        WHERE ic.c_id = :c_id: AND ic.p_id = p.id ORDER BY p.name",
                            array('c_id' => $category->id));
            }else {
                $products = $this->modelsManager->executeQuery("SELECT p.id, p.c_id, p.name,
                    p.price, p.url, p.image, p.description AS product FROM product p, incategory ic
                        WHERE ic.c_id = :c_id: AND ic.p_id = p.id ORDER BY p.name DESC",
                    array('c_id' => $category->id));
            }
        }

        if($sortByPrice != -1){
            if($sortByPrice == 0){
                $products = $this->modelsManager->executeQuery("SELECT p.id, p.c_id, p.name,
                    p.price, p.url, p.image, p.description AS product FROM product p, incategory ic
                        WHERE ic.c_id = :c_id: AND ic.p_id = p.id ORDER BY p.price",
                    array('c_id' => $category->id));
            }else {
                $products = $this->modelsManager->executeQuery("SELECT p.id, p.c_id, p.name,
                    p.price, p.url, p.image, p.description AS product FROM product p, incategory ic
                        WHERE ic.c_id = :c_id: AND ic.p_id = p.id ORDER BY p.price DESC",
                    array('c_id' => $category->id));
            }
        }

        $paginator = new Paginator(array(
            "data" => $products,
            "limit" => 9,
            "page" => $page
        ));

        $params = array("page" => $paginator->getPaginate(), "products" => $products, "cat_name" => $category->name,
            "c_name" => $c_name);

        $this->view->setVars($params);

    }

}
