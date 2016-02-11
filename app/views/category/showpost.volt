<div id="content" class="container_12">
    <p>Sort by:
        <a onclick="sortByName()">name</a> ||
        <a onclick="sortByPrice()">price</a>
    <p><div id="cont">{{ message }}</div></p>
    <div id="category" class="grid_12">
        <div class="clear"></div>
        <div class="s_listing s_grid_view clearfix">
            {% for product in page.items %}
                {% if loop.index0 % 3 == 0 %}
                    <div class="clear" style="opacity: 1;"></div>
                {% endif %}
                <div class="s_item grid_3" style="opacity: 1;">
                    <a class="s_thumb" href="{{ product.url }}"><img src="{{ product.image }}" title="{{ product.name }}" alt="{{ product.name }}"></a>
                    <h3><a href="{{ product.url }}">{{ product.name }}</a></h3>
                    <p class="s_model">{{ cat_name }}</p>
                    <p class="s_price"><span class="s_currency s_before">$</span>{{ product.price }}</p>
                </div>
            {% endfor %}


            <div class="clear" style="opacity: 1;"></div>

        </div>

        <div class="pagination">
            <div class="links">
                {% if page.current != 1 %}
                    <a class="btn btn-default" onclick="changePage(1)"><i class="icon-fast-backward"></i> First</a>
                    <a class="btn btn-default" onclick="changePage({{ page.before }})"><i class="icon-step-backward"></i> < </a>
                {% endif %}
                {% if page.current != page.total_pages %}
                    <a class="btn btn-default" onclick= "changePage({{ page.next }})"> <i class="icon-step-forward"></i> ></a>
                    <a class="btn btn-default" onclick="changePage({{ page.last }})">Last</a>
                {% endif %}
                <span class="help-inline">{{ page.current }}/{{ page.total_pages }}</span>
            </div>
        </div>

    </div>


</div>