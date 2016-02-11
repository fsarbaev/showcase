<div id="content" class="product_view container_12">
    <div id="product" class="grid_12">
        <div id="product_images" class="grid_6 alpha">
              <img id="image" src="<?php echo $product->image; ?>" title="<?php echo $product->name; ?>" alt="<?php echo $product->name; ?>">
        </div>

        <div id="product_info" class="grid_6 omega">
                            <p class="s_price s_promo_price"><br><?php echo $product->price; ?><span class="s_currency s_after">$</span></p>
                            <dl class="clearfix">
                            <dt>Availability</dt><dd>In Stock</dd>
                            <dt>Name</dt><dd><?php echo $product->name; ?></dd>
                            <dt>Category</dt><dd><a href="<?php echo $cat->url; ?>" id="category_name"><?php echo $cat->name; ?></a></dd></dl>
        </div>
    </div>
</div>