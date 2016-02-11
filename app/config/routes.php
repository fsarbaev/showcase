<?php

// Создание маршрутизатора
$router = new \Phalcon\Mvc\Router();

$router->add(
    "/(c_[0-9a-zA-Z\_\-]+)/([0-9]*)",
    array(
        "controller" => "category",
        "action"     => "show",
        "cat_name" => 1,
        "page" => 2
    )
);

$router->add(
    "/(c_[0-9a-zA-Z\_\-]+)",
    array(
        "controller" => "category",
        "action"     => "show",
        "cat_name" => 1
    )
);

$router->add(
    "/((?!c_)[0-9a-zA-Z\_\-]+)",
    array(
        "controller" => "product",
        "action"     => "show",
        "arg" => 1
    )
);

/*$categories = Category::find();
foreach($categories as $category){
    $pieces = explode("/", $category->url);
    $router->add(
        "/".$pieces[2],
        array(
            "controller" => "category",
            "action"     => "show",
            "arg" => $pieces[2]
        )
    );
}

$products = Product::find();
foreach($products as $product){
    $pieces = explode("/", $product->url);
    $router->add(
        "/".$pieces[2],
        array(
            "controller" => "product",
            "action"     => "show",
            "arg" => $pieces[2]
        )
    );
}
*/

$router->add(
    "/product",
    array(
        "controller" => "product",
        "action"     => "index"
    )
);

$router->add(
    "/category",
    array(
        "controller" => "category",
        "action"     => "index"
    )
);


return $router;