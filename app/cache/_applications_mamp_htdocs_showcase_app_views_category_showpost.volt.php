<div id="content" class="container_12">
    <p>Sort by:
        <a onclick="sortByName()">name</a> ||
        <a onclick="sortByPrice()">price</a>
    <p><div id="cont"><?php echo $message; ?></div></p>
    <div id="category" class="grid_12">
        <div class="clear"></div>
        <div class="s_listing s_grid_view clearfix">
            <?php $v99362582722184264881iterator = $page->items; $v99362582722184264881incr = 0; $v99362582722184264881loop = new stdClass(); $v99362582722184264881loop->length = count($v99362582722184264881iterator); $v99362582722184264881loop->index = 1; $v99362582722184264881loop->index0 = 1; $v99362582722184264881loop->revindex = $v99362582722184264881loop->length; $v99362582722184264881loop->revindex0 = $v99362582722184264881loop->length - 1; ?><?php foreach ($v99362582722184264881iterator as $product) { ?><?php $v99362582722184264881loop->first = ($v99362582722184264881incr == 0); $v99362582722184264881loop->index = $v99362582722184264881incr + 1; $v99362582722184264881loop->index0 = $v99362582722184264881incr; $v99362582722184264881loop->revindex = $v99362582722184264881loop->length - $v99362582722184264881incr; $v99362582722184264881loop->revindex0 = $v99362582722184264881loop->length - ($v99362582722184264881incr + 1); $v99362582722184264881loop->last = ($v99362582722184264881incr == ($v99362582722184264881loop->length - 1)); ?>
                <?php if ($v99362582722184264881loop->index0 % 3 == 0) { ?>
                    <div class="clear" style="opacity: 1;"></div>
                <?php } ?>
                <div class="s_item grid_3" style="opacity: 1;">
                    <a class="s_thumb" href="<?php echo $product->url; ?>"><img src="<?php echo $product->image; ?>" title="<?php echo $product->name; ?>" alt="<?php echo $product->name; ?>"></a>
                    <h3><a href="<?php echo $product->url; ?>"><?php echo $product->name; ?></a></h3>
                    <p class="s_model"><?php echo $cat_name; ?></p>
                    <p class="s_price"><span class="s_currency s_before">$</span><?php echo $product->price; ?></p>
                </div>
            <?php $v99362582722184264881incr++; } ?>


            <div class="clear" style="opacity: 1;"></div>

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

    </div>


</div>