<div id="content" class="container_12">
    <p>Sort by:
        <a onclick="sortByName()">name</a> ||
        <a onclick="sortByPrice()">price</a>
    <p><div id="cont"><?php echo $message; ?></div></p>
    <div id="order_history" class="grid_12">

        <div class="s_listing s_grid_view clearfix">
            <?php foreach ($page->items as $product) { ?>
                <?php
                        $category = Category::findFirst($product->c_id);
                                                                                    ?>
                <div class="grid_4">
                    <div class="s_order clearfix">
                        <p class="s_id"><span class="s_999">Product name:</span> <span class="s_main_color"><?php echo $product->name; ?></span></p>
                        <span class="clear"></span>
                        <dl class="clearfix">
                            <dt>ID::</dt>
                            <dd><?php echo $product->id; ?></dd>
                            <dt>Category::</dt>
                            <dd><?php echo $category->name; ?></dd>
                            <dt>Price::</dt>
                            <dd><?php echo $product->price; ?></dd>
                        </dl><span class="clear border_eee">
                    </span><a href="<?php echo $product->url; ?>" class="s_button_1 s_main_color_bgr"><span class="s_text">MORE</span></a><br></div></div>
            <?php } ?>
        </div>

        <div class="pagination">
            <div class="links">
                <?php if ($page->current != 1) { ?>
                    <a class="btn btn-default" onclick="changePage(1)"><i class="icon-fast-backward"></i> First</a>
                    <a class="btn btn-default" onclick="changePage(<?php echo $page->before; ?>)"><i class="icon-step-backward"></i> < </a>
                <?php } ?>
                <?php if ($page->current != $page->total_pages) { ?>
                    <a class="btn btn-default" onclick= "changePage(<?php echo $page->next; ?>)"> <i class="icon-step-forward"></i> ></a>
                    <a class="btn btn-default" onclick="changePage(<?php echo $page->last; ?>)">Last</a>
                <?php } ?>
                <span class="help-inline"><?php echo $page->current; ?>/<?php echo $page->total_pages; ?></span>
            </div>
        </div>

        <div class="clear"></div>
        <br>

        <br>

    </div>
</div>