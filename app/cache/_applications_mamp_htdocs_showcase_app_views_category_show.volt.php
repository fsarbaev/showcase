<script type="text/javascript">

</script>


<div id="intro">
    <div id="intro_wrap">
        <div class="container_12">
            <h1><?php echo $cat_name; ?></h1>
        </div>
    </div>
</div>

<div id="content" class="container_12">
    <p>Sort by:
        <a onclick="sortByName('<?php echo $this->url->get() . $c_name; ?>')">name</a> ||
        <a onclick="sortByPrice('<?php echo $this->url->get() . $c_name; ?>')">price</a>
    <div id="category" class="grid_12">
        <div class="clear"></div>
        <div class="s_listing s_grid_view clearfix">
            <?php $v172077673016493502901iterator = $page->items; $v172077673016493502901incr = 0; $v172077673016493502901loop = new stdClass(); $v172077673016493502901loop->length = count($v172077673016493502901iterator); $v172077673016493502901loop->index = 1; $v172077673016493502901loop->index0 = 1; $v172077673016493502901loop->revindex = $v172077673016493502901loop->length; $v172077673016493502901loop->revindex0 = $v172077673016493502901loop->length - 1; ?><?php foreach ($v172077673016493502901iterator as $product) { ?><?php $v172077673016493502901loop->first = ($v172077673016493502901incr == 0); $v172077673016493502901loop->index = $v172077673016493502901incr + 1; $v172077673016493502901loop->index0 = $v172077673016493502901incr; $v172077673016493502901loop->revindex = $v172077673016493502901loop->length - $v172077673016493502901incr; $v172077673016493502901loop->revindex0 = $v172077673016493502901loop->length - ($v172077673016493502901incr + 1); $v172077673016493502901loop->last = ($v172077673016493502901incr == ($v172077673016493502901loop->length - 1)); ?>
                <?php if ($v172077673016493502901loop->index0 % 3 == 0) { ?>
                    <div class="clear" style="opacity: 1;"></div>
                <?php } ?>
                    <div class="s_item grid_3" style="opacity: 1;">
                    <a class="s_thumb" href="<?php echo $product->url; ?>"><img src="<?php echo $product->image; ?>" title="<?php echo $product->name; ?>" alt="<?php echo $product->name; ?>"></a>
                    <h3><a href="<?php echo $product->url; ?>"><?php echo $product->name; ?></a></h3>
                    <p class="s_model"><?php echo $cat_name; ?></p>
                    <p class="s_price"><span class="s_currency s_before">$</span><?php echo $product->price; ?></p>
                </div>
            <?php $v172077673016493502901incr++; } ?>


            <div class="clear" style="opacity: 1;"></div>

        </div>

        <div class="pagination">
            <div class="links">
                <?php if ($page->current != 1) { ?>
                    <a class="btn btn-default" onclick="changePage(1, '<?php echo $this->url->get() . $c_name; ?>')"><i class="icon-fast-backward"></i> First</a>
                    <a class="btn btn-default" onclick="changePage(<?php echo $page->before; ?>, '<?php echo $this->url->get() . $c_name; ?>')"><i class="icon-step-backward"></i> < </a>
                <?php } ?>
                <?php if ($page->current != $page->total_pages) { ?>
                    <a class="btn btn-default" onclick= "changePage(<?php echo $page->next; ?>, '<?php echo $this->url->get() . $c_name; ?>')"> <i class="icon-step-forward"></i> ></a>
                    <a class="btn btn-default" onclick="changePage(<?php echo $page->last; ?>, '<?php echo $this->url->get() . $c_name; ?>')">Last</a>
                <?php } ?>
                <span class="help-inline"><?php echo $page->current; ?>/<?php echo $page->total_pages; ?></span>
            </div>
        </div>

    </div>


</div>


