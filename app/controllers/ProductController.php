<?php

use Phalcon\Paginator\Adapter\Model as Paginator;

class ProductController extends ControllerBase
{

    public function indexAction()
    {

        $sortByName = 0;
        $sortByPrice = -1;
        if ($this->request->isPost()) {
            $page = $this->request->getPost("page");
            $sortByPrice = $this->request->getPost("sortbyprice");
            $sortByName = $this->request->getPost("sortbyname");
            $this->view->pick('product/indexpost');
            $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_ACTION_VIEW);
        } else {
            $page = $this->request->getQuery('page', 'int');
        }

        if($sortByName != -1){
            if($sortByName == 0) {
                $products = Product::find(array(
                    'order' => 'name'
                ));
            }else {
                $products = Product::find(array(
                    'order' => 'name DESC'
                ));
            }
        }

        if($sortByPrice != -1){
            if($sortByPrice == 0){
                $products = Product::find(array(
                    'order' => 'price'
                ));
            }else {
                $products = Product::find(array(
                    'order' => 'price DESC'
                ));
            }
        }

        $paginator = new Paginator(array(
            "data" => $products,
            "limit" => 9,
            "page" => $page
        ));

        $params = array("products" => $products, "page" => $paginator->getPaginate());

        $this->view->setVars($params);

    }

    public function showAction($arg)
    {
        $this->view->arg = $arg;
        $product = Product::findFirst("url = '/showcase/".$arg."'");
        $this->view->product = $product;
        $this->view->cat = Category::findFirst($product->c_id);

    }
}
