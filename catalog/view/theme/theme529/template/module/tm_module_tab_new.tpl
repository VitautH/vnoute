<script>
	$(document).ready(function($) {
		$('#tabs-<?php echo $module; ?> a').click(function (e) {
			e.preventDefault()
			$(this).tab('show')
		})
	});
</script>
<div role="tabpanel" class="module_tab">
	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
		<?php if($featured_products){ ?>
		<li><a href="#tab-featured-<?php echo $module; ?>" role="tab" data-toggle="tab"><?php echo $heading_featured; ?></a></li>
		<?php } ?>
		<?php if($latest_products){ ?>
		<li class="active"><a href="#tab-latest-<?php echo $module; ?>" role="tab" data-toggle="tab"><?php echo $heading_latest; ?></a></li>
		<?php } ?>
		<?php if($special_products){ ?>
		<li><a href="#tab-specials-<?php echo $module; ?>" role="tab" data-toggle="tab"><?php echo $heading_specials; ?></a></li>
		<?php } ?>
		<?php if($bestseller_products){ ?>
		<li><a href="#tab-bestsellers-<?php echo $module; ?>" role="tab" data-toggle="tab"><?php echo $heading_bestsellers; ?></a></li>
		<?php } ?>
	</ul>

	<!-- Tab panes -->
	<div class="tab-content">
		<?php if($featured_products){ ?>
		<div role="tabpanel" class="tab-pane active" id="tab-featured-<?php echo $module; ?>">
			<div class="box clearfix">
				<?php $f=0; foreach ($featured_products as $product) { $f++ ?>
				<div class="product-layout">
					<div class="product-thumb transition">
					<div class="clearfix">
							<div class="article pull-left"><strong>Артикул:</strong> <?php echo $product['article']?></div>
							<div class="rating">
								<?php for ($i = 1; $i <= 5; $i++) { ?>
								<?php if ($product['rating'] < $i) { ?>
								<span class="fa fa-stack">
									<i class="fa fa-star-o fa-stack-2x"></i>
								</span>
								<?php } else { ?>
								<span class="fa fa-stack">
									<i class="fa fa-star fa-stack-2x"></i>
									<i class="fa fa-star-o fa-stack-2x"></i>
								</span>
								<?php } ?>
								<?php } ?>
							</div>
						</div>
						<div class="image"><a href="<?php echo $product['href']; ?>"><img alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive lazy" data-src="<?php echo $product['thumb']; ?>" src="image/catalog/preload.gif"  /></a></div>
						<div class="caption">
							<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
							<div class="description"><?php echo $product['description']; ?></div>
							

							
							<?php if ($product['price']) { ?>
							<div class="price">
								<?php if (!$product['special']) { ?>
								<?php echo $product['price']; ?>
								<?php } else { ?>
								<span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
								<?php } ?>
								<?php if ($product['tax']) { ?>
								<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
								<?php } ?>
							</div>
							<?php } ?>
							<div class="cart-button">
								<button class="btn btn-add btn-block" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');">
									<span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span>
									<i class="fa fa-shopping-cart"></i> 
								</button>
					
					</div>
				</div>
				
			</div>
		</div>
		<?php } ?>
	</div>
</div>
<?php } ?>
<?php if($latest_products){ ?>
<div role="tabpanel" class="tab-pane active" id="tab-latest-<?php echo $module; ?>">
	<div class="box clearfix">
		<?php $g=0; foreach ($latest_products as $product) { $g++ ?>
		<div class="product-layout">
			<div class="product-thumb transition">
				<div class="clearfix">
					<div class="article pull-left"><strong>Артикул:</strong> <?php echo $product['article']?></div>
					<div class="rating">
						<?php for ($i = 1; $i <= 5; $i++) { ?>
						<?php if ($product['rating'] < $i) { ?>
						<span class="fa fa-stack">
							<i class="fa fa-star-o fa-stack-2x"></i>
						</span>
						<?php } else { ?>
						<span class="fa fa-stack">
							<i class="fa fa-star fa-stack-2x"></i>
							<i class="fa fa-star-o fa-stack-2x"></i>
						</span>
						<?php } ?>
						<?php } ?>
					</div>
				</div>
				<div class="image">
					<a href="<?php echo $product['href']; ?>">
						<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
					</a>
				</div>
				<div class="caption">
					<div class="name">
						<a href="<?php echo $product['href']; ?>">
							<?php echo $product['name']; ?>
						</a>
					</div>
						<div class="description">
							<?php echo $product['description']; ?>
						</div>
						


						<?php if ($product['price']) { ?>
						<div class="price">
							<?php if (!$product['special']) { ?>
							<?php echo $product['price']; ?>
							<?php } else { ?>
							<span class="price-new">
								<?php echo $product['special']; ?>
							</span>
							<span class="price-old">
								<?php echo $product['price']; ?>
							</span>
							<?php } ?>
							<?php if ($product['tax']) { ?>
							<span class="price-tax">
								<?php echo $text_tax; ?> <?php echo $product['tax']; ?>
							</span>
							<?php } ?>
						</div>
						<?php } ?>
						<div class="cart-button">
							<button class="btn btn-add btn-block" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');">
								
								<span class="hidden-xs hidden-sm hidden-md">
									<?php echo $button_cart; ?>
								</span>
								<i class="fa fa-shopping-cart"></i>
							</button>
						</div>
					</div>
					
					<div class="clear"></div>
				</div>
			</div>
			<?php } ?>
		</div>
	</div>
	<?php } ?>
	<?php if($special_products){ ?>
	<div role="tabpanel" class="tab-pane" id="tab-specials-<?php echo $module; ?>">
		<div class="box clearfix">
			<?php $t=0; foreach ($special_products as $product) { $t++ ?>
			<div class="product-layout">
				<div class="product-thumb transition">
					<div class="clearfix">
						<div class="article pull-left"><strong>Артикул:</strong> <?php echo $product['article']?></div>
						<div class="rating">
							<?php for ($i = 1; $i <= 5; $i++) { ?>
							<?php if ($product['rating'] < $i) { ?>
							<span class="fa fa-stack">
								<i class="fa fa-star-o fa-stack-2x"></i>
							</span>
							<?php } else { ?>
							<span class="fa fa-stack">
								<i class="fa fa-star fa-stack-2x"></i>
								<i class="fa fa-star-o fa-stack-2x"></i>
							</span>
							<?php } ?>
							<?php } ?>
						</div>
					</div>
					<div class="image">
						<a href="<?php echo $product['href']; ?>">
							<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
						</a>
					</div>
					<div class="caption">
						<div class="name">
							<a href="<?php echo $product['href']; ?>">
								<?php echo $product['name']; ?>
							</a>
						</div>
						<div class="description">
							<?php echo $product['description']; ?>
						</div>



						<?php if ($product['price']) { ?>
						<div class="price">
							<?php if (!$product['special']) { ?>
							<?php echo $product['price']; ?>
							<?php } else { ?>
							<span class="price-new">
								<?php echo $product['special']; ?>
							</span>
							<span class="price-old">
								<?php echo $product['price']; ?>
							</span>
							<?php } ?>
							<?php if ($product['tax']) { ?>
							<span class="price-tax">
								<?php echo $text_tax; ?> <?php echo $product['tax']; ?>
							</span>
							<?php } ?>
						</div>
						<?php } ?>
						<div class="cart-button">
							<button class="btn btn-add btn-block" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');">
								
								<span class="hidden-xs hidden-sm hidden-md">
									<?php echo $button_cart; ?>
								</span>
								<i class="fa fa-shopping-cart"></i> 
							</button>
						</div>
						<div class="clear"></div>
					</div>
					
				</div>
			</div>
			<?php } ?>
		</div>
	</div>
	<?php } ?>
	<?php if($bestseller_products){ ?>
	<div role="tabpanel" class="tab-pane" id="tab-bestsellers-<?php echo $module; ?>">
		<div class="box clearfix">
			<?php foreach ($bestseller_products as $product) { ?>
			<div class="product-layout">
				<div class="product-thumb transition">
					<div class="clearfix">
						<div class="article pull-left"><strong>Артикул:</strong> <?php echo $product['article']?></div>
						<div class="rating">
							<?php for ($i = 1; $i <= 5; $i++) { ?>
							<?php if ($product['rating'] < $i) { ?>
							<span class="fa fa-stack">
								<i class="fa fa-star-o fa-stack-2x"></i>
							</span>
							<?php } else { ?>
							<span class="fa fa-stack">
								<i class="fa fa-star fa-stack-2x"></i>
								<i class="fa fa-star-o fa-stack-2x"></i>
							</span>
							<?php } ?>
							<?php } ?>
						</div>
					</div>
					<div class="image">
						<a href="<?php echo $product['href']; ?>">
							<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
						</a>
					</div>
					<div class="caption">
						<div class="name">
							<a href="<?php echo $product['href']; ?>">
								<?php echo $product['name']; ?>
							</a>
						</div>
						<div class="description">
							<?php echo $product['description']; ?>
						</div>



						<?php if ($product['price']) { ?>
						<div class="price">
							<?php if (!$product['special']) { ?>
							<?php echo $product['price']; ?>
							<?php } else { ?>
							<span class="price-new">
								<?php echo $product['special']; ?>
							</span>
							<span class="price-old">
								<?php echo $product['price']; ?>
							</span>
							<?php } ?>
							<?php if ($product['tax']) { ?>
							<span class="price-tax">
								<?php echo $text_tax; ?> <?php echo $product['tax']; ?>
							</span>
							<?php } ?>
						</div>
						<?php } ?>
						<div class="cart-button">
							<button class="btn btn-add btn-block" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');">
								
								<span class="hidden-xs hidden-sm hidden-md">
									<?php echo $button_cart; ?>
								</span>
								<i class="fa fa-shopping-cart"></i> 
							</button>
						</div>
						<div class="clear"></div>
					</div>
					
				</div>
			</div>
			<?php } ?>
		</div>
	</div>
	<?php } ?>
</div>
</div>

