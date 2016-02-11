<script type="text/javascript">
    sortbyname = 0;
    sortbyprice = -1;
    function changePage(pageNum) {
                $.ajax({
                    url: "<?php echo $this->url->get() . $c_name; ?>",
                    global: false,
                    type: "POST",
                    data: ({page: pageNum, sortbyname:sortbyname, sortbyprice:sortbyprice}),
                    dataType: "html",
                    success: function (msg) {
                        document.getElementById("content").innerHTML = msg;
                    }
                }
        )
    }
    function sortByName() {
        if (sortbyname == -1) sortbyname = 0;
        else {
            if(sortbyname == 0) sortbyname = 1;
            else sortbyname = 0;
        }
        sortbyprice = -1;
        changePage(1);

    }

    function sortByPrice() {
        if (sortbyprice == -1) sortbyprice = 0;
        else {
            if (sortbyprice == 0) sortbyprice = 1;
            else sortbyprice = 0;
        }
        sortbyname = -1;
        changePage(1);
    }
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
        <a onclick="sortByName()">name</a> ||
        <a onclick="sortByPrice()">price</a>
        <p><div id="cont"><?php echo $message; ?></div></p>
    <div id="category" class="grid_12">
        <div class="clear"></div>
        <div class="s_listing s_grid_view clearfix">
            <?php $v158133590120981959731iterator = $page->items; $v158133590120981959731incr = 0; $v158133590120981959731loop = new stdClass(); $v158133590120981959731loop->length = count($v158133590120981959731iterator); $v158133590120981959731loop->index = 1; $v158133590120981959731loop->index0 = 1; $v158133590120981959731loop->revindex = $v158133590120981959731loop->length; $v158133590120981959731loop->revindex0 = $v158133590120981959731loop->length - 1; ?><?php foreach ($v158133590120981959731iterator as $product) { ?><?php $v158133590120981959731loop->first = ($v158133590120981959731incr == 0); $v158133590120981959731loop->index = $v158133590120981959731incr + 1; $v158133590120981959731loop->index0 = $v158133590120981959731incr; $v158133590120981959731loop->revindex = $v158133590120981959731loop->length - $v158133590120981959731incr; $v158133590120981959731loop->revindex0 = $v158133590120981959731loop->length - ($v158133590120981959731incr + 1); $v158133590120981959731loop->last = ($v158133590120981959731incr == ($v158133590120981959731loop->length - 1)); ?>
                <?php if ($v158133590120981959731loop->index0 % 3 == 0) { ?>
                    <div class="clear" style="opacity: 1;"></div>
                <?php } ?>
                    <div class="s_item grid_3" style="opacity: 1;">
                    <a class="s_thumb" href="<?php echo $product->url; ?>"><img src="<?php echo $product->image; ?>" title="<?php echo $product->name; ?>" alt="<?php echo $product->name; ?>"></a>
                    <h3><a href="<?php echo $product->url; ?>"><?php echo $product->name; ?></a></h3>
                    <p class="s_model"><?php echo $cat_name; ?></p>
                    <p class="s_price"><span class="s_currency s_before">$</span><?php echo $product->price; ?></p>
                </div>
            <?php $v158133590120981959731incr++; } ?>


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


