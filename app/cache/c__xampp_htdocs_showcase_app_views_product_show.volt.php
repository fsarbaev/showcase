<div id="content" class="product_view container_12">
    <div id="product" class="grid_12">
        <div id="product_images" class="grid_6 alpha">
              <?php
                 $url = "/showcase/product/show/".$arg;
                 $product = Product::findFirst("url = '".$url."'");
                 echo '<img id="image" src="'.$product->image.'" title="'.$product->name.'" alt="'.$product->name.'">';
              ?>
        </div>

        <div id="product_info" class="grid_6 omega">
                        <?php
                            echo '<p class="s_price s_promo_price"><br>'.$product->price.'<span class="s_currency s_after">$</span></p>';
                            echo '<dl class="clearfix">';
                            echo '<dt>Availability</dt><dd>In Stock</dd>';
                            echo '<dt>Name</dt><dd>'.$product->name.'</dd>';
                            $cat = Category::findFirst($product->c_id);
                            echo '<dt>Category</dt><dd><a href="'.$cat->url.'" id="category_name">'.$cat->name.'</a></dd></dl>';
                        ?>
        </div>
    </div>
</div>