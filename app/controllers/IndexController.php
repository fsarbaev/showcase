<?php

class IndexController extends ControllerBase
{

    public function indexAction()
    {
        $products = Product::find(
            array(
                "limit" => 6
            )
        );
        $this->view->products = $products;
    }

}

