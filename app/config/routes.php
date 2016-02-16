<?php

// Создание маршрутизатора
$router = new \Phalcon\Mvc\Router();

$categories = Category::find();
foreach($categories as $category){
    $pieces = explode("/", $category->url);
    $router->add(
        "/".$pieces[1],
        array(
            "controller" => "category",
            "action"     => "show",
            "arg" => $pieces[1]
        )
    );
}

$products = Product::find();
foreach($products as $product){
    $pieces = explode("/", $product->url);
    $router->add(
        "/".$pieces[1],
        array(
            "controller" => "product",
            "action"     => "show",
            "arg" => $pieces[1]
        )
    );
}


$router->add(
    "/products",
    array(
        "controller" => "product",
        "action"     => "index"
    )
);

$router->add(
    "/categories",
    array(
        "controller" => "category",
        "action"     => "index"
    )
);

$router->removeExtraSlashes(true);

return $router;